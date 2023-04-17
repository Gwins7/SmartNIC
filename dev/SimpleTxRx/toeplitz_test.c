#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

pthread_mutex_t print_lock;

unsigned int sw_hash(unsigned int s[],unsigned long int hash_seed[]){
	unsigned int sw_result = 0;
    unsigned long int test[2],seed[2];
    test[0] = ((unsigned long int)s[0] << 32) + s[1];
    test[1] = ((unsigned long int)s[2] << 32);
    seed[0] = hash_seed[0];
    seed[1] = hash_seed[1];
	int i,k;
	for (k=0;k<2;k++)
		for (i=0;i<64;i++){
            if (((test[k] << i) & 0x8000000000000000) == 0x8000000000000000) sw_result ^= (seed[0] >> 32);
            seed[0] = (seed[0] << 1) | (seed[1] >> 63);
            seed[1] = seed[1] << 1;
	}
	return sw_result & 0xf;
}

void data_atoi(char *s, unsigned long int *result){
    // result[2];s[24]
    int i;
    for (i=0;i<24;i++,s++){
        int index = i/16;
        int cur = (*s >= 'a')?(10+*s-'a'):(*s-'0');
        result[index] = (result[index] << 4) + cur;
    }
    result[1] = result[1] << 32;
    return;
}

int pthread_process(unsigned int queue_id){
    char filename[12];
    snprintf(filename,12,"dump_log_%d",queue_id);

    unsigned long int t[2],r[2],hashseed[2];
    hashseed[0] = 0x6d5a6d5a6d5a6d5a;
    hashseed[1] = 0x6d5a6d5a6d5a6d5a;
    char tmp[26]; //actual-use = 24
    int cmp_fail = 0;
    int i,t_res,r_res;
    FILE *fd = fopen(filename,"r");
    fseek(fd, 0, SEEK_SET);
    while(fread(tmp,25,1,fd)!=0) {
        for (i=0;i<1;i++){
            t[i]=0;r[i]=0;
        }
        data_atoi(tmp,t);
        r[0] = (t[0] << 32) | (t[0] >> 32);
        r[1] = (t[1] << 48) | ((t[1] << 16) & 0x0000ffff00000000);

        t_res = sw_hash(t,hashseed);
        r_res = sw_hash(r,hashseed);
        if (t_res != r_res || t_res != queue_id) {
            cmp_fail = 1;
            goto done;
        }
    }
done:
    fclose(fd);
    pthread_mutex_lock(&print_lock);
    printf("queue %2d's test result %s!\n",queue_id,cmp_fail?"fail":"success");
    if (cmp_fail) {
        printf("info: (t_res = %2d,r_res = %2d)\n",t_res,r_res);
        printf("t[2] = %016lx %016lx\nr[2] = %016lx %016lx\n",t[0],t[1],r[0],r[1]);
    }
    pthread_mutex_unlock(&print_lock);
    return cmp_fail;
}

void main(void){
    int thread_num = 16;
    int i,res,thread_res[16];
    pthread_t *handler = malloc(thread_num * sizeof(pthread_t));
    pthread_mutex_init(&print_lock,NULL);
    for (i=0;i<thread_num;i++){
        pthread_create(&handler[i],NULL,pthread_process,i);
    }
    for (i=0;i<thread_num;i++){
        pthread_join(handler[i],&thread_res[i]);
    }
    // printf("[Overall] test finished!\n");
    free(handler);
    res = 0;
    for (i=0;i<thread_num;i++) res |= thread_res[i];
    if (res)  printf("[Overall] test fail!\n");
    else printf("[Overall] test success!\n");
    return;
}