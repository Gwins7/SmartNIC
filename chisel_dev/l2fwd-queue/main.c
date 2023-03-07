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

#define LOG_STATUS 1

#define H2C_PACK_COUNTER 0x0100
#define H2C_ERR_COUNTER  0x0104
#define C2H_PACK_COUNTER 0x0108
#define C2H_ERR_COUNTER  0x010C
#define RESET_COUNTER    0x0110
#define C2H_MATCH_OP     0x0114
#define C2H_MATCH_ARG0   0x0118
#define C2H_MATCH_ARG1   0x011C
#define C2H_MATCH_ARG2   0x0120
#define C2H_MATCH_ARG3   0x0124
#define C2H_MATCH_ARG4   0x0128
#define C2H_MATCH_ARG5   0x012C
#define C2H_MATCH_ARG6   0x0130
#define C2H_MATCH_ARG7   0x0134
#define C2H_MATCH_ARG8   0x0138
#define C2H_MATCH_ARG9   0x013C
#define C2H_MATCH_ARG10  0x0140
#define C2H_MATCH_ARG11  0x0144
#define C2H_MATCH_ARG12  0x0148
#define C2H_MATCH_ARG13  0x014C
#define C2H_MATCH_ARG14  0x0150
#define C2H_MATCH_ARG15  0x0154

   // address 0x0100 : h2c_pack_counter
   // address 0x0104 : h2c_err_counter
   // address 0x0108 : c2h_pack_counter
   // address 0x010C : c2h_err_counter
   // address 0x0110 : reset_counter

   // address 0x0114 : c2h_match_op
   // address 0x0118 : c2h_match_arg0
   // address 0x011C : c2h_match_arg1
   // address 0x0120 : c2h_match_arg2
   // address 0x0124 : c2h_match_arg3
   // address 0x0128 : c2h_match_arg4
   // address 0x012C : c2h_match_arg5
   // address 0x0130 : c2h_match_arg6
   // address 0x0134 : c2h_match_arg7
   // address 0x0138 : c2h_match_arg8
   // address 0x013C : c2h_match_arg9
   // address 0x0140 : c2h_match_arg10
   // address 0x0144 : c2h_match_arg11
   // address 0x0148 : c2h_match_arg12
   // address 0x014C : c2h_match_arg13
   // address 0x0150 : c2h_match_arg14
   // address 0x0154 : c2h_match_arg15

struct rte_mbuf ** save_mbufs[16];
//int save_head[16] = {0};

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


static int dump_mbuf(struct rte_mbuf * mbuf ,int fd )
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
		while(!force_quit){
			int queue_id = (lcore_id-1) % TX_QUEUE_NUM;
			
			sent = rte_eth_tx_buffer_flush(0, queue_id, tx_buffer[queue_id]);
			
			if (sent) {
				port_statistics[0].tx[queue_id] += sent;
			}
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

			if(LOG_STATUS){
				dum_rx_num = dum_rx_num + nb_rx;
				if(dum_rx_num > 10000) {
					if(save_fd[lcore_id] > 0 ) {
						dump_mbuf(pkts_burst[0] , save_fd[lcore_id] );
						dum_rx_num = 0;
					}
				}
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
	unsigned int nb_mbufs;

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
	if (LOG_STATUS){
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

	nb_mbufs = RTE_MAX(nb_ports * (nb_rxd + nb_txd + MAX_PKT_BURST +
		nb_lcores * MEMPOOL_CACHE_SIZE), 256U*1024U);

	/* create the mbuf pool */
	l2fwd_pktmbuf_pool = rte_pktmbuf_pool_create("mbuf_pool", nb_mbufs,
		MEMPOOL_CACHE_SIZE, 0, RTE_MBUF_DEFAULT_BUF_SIZE,
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

	int reg_val = qdma_pci_read_reg(&rte_eth_devices[0],user_bar_idx, 0x8);
	reg_val = (reg_val & 0xf) | 0x1;
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, 0x8, reg_val);
	
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, RESET_COUNTER  , 0x1);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, RESET_COUNTER  , 0x0);

 
// 8 bit op:
// op = 00000000: do nothing
// op(3) : RxStrMatcher -> op(2,0): function(<(4),>(2),=(1),!=(0))
// op(4) : RxStrSearcher
// op(5) : RxRSSHasher
// op(6) : ChksumGenerator / ChksumVerifier (control in Tx/RxBufferFifo)
// op(7) : RxRESearcher

// example test:
// 1. 0x60(01100000) 0x6d5a6d5a 0x1 0x0 (RSS)
// 2. 0x4b(01001011) 0xc0a88000 0xffffffff 0x1a (Matcher, dst_ip >= 192.168.128.0)
// 3. 0x50(01010000) 0xc0a88000 0xffffffff (Searcher)
// 4. 0x80(10000000) 0x10006868 0x21006565 0x32006c6c 0x43006c6c
//                   0x54006f6f 0x65007777 0x76006f6f 0x87007272
//                   0x98006c6c 0xf9006464 0x00000000(x6) (helloworld) (RESearcher)

// RxStrMatcher:    arg0:content;   arg1:mask;      arg2:place
// RxStrSearcher:   arg0:content;   arg1:mask
// RxRSSHasher: arg1:hash_seed; arg2:hash_mask
// RxRESearcher: arg0-15:DFA rule

	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_OP   , 0x60);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG0 , 0x6d5a6d5a);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG1 , 0xf);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG2 , 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG3 , 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG4 , 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG5 , 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG6 , 0x0);
	
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG7 , 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG8 , 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG9 , 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG10, 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG11, 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG12, 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG13, 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG14, 0x0);
	qdma_pci_write_reg(&rte_eth_devices[0], user_bar_idx, C2H_MATCH_ARG15, 0x0);
	
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

