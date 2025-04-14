## 智能网卡项目交接清单v2.0

### 提交文件目录结构

```
dev:开发相关代码。
	·packageHandler: 使用Chisel开发的PackageHandler模块playground。（配合文档与注释理解）
	·SimpleTxRx: 在l2fwd上修改得到的SimpleTxRx小程序，可在DPDK环境下测试智能网卡功能；
				 同时包含软件实现Toeplitz算法与AES加解密算法的源码，可以复现说明文档的相关测试。
				 需要开发DPDK程序使用智能网卡相关功能时，可以参考该程序实现。
	·proj-tcl: 硬件工程生成脚本。
	·NF-card: 硬件工程使用的板卡约束文件，打开硬件工程前需要先将约束文件导入vivado。
	·thesis.pdf: 说明文档。
doc: 积累文档。
	·Chisel_study: Chisel学习材料。
	·Reference: 参考资料文献与IP核使用手册。
	·Weekly_report: 周报。
	·Working_progress: 工作日志。
```

### 基本场景使用方法

本部分中使用Vivado的版本号为2020.1。

#### 修改硬件工程

（第一次打开时需要完成前两步，以后可以直接打开）

1.获取并导入CMAC IP核的license。

操作步骤参考[【FPGA】Xilinx vivado IP核许可申请——以MIPI CSI-2为例_vivado申请_ruiwenz的博客-CSDN博客](https://blog.csdn.net/R_W_zhang/article/details/116527163)，CMAC IP核的名称为“UltraScale+ Integrated 100G Ethernet Subsystem“；导入的license是免费版，不能使用AN/LT（链路自协商），可能导致网卡直接与发包机（目前已知）连接时无法识别，但通过交换机中介则可以识别。其他功能没有问题。

2.导入NF卡的板卡约束文件。（参考NF_card文件夹下的使用方法）

3.生成并打开硬件工程。（参考proj-tcl文件夹下的使用方法）

4.结合说明文档理解硬件工程（基础框架）结构，直接修改代码（注意如需修改IP核相关内容时应参考IP核说明文档）。

#### 使用Chisel开发PackageHandler新功能

0.通过文件夹内的Chisel学习资料基本掌握Chisel用法，结合说明文档与PackageHandler工程中的代码注释，基本理解工作方式。

1.参考packagehandler-mill文件夹下的使用方法，使用IDE进行开发，并生成Verilog代码。

2.将Verilog代码全文复制到硬件工程的PackageHandler.v中，然后进行仿真或综合实现。

仿真操作步骤参考[Xilinx Vivado的使用详细介绍（1）：创建工程、编写代码、行为仿真_vivado新建工程_达则兼济天下SEU的博客-CSDN博客](https://blog.csdn.net/lxm920714/article/details/108285459)；综合实现步骤参考[xilinx Vivado的使用详细介绍（2）：综合、实现、管脚约束、产生比特流文件、烧写程序、硬件验证_vivado管脚约束的图形化工具在哪里_达则兼济天下SEU的博客-CSDN博客](https://blog.csdn.net/lxm920714/article/details/108293678)。

3.进行硬件工程调试（步骤见下），确保功能正确性。

4.优化，保证功能正确的基础上在综合时不出现时序违例。

5.上板进行外部测试（步骤见下），功能得到实现。

#### 硬件工程调试

硬件工程调试主要是调试PackageHandler的功能实现，有三种方法：

1.使用smart_nic_sim硬件工程，该工程仅用于仿真，使用FIFO IP模拟CMAC IP核，QDMA端使用Testbench直接激励，可以使用仿真功能检查输入包后的输出内容和各级组件的运行情况。参考工程中已有的Testbench自主编写，构造边界测试用例，基本证明功能可用性。仿真步骤在功能开发部分中已经提及。

2.使用ILA核调试，硬件工程综合时增加调试核，在上板后进行外部测试时使用Vivado的Hardware Manager抓取预先选取的信号的硬件波形，从而发现bug。该方法存在时间成本，同时加入调试核后可能出现时序问题；此外需要用mark debug手动选取调试线。

操作步骤参考[FPGA — Vivado下ILA(逻辑分析仪)详细使用方法_vivido逻辑分析仪使用指南_unique_ZRF的博客-CSDN博客](https://blog.csdn.net/unique_ZRF/article/details/127715565)。

3.通过外部测试中抓取的数据（如发包机抓取的包内容）等，结合Chisel代码推测bug成因。

#### 外部功能测试

1.准备带有QDMA驱动的DPDK（联系张钊师兄获取），参考dev/SimpleTxRx程序编写自己的测试程序（重点注意参数的写入方法，规则见说明文档），使用DPDK编译通过。

参考[编写一个属于自己的DPDK应用程序（DPDK入门向）_dpdk python_至上海鳞的博客-CSDN博客](https://blog.csdn.net/weixin_44524614/article/details/109381156)。

2.在Vivado上打开HardwareManager，并烧入智能网卡的硬件比特流。重启服务器。综合实现与烧写步骤在功能开发部分中已经提及。

3.在root下使用DPDK中的usertools/dpdk-setup.sh绑定网卡（详见说明文档）。

4.运行测试程序，并基于搭建的软硬件环境（如发包机、外部网卡等）进行功能或性能测试。

### Todo List

1.使用各种软件进行进一步的外部功能测试（如高性能L2FWD、协议栈处理、网页根据uid分流等实际场景）与性能极限测试，收集数据并分析；使用100G商用网卡进行性能对比。

2.新功能开发（如协议栈卸载）、硬件工程修改（如降频多发射，详见说明文档）。

3.开源相关的各类文档（技术报告）；进一步完善说明文档。

 
