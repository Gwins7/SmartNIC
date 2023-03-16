#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

pthread_mutex_t print_lock;

unsigned int sw_hash(unsigned int s[],unsigned int hash_seed,unsigned int hash_mask){
	unsigned int sw_result = 0;
	int i,k;
	for (k=0;k<3;k++)
		for (i=0;i<32;i++){
            if (((s[k] << i) & 0x80000000) == 0x80000000) sw_result ^= hash_seed;
            hash_seed = (hash_seed << 1) | (hash_seed >> 31);
	}
	return sw_result & hash_mask;
}

void data_atoi(char *s, unsigned int *result){
    // result[3];s[24]
    int i;
    for (i=0;i<24;i++,s++){
        int index = i/8;
        int cur = (*s >= 'a')?(10+*s-'a'):(*s-'0');
        result[index] = (result[index] << 4) + cur;
    }
    return;
}

int pthread_process(unsigned int queue_id){
    char filename[12];
    snprintf(filename,12,"dump_log_%d",queue_id);

    unsigned int t[3],r[3];
    char tmp[26]; //actual-use = 24
    int cmp_fail = 0;
    int i,t_res,r_res;
    FILE *fd = fopen(filename,"r");
    fseek(fd, 0, SEEK_SET);
    while(fread(tmp,25,1,fd)!=0) {
        for (i=0;i<3;i++){
            t[i]=0;r[i]=0;
        }
        data_atoi(tmp,t);
        r[0]=t[1];
        r[1]=t[0];
        r[2]=(t[2] << 16) | (t[2] >> 16);
        t_res = sw_hash(t,0x6d5a6d5a,0xf);
        r_res = sw_hash(r,0x6d5a6d5a,0xf);
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
        printf("t[3] = %08x %08x %08x\nr[3] = %08x %08x %08x\n",t[0],t[1],t[2],r[0],r[1],r[2]);
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