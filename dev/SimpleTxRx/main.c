/* SPDX-License-Identifier: BSD-3-Clause
 * Copyright(c) 2010-2016 Intel Corporation
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <inttypes.h>
#include <sys/types.h>
#include <sys/queue.h>
#include <netinet/in.h>
#include <setjmp.h>
#include <stdarg.h>
#include <ctype.h>
#include <errno.h>
#include <getopt.h>
#include <signal.h>
#include <stdbool.h>

#include <rte_common.h>
#include <rte_log.h>
#include <rte_malloc.h>
#include <rte_memory.h>
#include <rte_memcpy.h>
#include <rte_eal.h>
#include <rte_launch.h>
#include <rte_atomic.h>
#include <rte_cycles.h>
#include <rte_prefetch.h>
#include <rte_lcore.h>
#include <rte_per_lcore.h>
#include <rte_branch_prediction.h>
#include <rte_interrupts.h>
#include <rte_random.h>
#include <rte_debug.h>
#include <rte_ether.h>
#include <rte_ethdev.h>
#include <rte_mempool.h>
#include <rte_mbuf.h>

#include <rte_ip.h>
#include <rte_tcp.h>
#include <rte_ether.h>

#include "../../drivers/net/qdma/rte_pmd_qdma.h"

#define LOG_IP_PORT 0
#define LOG_ALL     0

#define H2C_PACK_COUNTER 0x0100
#define H2C_ERR_COUNTER  0x0104
#define C2H_PACK_COUNTER 0x0108
#define C2H_ERR_COUNTER  0x010C
#define RESET_COUNTER    0x0110
#define PKGHDLR_OP     0x0114
#define PKGHDLR_ARG0   0x0118
#define PKGHDLR_ARG1   0x011C
#define PKGHDLR_ARG2   0x0120
#define PKGHDLR_ARG3   0x0124
#define PKGHDLR_ARG4   0x0128
#define PKGHDLR_ARG5   0x012C
#define PKGHDLR_ARG6   0x0130
#define PKGHDLR_ARG7   0x0134
#define PKGHDLR_ARG8   0x0138
#define PKGHDLR_ARG9   0x013C
#define PKGHDLR_ARG10  0x0140
#define PKGHDLR_ARG11  0x0144
#define PKGHDLR_ARG12  0x0148
#define PKGHDLR_ARG13  0x014C
#define PKGHDLR_ARG14  0x0150
#define PKGHDLR_ARG15  0x0154

   // address 0x0100 : h2c_pack_counter
   // address 0x0104 : h2c_err_counter
   // address 0x0108 : c2h_pack_counter
   // address 0x010C : c2h_err_counter
   // address 0x0110 : reset_counter

   // address 0x0114 : PKGHDLR_op
   // address 0x0118 : PKGHDLR_arg0
   // address 0x011C : PKGHDLR_arg1
   // address 0x0120 : PKGHDLR_arg2
   // address 0x0124 : PKGHDLR_arg3
   // address 0x0128 : PKGHDLR_arg4
   // address 0x012C : PKGHDLR_arg5
   // address 0x0130 : PKGHDLR_arg6
   // address 0x0134 : PKGHDLR_arg7
   // address 0x0138 : PKGHDLR_arg8
   // address 0x013C : PKGHDLR_arg9
   // address 0x0140 : PKGHDLR_arg10
   // address 0x0144 : PKGHDLR_arg11
   // address 0x0148 : PKGHDLR_arg12
   // address 0x014C : PKGHDLR_arg13
   // address 0x0150 : PKGHDLR_arg14
   // address 0x0154 : PKGHDLR_arg15

struct rte_mbuf ** save_mbufs[16];
//int save_head[16] = {0};

static int dump_mbuf_all(struct rte_mbuf * mbuf ,int fd );
int save_fd[16];

void qdma_pci_write_reg(struct rte_eth_dev *dev, uint32_t bar, uint32_t reg,
				uint32_t val);
uint32_t qdma_pci_read_reg(struct rte_eth_dev *dev, uint32_t bar, uint32_t reg);

static volatile bool force_quit;

/* MAC updating enabled by default */
static int mac_updating = 1;

#define RTE_LOGTYPE_L2FWD RTE_LOGTYPE_USER1

#define TX_QUEUE_NUM 1
#define RX_QUEUE_NUM 16

#define MAX_PKT_BURST 32
#define BURST_TX_DRAIN_US 100 /* TX drain every ~100us */
#define MEMPOOL_CACHE_SIZE 256
#define MBUF_SIZE 2048
#define PKT_SIZE 1450
#define NB_MBUFS 256*1024
#define NB_PKT_MBUF 1024

#define SRC_IP_LOOP 16
#define swab16(x) ((x&0x00ff) << 8 | (x&0xff00) >> 8)
#define swab32(x) ((x&0x000000ff) << 24 | (x&0x0000ff00) << 8 | (x&0x00ff0000) >> 8 | (x&0xff000000) >> 24)
/*
 * Configurable number of RX/TX ring descriptors
 */
#define RTE_TEST_RX_DESC_DEFAULT 1024
#define RTE_TEST_TX_DESC_DEFAULT 1024
static uint16_t nb_rxd = RTE_TEST_RX_DESC_DEFAULT;
static uint16_t nb_txd = RTE_TEST_TX_DESC_DEFAULT;

/* ethernet addresses of ports */
static struct rte_ether_addr l2fwd_ports_eth_addr[RTE_MAX_ETHPORTS];

/* mask of enabled ports */
static uint32_t l2fwd_enabled_port_mask = 0;

/* list of enabled ports */
static uint32_t l2fwd_dst_ports[RTE_MAX_ETHPORTS];

static unsigned int l2fwd_rx_queue_per_lcore = 1;

#define MAX_RX_QUEUE_PER_LCORE 16
#define MAX_TX_QUEUE_PER_PORT 16
struct lcore_queue_conf {
	unsigned n_rx_port;
	unsigned rx_port_list[MAX_RX_QUEUE_PER_LCORE];
} __rte_cache_aligned;
struct lcore_queue_conf lcore_queue_conf[RTE_MAX_LCORE];

static struct rte_eth_dev_tx_buffer *tx_buffer[RTE_MAX_ETHPORTS];

static struct rte_eth_conf port_conf = {
	.rxmode = {
		.split_hdr_size = 0,
	},
	.txmode = {
		.mq_mode = ETH_MQ_TX_NONE,
	},
};

struct rte_mempool * l2fwd_pktmbuf_pool = NULL;

/* Per-port statistics struct */
struct l2fwd_port_statistics {
	uint64_t tx[TX_QUEUE_NUM];
	uint64_t rx[RX_QUEUE_NUM];
	uint64_t dropped;
} __rte_cache_aligned;
struct l2fwd_port_statistics port_statistics[RTE_MAX_ETHPORTS];

#define MAX_TIMER_PERIOD 86400 /* 1 day max */
/* A tsc-based timer responsible for triggering statistics printout */
static uint64_t timer_period = 1; /* default period is 10 seconds */

int config_bar_idx, user_bar_idx, bypass_bar_idx;

rte_spinlock_t sent_lock;

static void build_ip_head_data(struct rte_mbuf *mbuf,int size ,int seq, int queueid,int type)
{ 
	struct rte_ipv4_hdr *ip;
	mbuf->l3_len = 20;
	ip = rte_pktmbuf_mtod_offset(mbuf,struct rte_ipv4_hdr *, sizeof(struct rte_ether_hdr));
	//mbuf->l4_len = (TCP_HEADER_LEN + optlen);
	//mbuf->payload_len = 0;
	
    ip->version_ihl = 0x45;
	ip->type_of_service=0;
    ip->total_length =rte_cpu_to_be_16( size - sizeof(struct rte_ether_hdr) );
	ip->packet_id= 1;
	ip->fragment_offset=rte_cpu_to_be_16(0x4000);

	ip->time_to_live=64;
	ip->hdr_checksum=0;
	if(type == 0 ){
    	ip->src_addr = swab32(RTE_IPV4(192, 168, 0, 0));
    	ip->dst_addr = swab32(RTE_IPV4(192, 168, 0, 1));
    	} else {
    	ip->dst_addr = swab32(RTE_IPV4(15, 15, 2, seq % SRC_IP_LOOP));
    	ip->src_addr = swab32(RTE_IPV4(15, 15, 1, seq % SRC_IP_LOOP));

 	}
	ip->hdr_checksum=0;
	ip->next_proto_id = 6;

} 

static void build_tcp_head_data(struct rte_mbuf *mbuf,int type)
{ 
	struct rte_tcp_hdr *tcp_head;
	tcp_head = rte_pktmbuf_mtod_offset(mbuf,struct rte_tcp_hdr *, sizeof(struct rte_ether_hdr) + sizeof(struct rte_ipv4_hdr));
	static int srcport = 0;
	static int dstport = 0;
	mbuf->l4_len = sizeof(struct rte_tcp_hdr);
	if(type == 0 ) {
		tcp_head->src_port = rte_cpu_to_be_16(1000);
		tcp_head->dst_port = rte_cpu_to_be_16(80);

	} else if(type ==1 ){
		tcp_head->src_port = rte_cpu_to_be_16(1000);
		tcp_head->dst_port = rte_cpu_to_be_16(81);
	} else if(type == 2) {

		tcp_head->src_port = rte_cpu_to_be_16(1000 + srcport);
		tcp_head->dst_port = rte_cpu_to_be_16(80);
		srcport = (srcport + 1) % 200;
	} else if(type == 3) {

		tcp_head->src_port = rte_cpu_to_be_16(80);
		tcp_head->dst_port = rte_cpu_to_be_16(1000 + dstport);
		dstport = (dstport + 1) % 200;
 	}

	tcp_head->data_off=(sizeof(struct rte_tcp_hdr)/4<<4|0);
	if(type == 0 || type == 1) {
		tcp_head->tcp_flags=0x02; //syn
	}else if(type ==2 ){
		tcp_head->tcp_flags=0x10; //ack
	}
	tcp_head->rx_win=htons(14600);
	tcp_head->cksum=0;
	tcp_head->tcp_urp=0;

} 

static void build_ether_head_data(struct rte_mbuf *mbuf, int type)
{

    struct rte_ether_hdr *eth;
    //uint8_t *tmp;
	mbuf->l2_len = 14;
    eth = rte_pktmbuf_mtod(mbuf, struct rte_ether_hdr *);
	if ( type == 0 ) {
    //90:e2:ba:16:22:99
    	eth->d_addr.addr_bytes[0] =  0x90;
    	eth->d_addr.addr_bytes[1] =  0xe2;
    	eth->d_addr.addr_bytes[2] =  0xba;
    	eth->d_addr.addr_bytes[3] =  0x16;
    	eth->d_addr.addr_bytes[4] =  0x22;
    	eth->d_addr.addr_bytes[5] =  0x98;
    /*src addr */

    //90:e2:ba:14:c5:e0
    	eth->s_addr.addr_bytes[0] =  0xaa;
    	eth->s_addr.addr_bytes[1] =  0xbb;
    	eth->s_addr.addr_bytes[2] =  0xcc;
    	eth->s_addr.addr_bytes[3] =  0xdd;
    	eth->s_addr.addr_bytes[4] =  0xee;
    	eth->s_addr.addr_bytes[5] =  0xff;
	} else {

    	eth->s_addr.addr_bytes[0] =  0x90;
    	eth->s_addr.addr_bytes[1] =  0xe2;
   		eth->s_addr.addr_bytes[2] =  0xba;
    	eth->s_addr.addr_bytes[3] =  0x16;
    	eth->s_addr.addr_bytes[4] =  0x22;
    	eth->s_addr.addr_bytes[5] =  0x98;
    /*src addr */

    //90:e2:ba:14:c5:e0
    	eth->d_addr.addr_bytes[0] =  0xaa;
    	eth->d_addr.addr_bytes[1] =  0xbb;
    	eth->d_addr.addr_bytes[2] =  0xcc;
    	eth->d_addr.addr_bytes[3] =  0xdd;
    	eth->d_addr.addr_bytes[4] =  0xee;
    	eth->d_addr.addr_bytes[5] =  0xff;
	}
    /*ether_type*/
    eth->ether_type = rte_cpu_to_be_16(0x0800);
}

int populate_pkts(struct rte_mbuf **buf, int qid){
	int i;
	printf("populate_pkts\n");
	for (i = 0; i < NB_PKT_MBUF; i++)
	{
		if (l2fwd_pktmbuf_pool == NULL) {
			printf("Could not find mempool\n");
			//rte_spinlock_unlock(&pinfo[port_id].port_update_lock);
			return -1;
		}
		
		buf[i] = rte_pktmbuf_alloc(l2fwd_pktmbuf_pool);
		if (buf[i] == NULL) {
			printf(" #####Cannot "
					"allocate mbuf packet\n");
			return -1;
		}

		uint16_t size = PKT_SIZE;
		char* data = rte_pktmbuf_mtod(buf[i], char *);

		int a;
		for (a=64;a<PKT_SIZE;a++) *(data+a) = rand()&0xff;

		build_ether_head_data(buf[i], 0);
		build_ip_head_data(buf[i], PKT_SIZE, i, qid, 0);
		build_tcp_head_data(buf[i], 0);

		buf[i]->nb_segs = 1;
		buf[i]->next = NULL;
		rte_pktmbuf_data_len(buf[i]) = (uint16_t)size;
		rte_pktmbuf_pkt_len(buf[i])  = (uint16_t)size;
	}
	return 0;
}

/* Print out statistics on packets dropped */
static void
print_stats(void)
{
	uint64_t total_packets_dropped, total_packets_tx, total_packets_rx;
	unsigned portid;

	total_packets_dropped = 0;
	total_packets_tx = 0;
	total_packets_rx = 0;
	// static uint64_t cur_time = 0;
	const char clr[] = { 27, '[', '2', 'J', '\0' };
	const char topLeft[] = { 27, '[', '1', ';', '1', 'H','\0' };

		/* Clear screen and move to top left */
	printf("%s%s", clr, topLeft);

	printf("\nPort statistics ====================================");

	for (portid = 0; portid < /*RTE_MAX_ETHPORTS*/32; portid++) {
		/* skip disabled ports */
		if ((l2fwd_enabled_port_mask & (1 << portid)) == 0)
			continue;
		printf("\nStatistics for port %u ------------------------------",portid);
		int i;
		for (i=0;i<TX_QUEUE_NUM;i++){
			printf("\nPackets sent (queue %2d): %13"PRIu64,
					i,
					port_statistics[portid].tx[i]);
		}

		for (i=0;i<RX_QUEUE_NUM;i++){
			printf("\nPackets received (queue %2d): %9"PRIu64,
					i,
					port_statistics[portid].rx[i]);
		}
			   
			  printf( "\nPackets dropped: %21"PRIu64,
			  		port_statistics[portid].dropped);

		total_packets_dropped += port_statistics[portid].dropped;
		for (i=0;i<TX_QUEUE_NUM;i++){
		total_packets_tx += port_statistics[portid].tx[i];
		}
		for (i=0;i<RX_QUEUE_NUM;i++){
		total_packets_rx += port_statistics[portid].rx[i];
		}
	}
	printf("\nAggregate statistics ==============================="
		   "\nTotal packets sent: %18"PRIu64
		   "\nTotal packets received: %14"PRIu64
		   "\nTotal packets dropped: %15"PRIu64
		   "\nHardware h2c packet: %17"PRIu64
		   "\nHardware h2c error: %18"PRIu64
		   "\nHardware c2h packet: %17"PRIu64
		   "\nHardware c2h error: %18"PRIu64
		   ,
		   total_packets_tx,
		   total_packets_rx,
		   total_packets_dropped,
		   (long unsigned)qdma_pci_read_reg(&rte_eth_devices[0],user_bar_idx, H2C_PACK_COUNTER),
		   (long unsigned)qdma_pci_read_reg(&rte_eth_devices[0],user_bar_idx, H2C_ERR_COUNTER),
		   (long unsigned)qdma_pci_read_reg(&rte_eth_devices[0],user_bar_idx, C2H_PACK_COUNTER),
		   (long unsigned)qdma_pci_read_reg(&rte_eth_devices[0],user_bar_idx, C2H_ERR_COUNTER)
		   );
	printf("\n====================================================\n");
	// cur_time = timer_tsc;
	fflush(stdout);
}

static void
l2fwd_mac_updating(struct rte_mbuf *m, unsigned dest_portid)
{
	struct rte_ether_hdr *eth;
	// void *tmp;

	eth = rte_pktmbuf_mtod(m, struct rte_ether_hdr *);

	/* 02:00:00:00:00:xx */
	// tmp = &eth->d_addr.addr_bytes[0];
	// *((uint64_t *)tmp) = 0x000000000002 + ((uint64_t)dest_portid << 40);

	/* src addr */
	rte_ether_addr_copy(&eth->s_addr, &eth->d_addr);
	rte_ether_addr_copy(&l2fwd_ports_eth_addr[dest_portid], &eth->s_addr);
}

static void
l2fwd_simple_forward(struct rte_mbuf *m, unsigned portid, uint16_t lcore_id)
{
	unsigned dst_port;
	int sent;
	struct rte_eth_dev_tx_buffer *buffer;

	dst_port = l2fwd_dst_ports[portid];
	int queue_id = lcore_id%TX_QUEUE_NUM;
	if (mac_updating)
		l2fwd_mac_updating(m, dst_port);

	buffer = tx_buffer[queue_id];
	sent = rte_eth_tx_buffer(dst_port, queue_id, buffer, m);
	// if (sent)
	// 	port_statistics[dst_port].tx += sent;
}


static int dump_mbuf_ip_port(struct rte_mbuf * mbuf ,int fd )
{
	int ret = 0;

	struct rte_ipv4_hdr *ipv4_head;
	int sip_id;
	int dip_id;
	ipv4_head = rte_pktmbuf_mtod_offset(mbuf,struct rte_ipv4_hdr *, sizeof(struct rte_ether_hdr));

	struct rte_tcp_hdr *tcp_head;
	tcp_head = rte_pktmbuf_mtod_offset(mbuf,struct rte_tcp_hdr *, sizeof(struct rte_ether_hdr) + sizeof(struct rte_ipv4_hdr));
	uint16_t src_port = tcp_head->src_port;
	uint16_t dst_port = tcp_head->dst_port;
	fprintf(fd,"%08x%08x%04x%04x\n",rte_be_to_cpu_32(ipv4_head->src_addr),rte_be_to_cpu_32(ipv4_head->dst_addr),
									rte_be_to_cpu_16(src_port),rte_be_to_cpu_16(dst_port));
	fflush(fd);
	return ret;
}


static int dump_mbuf_all(struct rte_mbuf * mbuf ,int fd )
{
	int ret = 0;
	uint32_t *dump;	
	int i = 0;
	dump = rte_pktmbuf_mtod(mbuf,uint32_t *);
	for(i = 0; i < 256 ; i = i + 4 ) 
	{
		
		fprintf(fd,"%08x%08x%08x%08x\n", 
			rte_be_to_cpu_32(*(dump + i)), 
			rte_be_to_cpu_32(*(dump + i + 1)), 
			rte_be_to_cpu_32(*(dump + i + 2)), 
			rte_be_to_cpu_32(*(dump + i + 3)) );
		fflush(fd);
	}
	fprintf(fd,"\n");
	fflush(fd);
	return ret;
}


/* main processing loop */
static void
l2fwd_main_loop(void)
{
	struct rte_mbuf *pkts_burst[MAX_PKT_BURST];
	struct rte_mbuf *m;
	int sent;
	unsigned lcore_id;
	uint64_t prev_tsc, diff_tsc, cur_tsc, timer_tsc;
	unsigned i, j, portid, nb_rx;
	struct lcore_queue_conf *qconf;
	const uint64_t drain_tsc = (rte_get_tsc_hz() + US_PER_S - 1) / US_PER_S *
			BURST_TX_DRAIN_US;
	// struct rte_eth_dev_tx_buffer *buffer;

	prev_tsc = 0;
	timer_tsc = 0;

	lcore_id = rte_lcore_id();
	qconf = &lcore_queue_conf[lcore_id];

	// if (){
	// 	RTE_LOG(INFO, L2FWD, "lcore %u has nothing to do\n", lcore_id);
	// 	return;
	// }
	if (lcore_id == RX_QUEUE_NUM){
		while(!force_quit){
					
			cur_tsc = rte_rdtsc();

			/*
			* TX burst queue drain
			*/
			diff_tsc = cur_tsc - prev_tsc;
			if (unlikely(diff_tsc > drain_tsc)) {

				// for (i = 0; i < qconf->n_rx_port; i++) {

				// 	portid = l2fwd_dst_ports[qconf->rx_port_list[i]];
				// 	buffer = tx_buffer[portid];

				// 	sent = rte_eth_tx_buffer_flush(portid, 0, buffer);
				// 	if (sent)
				// 		port_statistics[portid].tx += sent;

				// }

				/* if timer is enabled */
				if (timer_period > 0) {

					/* advance the timer */
					timer_tsc += diff_tsc;

					/* if timer has reached its timeout */
					if (unlikely(timer_tsc >= timer_period)) {

						/* do this only on master core */
						// if (lcore_id == rte_get_master_lcore()) {
							print_stats();
							/* reset the timer */
							timer_tsc = 0;
						// }
					}
				}

				prev_tsc = cur_tsc;
			}
		}
		return;
	}
	else if (lcore_id > RX_QUEUE_NUM){
		int queue_id = (lcore_id-1) % TX_QUEUE_NUM;
		struct rte_mbuf *buf[NB_PKT_MBUF];
		populate_pkts(buf, queue_id);
		while(!force_quit){
			for (j=0;j<NB_PKT_MBUF;){
				int remain = NB_PKT_MBUF - j;
				int send = (remain < MAX_PKT_BURST) ? remain : MAX_PKT_BURST;
				// printf("[DEBUG] sending packet from core %d; queue %d; buf = 0x%lx; tindex = %d\n",id,q_id,buf,tindex);
				uint16_t tx_c = rte_eth_tx_burst(0, queue_id, buf + j, send);
				if (LOG_ALL) {
					int r;
					for (r=0;r<tx_c;r++) 
						if(save_fd[queue_id] > 0) 
							dump_mbuf_all(buf[r], save_fd[queue_id]);
				}
				j += tx_c;
				port_statistics[0].tx[queue_id] += tx_c;
			}
			j=0;
			// sent = rte_eth_tx_buffer_flush(0, queue_id, tx_buffer[queue_id]);
			
			// if (sent) {
			// 	port_statistics[0].tx[queue_id] += sent;
			// }
		}
		return;
	}
	else {
		RTE_LOG(INFO, L2FWD, "entering main loop on lcore %u\n", lcore_id);

		// for (i = 0; i < qconf->n_rx_port; i++) {

		// 	portid = qconf->rx_port_list[i];
		// 	RTE_LOG(INFO, L2FWD, " -- lcoreid=%u portid=%u\n", lcore_id,
		// 		portid);

		// }
		int dum_rx_num = 0;
		while (!force_quit) {

			/*
			* Read packet from RX queues
			*/
			nb_rx = rte_eth_rx_burst(0, lcore_id,
						pkts_burst, MAX_PKT_BURST);
			port_statistics[0].rx[lcore_id] += nb_rx;

			if(LOG_IP_PORT){
				dum_rx_num = dum_rx_num + nb_rx;
				if(dum_rx_num > 10000) {
					if(save_fd[lcore_id] > 0 ) {
						dump_mbuf_ip_port(pkts_burst[0] , save_fd[lcore_id] );
						dum_rx_num = 0;
					}
				}
			}
			else if (LOG_ALL) {
				int r;
				for (r=0;r<nb_rx;r++) 
					if(save_fd[lcore_id] > 0) 
						dump_mbuf_all(pkts_burst[r], save_fd[lcore_id]);
			}

			for (j = 0; j < nb_rx; j++) {
				rte_pktmbuf_free(pkts_burst[j]);
				// m = pkts_burst[j];
				// rte_prefetch0(rte_pktmbuf_mtod(m, void *));
				// l2fwd_simple_forward(m, 0, (uint16_t)lcore_id);
			}
		}
	}
}

static int
l2fwd_launch_one_lcore(__attribute__((unused)) void *dummy)
{
	l2fwd_main_loop();
	return 0;
}

/* display usage */
static void
l2fwd_usage(const char *prgname)
{
	printf("%s [EAL options] -- -p PORTMASK [-q NQ]\n"
	       "  -p PORTMASK: hexadecimal bitmask of ports to configure\n"
	       "  -q NQ: number of queue (=ports) per lcore (default is 1)\n"
		   "  -T PERIOD: statistics will be refreshed each PERIOD seconds (0 to disable, 10 default, 86400 maximum)\n"
		   "  --[no-]mac-updating: Enable or disable MAC addresses updating (enabled by default)\n"
		   "      When enabled:\n"
		   "       - The source MAC address is replaced by the TX port MAC address\n"
		   "       - The destination MAC address is replaced by 02:00:00:00:00:TX_PORT_ID\n",
	       prgname);
}

static int
l2fwd_parse_portmask(const char *portmask)
{
	char *end = NULL;
	unsigned long pm;

	/* parse hexadecimal string */
	pm = strtoul(portmask, &end, 16);
	if ((portmask[0] == '\0') || (end == NULL) || (*end != '\0'))
		return -1;

	if (pm == 0)
		return -1;

	return pm;
}

static unsigned int
l2fwd_parse_nqueue(const char *q_arg)
{
	char *end = NULL;
	unsigned long n;

	/* parse hexadecimal string */
	n = strtoul(q_arg, &end, 10);
	if ((q_arg[0] == '\0') || (end == NULL) || (*end != '\0'))
		return 0;
	if (n == 0)
		return 0;
	if (n >= MAX_RX_QUEUE_PER_LCORE)
		return 0;

	return n;
}

static int
l2fwd_parse_timer_period(const char *q_arg)
{
	char *end = NULL;
	int n;

	/* parse number string */
	n = strtol(q_arg, &end, 10);
	if ((q_arg[0] == '\0') || (end == NULL) || (*end != '\0'))
		return -1;
	if (n >= MAX_TIMER_PERIOD)
		return -1;

	return n;
}

static const char short_options[] =
	"p:"  /* portmask */
	"q:"  /* number of queues */
	"T:"  /* timer period */
	;

#define CMD_LINE_OPT_MAC_UPDATING "mac-updating"
#define CMD_LINE_OPT_NO_MAC_UPDATING "no-mac-updating"

enum {
	/* long options mapped to a short option */

	/* first long only option value must be >= 256, so that we won't
	 * conflict with short options */
	CMD_LINE_OPT_MIN_NUM = 256,
};

static const struct option lgopts[] = {
	{ CMD_LINE_OPT_MAC_UPDATING, no_argument, &mac_updating, 1},
	{ CMD_LINE_OPT_NO_MAC_UPDATING, no_argument, &mac_updating, 0},
	{NULL, 0, 0, 0}
};

/* Parse the argument given in the command line of the application */
static int
l2fwd_parse_args(int argc, char **argv)
{
	int opt, ret, timer_secs;
	char **argvopt;
	int option_index;
	char *prgname = argv[0];

	argvopt = argv;

	while ((opt = getopt_long(argc, argvopt, short_options,
				  lgopts, &option_index)) != EOF) {

		switch (opt) {
		/* portmask */
		case 'p':
			l2fwd_enabled_port_mask = l2fwd_parse_portmask(optarg);
			if (l2fwd_enabled_port_mask == 0) {
				printf("invalid portmask\n");
				l2fwd_usage(prgname);
				return -1;
			}
			break;

		/* nqueue */
		case 'q':
			l2fwd_rx_queue_per_lcore = l2fwd_parse_nqueue(optarg);
			if (l2fwd_rx_queue_per_lcore == 0) {
				printf("invalid queue number\n");
				l2fwd_usage(prgname);
				return -1;
			}
			break;

		/* timer period */
		case 'T':
			timer_secs = l2fwd_parse_timer_period(optarg);
			if (timer_secs < 0) {
				printf("invalid timer period\n");
				l2fwd_usage(prgname);
				return -1;
			}
			timer_period = timer_secs;
			break;

		/* long options */
		case 0:
			break;

		default:
			l2fwd_usage(prgname);
			return -1;
		}
	}

	if (optind >= 0)
		argv[optind-1] = prgname;

	ret = optind-1;
	optind = 1; /* reset getopt lib */
	return ret;
}

/* Check the link status of all ports in up to 9s, and print them finally */
static void
check_all_ports_link_status(uint32_t port_mask)
{
#define CHECK_INTERVAL 100 /* 100ms */
#define MAX_CHECK_TIME 90 /* 9s (90 * 100ms) in total */
	uint16_t portid;
	uint8_t count, all_ports_up, print_flag = 0;
	struct rte_eth_link link;
	int ret;

	printf("\nChecking link status");
	fflush(stdout);
	for (count = 0; count <= MAX_CHECK_TIME; count++) {
		if (force_quit)
			return;
		all_ports_up = 1;
		RTE_ETH_FOREACH_DEV(portid) {
			if (force_quit)
				return;
			if ((port_mask & (1 << portid)) == 0)
				continue;
			memset(&link, 0, sizeof(link));
			ret = rte_eth_link_get_nowait(portid, &link);
			if (ret < 0) {
				all_ports_up = 0;
				if (print_flag == 1)
					printf("Port %u link get failed: %s\n",
						portid, rte_strerror(-ret));
				continue;
			}
			/* print link status if flag set */
			if (print_flag == 1) {
				if (link.link_status)
					printf(
					"Port%d Link Up. Speed %u Mbps - %s\n",
						portid, link.link_speed,
				(link.link_duplex == ETH_LINK_FULL_DUPLEX) ?
					("full-duplex") : ("half-duplex"));
				else
					printf("Port %d Link Down\n", portid);
				continue;
			}
			/* clear all_ports_up flag if any link down */
			if (link.link_status == ETH_LINK_DOWN) {
				all_ports_up = 0;
				break;
			}
		}
		/* after finally printing all link status, get out */
		if (print_flag == 1)
			break;

		if (all_ports_up == 0) {
			printf(".");
			fflush(stdout);
			rte_delay_ms(CHECK_INTERVAL);
		}

		/* set the print_flag if all ports up or timeout */
		if (all_ports_up == 1 || count == (MAX_CHECK_TIME - 1)) {
			print_flag = 1;
			printf("done\n");
		}
	}
}

static void
signal_handler(int signum)
{
	if (signum == SIGINT || signum == SIGTERM) {
		printf("\n\nSignal %d received, preparing to exit...\n",
				signum);
		force_quit = true;
	}
}

int
main(int argc, char **argv)
{
	struct lcore_queue_conf *qconf;
	int ret;
	uint16_t nb_ports;
	uint16_t nb_ports_available = 0;
	uint16_t portid, last_port;
	unsigned lcore_id, rx_lcore_id;
	unsigned nb_ports_in_mask = 0;
	unsigned int nb_lcores = 0;
	// unsigned int nb_mbufs;

	/* init EAL */
	ret = rte_eal_init(argc, argv);
	if (ret < 0)
		rte_exit(EXIT_FAILURE, "Invalid EAL arguments\n");
	argc -= ret;
	argv += ret;

	force_quit = false;
	signal(SIGINT, signal_handler);
	signal(SIGTERM, signal_handler);

	/* parse application arguments (after the EAL ones) */
	ret = l2fwd_parse_args(argc, argv);
	if (ret < 0)
		rte_exit(EXIT_FAILURE, "Invalid L2FWD arguments\n");

	printf("MAC updating %s\n", mac_updating ? "enabled" : "disabled");



	/* convert to number of cycles */
	timer_period *= rte_get_timer_hz();

	nb_ports = 1;//rte_eth_dev_count_avail();
	if (nb_ports == 0)
		rte_exit(EXIT_FAILURE, "No Ethernet ports - bye\n");

	/*init fd*/
	if (LOG_IP_PORT || LOG_ALL){
		int i = 0;
		char logfile[32];
		for(i = 0;i < 16;i++){
			snprintf(logfile,32,"dump_log_%d",i);
			save_fd[i] = fopen(logfile,"w");
		}
	}

	/* check port mask to possible port mask */
	if (l2fwd_enabled_port_mask & ~((1 << nb_ports) - 1))
		rte_exit(EXIT_FAILURE, "Invalid portmask; possible (0x%x)\n",
			(1 << nb_ports) - 1);

	/* reset l2fwd_dst_ports */
	for (portid = 0; portid < RTE_MAX_ETHPORTS; portid++)
		l2fwd_dst_ports[portid] = 0;
	last_port = 0;

	/*
	 * Each logical core is assigned a dedicated TX queue on each port.
	 */
	RTE_ETH_FOREACH_DEV(portid) {
		/* skip ports that are not enabled */
		if ((l2fwd_enabled_port_mask & (1 << portid)) == 0)
			continue;

		if (nb_ports_in_mask % 2) {
			l2fwd_dst_ports[portid] = last_port;
			l2fwd_dst_ports[last_port] = portid;
		}
		else
			last_port = portid;

		nb_ports_in_mask++;
	}
	if (nb_ports_in_mask % 2) {
		printf("Notice: odd number of ports in portmask.\n");
		l2fwd_dst_ports[last_port] = last_port;
	}

	rx_lcore_id = 0;
	qconf = NULL;

	/* Initialize the port/queue configuration of each logical core */
	RTE_ETH_FOREACH_DEV(portid) {
		/* skip ports that are not enabled */
		if ((l2fwd_enabled_port_mask & (1 << portid)) == 0)
			continue;

		/* get the lcore_id for this port */
		while (rte_lcore_is_enabled(rx_lcore_id) == 0 ||
		       lcore_queue_conf[rx_lcore_id].n_rx_port ==
		       l2fwd_rx_queue_per_lcore) {
			rx_lcore_id++;
			if (rx_lcore_id >= RTE_MAX_LCORE)
				rte_exit(EXIT_FAILURE, "Not enough cores\n");
		}

		if (qconf != &lcore_queue_conf[rx_lcore_id]) {
			/* Assigned a new logical core in the loop above. */
			qconf = &lcore_queue_conf[rx_lcore_id];
			nb_lcores++;
		}

		qconf->rx_port_list[qconf->n_rx_port] = portid;
		qconf->n_rx_port++;
		printf("Lcore %u: RX port %u\n", rx_lcore_id, portid);
	}

	// nb_mbufs = RTE_MAX(nb_ports * (nb_rxd + nb_txd + MAX_PKT_BURST +
	// 	nb_lcores * MEMPOOL_CACHE_SIZE), 256U*1024U);

	/* create the mbuf pool */
	l2fwd_pktmbuf_pool = rte_pktmbuf_pool_create("mbuf_pool", NB_MBUFS,
		MEMPOOL_CACHE_SIZE, 0, MBUF_SIZE + RTE_PKTMBUF_HEADROOM,
		rte_socket_id());
	if (l2fwd_pktmbuf_pool == NULL)
		rte_exit(EXIT_FAILURE, "Cannot init mbuf pool\n");

	/* Initialise each port */
	RTE_ETH_FOREACH_DEV(portid) {
		struct rte_eth_rxconf rxq_conf;
		struct rte_eth_txconf txq_conf;
		struct rte_eth_conf local_port_conf = port_conf;
		struct rte_eth_dev_info dev_info;

		/* skip ports that are not enabled */
		if ((l2fwd_enabled_port_mask & (1 << portid)) == 0) {
			printf("Skipping disabled port %u\n", portid);
			continue;
		}
		nb_ports_available++;

		/* init port */
		printf("Initializing port %u... ", portid);
		fflush(stdout);

		ret = rte_eth_dev_info_get(portid, &dev_info);
		if (ret != 0)
			rte_exit(EXIT_FAILURE,
				"Error during getting device (port %u) info: %s\n",
				portid, strerror(-ret));

		if (dev_info.tx_offload_capa & DEV_TX_OFFLOAD_MBUF_FAST_FREE)
			local_port_conf.txmode.offloads |=
				DEV_TX_OFFLOAD_MBUF_FAST_FREE;
		ret = rte_eth_dev_configure(portid, RX_QUEUE_NUM, TX_QUEUE_NUM, &local_port_conf);
		if (ret < 0)
			rte_exit(EXIT_FAILURE, "Cannot configure device: err=%d, port=%u\n",
				  ret, portid);

		ret = rte_eth_dev_adjust_nb_rx_tx_desc(portid, &nb_rxd,
						       &nb_txd);
		if (ret < 0)
			rte_exit(EXIT_FAILURE,
				 "Cannot adjust number of descriptors: err=%d, port=%u\n",
				 ret, portid);

		ret = rte_eth_macaddr_get(portid,
					  &l2fwd_ports_eth_addr[portid]);
		if (ret < 0)
			rte_exit(EXIT_FAILURE,
				 "Cannot get MAC address: err=%d, port=%u\n",
				 ret, portid);

		/* init one RX queue */
		int i;
		for (i=0;i<RX_QUEUE_NUM;i++){
		fflush(stdout);
		rxq_conf = dev_info.default_rxconf;
		rxq_conf.offloads = local_port_conf.rxmode.offloads;
		ret = rte_eth_rx_queue_setup(portid, i, nb_rxd,
					     rte_eth_dev_socket_id(portid),
					     &rxq_conf,
					     l2fwd_pktmbuf_pool);
		if (ret < 0)
			rte_exit(EXIT_FAILURE, "rte_eth_rx_queue_setup:err=%d, port=%u\n",
				  ret, portid);
		}

		/* init one TX queue on each port */
		for (i=0;i<TX_QUEUE_NUM;i++){
		fflush(stdout);
		txq_conf = dev_info.default_txconf;
		txq_conf.offloads = local_port_conf.txmode.offloads;
		ret = rte_eth_tx_queue_setup(portid, i, nb_txd,
				rte_eth_dev_socket_id(portid),
				&txq_conf);
		if (ret < 0)
			rte_exit(EXIT_FAILURE, "rte_eth_tx_queue_setup:err=%d, port=%u\n",
				ret, portid);
		
		/* Initialize TX buffers */
		tx_buffer[i] = rte_zmalloc_socket("tx_buffer",
				RTE_ETH_TX_BUFFER_SIZE(MAX_PKT_BURST), 0,
				rte_eth_dev_socket_id(portid));
		if (tx_buffer[i] == NULL)
			rte_exit(EXIT_FAILURE, "Cannot allocate buffer for tx on queue %u\n",
					i);

		rte_eth_tx_buffer_init(tx_buffer[i], MAX_PKT_BURST);

		ret = rte_eth_tx_buffer_set_err_callback(tx_buffer[i],
				rte_eth_tx_buffer_count_callback,
				&port_statistics[portid].dropped);
		if (ret < 0)
			rte_exit(EXIT_FAILURE,
			"Cannot set error callback for tx buffer on queue %u\n",
				 i);
		}
		ret = rte_eth_dev_set_ptypes(portid, RTE_PTYPE_UNKNOWN, NULL,
					     0);
		if (ret < 0)
			printf("Port %u, Failed to disable Ptype parsing\n",
					portid);
		/* Start device */
		ret = rte_eth_dev_start(portid);
		if (ret < 0)
			rte_exit(EXIT_FAILURE, "rte_eth_dev_start:err=%d, port=%u\n",
				  ret, portid);

		printf("done: \n");
		
		// ret = rte_eth_promiscuous_enable(portid);
		// if (ret != 0)
		// 	rte_exit(EXIT_FAILURE,
		// 		 "rte_eth_promiscuous_enable:err=%s, port=%u\n",
		// 		 rte_strerror(-ret), portid);

		printf("Port %u, MAC address: %02X:%02X:%02X:%02X:%02X:%02X\n\n",
				portid,
				l2fwd_ports_eth_addr[portid].addr_bytes[0],
				l2fwd_ports_eth_addr[portid].addr_bytes[1],
				l2fwd_ports_eth_addr[portid].addr_bytes[2],
				l2fwd_ports_eth_addr[portid].addr_bytes[3],
				l2fwd_ports_eth_addr[portid].addr_bytes[4],
				l2fwd_ports_eth_addr[portid].addr_bytes[5]);

		/* initialize port stats */
		memset(&port_statistics, 0, sizeof(port_statistics));
	}

	if (!nb_ports_available) {
		rte_exit(EXIT_FAILURE,
			"All available ports are disabled. Please set portmask.\n");
	}

	check_all_ports_link_status(l2fwd_enabled_port_mask);
	rte_spinlock_init(&sent_lock);
	ret = rte_pmd_qdma_get_bar_details(0,
				&(config_bar_idx),
				&(user_bar_idx),
				&(bypass_bar_idx));

	if (ret < 0)
		rte_exit(EXIT_FAILURE, "rte_pmd_qdma_get_bar_details failed\n");

	printf("QDMA Config bar idx: %d\n", config_bar_idx);
	printf("QDMA User bar idx: %d\n", user_bar_idx);
	printf("QDMA Bypass bar idx: %d\n", bypass_bar_idx);
	
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, RESET_COUNTER  , 0x1);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, RESET_COUNTER  , 0x0);

 
// 16 bit op:
// op = 0: do nothing
// op(3) : RxStrMatcher -> op(2,0): function(<(4),>(2),=(1),!=(0))
// op(4) : RxStrSearcher
// op(5) : RxRSSHasher
// op(6) : ChksumGenerator / ChksumVerifier (control in Tx/RxBufferFifo)
// op(7) : RxRESearcher
// op(8) : TxAESEncrypter / RxAESDecrypter
// example test:
// 1. 0x60(01100000) 0x6d5a6d5a 0x6d5a6d5a 0x6d5a6d5a 0x6d5a6d5a 0x01234567 0x89abcdef (RSS)
// 2. 0x4b(01001011) 0xc0a88000 0xffffffff 0x1a (Matcher, dst_ip >= 192.168.128.0)
// 3. 0x50(01010000) 0xc0a88000 0xffffffff (Searcher)
// 4. 0x80(10000000) 0x10006868 0x21006565 0x32006c6c 0x43006c6c
//                   0x54006f6f 0x65007777 0x76006f6f 0x87007272
//                   0x98006c6c 0xf9006464 0x00000000(x6) (helloworld) (RESearcher)

// RxStrMatcher:    arg0:content;   arg1:mask;      arg2:place
// RxStrSearcher:   arg0:content;   arg1:mask
// RxRSSHasher: arg0~3:hash_seed; arg4~6:jump_table
// RxRESearcher: arg0-15:DFA rule
// AES: arg12-15: key
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_OP   , 0x60);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG0 , 0x6d5a6d5a);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG1 , 0x6d5a6d5a);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG2 , 0x6d5a6d5a);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG3 , 0x6d5a6d5a);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG4 , 0x01234567);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG5 , 0x89abcdef);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG6 , 0x0);
	
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG7 , 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG8 , 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG9 , 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG10, 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG11, 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG12, 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG13, 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG14, 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, PKGHDLR_ARG15, 0x0);
	
	printf("QDMA arg setting done\n");

	ret = 0;
	/* launch per-lcore init on every lcore */
	rte_eal_mp_remote_launch(l2fwd_launch_one_lcore, NULL, CALL_MASTER);
	RTE_LCORE_FOREACH_SLAVE(lcore_id) {
		if (rte_eal_wait_lcore(lcore_id) < 0) {
			ret = -1;
			break;
		}
	}

	RTE_ETH_FOREACH_DEV(portid) {
		if ((l2fwd_enabled_port_mask & (1 << portid)) == 0)
			continue;
		printf("Closing port %d...", portid);
		rte_eth_dev_stop(portid);
		rte_eth_dev_close(portid);
		printf(" Done\n");
	}
	printf("Bye...\n");

	return ret;
}

