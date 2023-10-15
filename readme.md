## 说明

本文件夹包括智能网卡工作的相关材料。

子文件夹具体包含内容如下：

```
dev:开发相关代码。
	·packageHandler: 使用Chisel开发的PackageHandler模块。（配合文档与注释理解）
	·SimpleTxRx: 在l2fwd上修改得到的SimpleTxRx小程序，可在DPDK环境下测试智能网卡功能；
				 同时包含软件实现Toeplitz算法与AES加解密算法的源码。
				 需要使用DPDK程序使用智能网卡相关功能时，可以参考该程序实现。
	·smart_nic_dev: 上板用硬件工程。
	·smart_nic_sim: 仿真用硬件工程。
	·NF-card.zip: 硬件工程使用的板卡约束文件，打开smart_nic_dev前需要先将约束文件导入vivado。
	·chisel-playground-master.zip: Chisel工程模板。
·Thesis v3.pdf: 毕业论文（项目说明文档），结合该文档理解项目。
drawio: 演示用框图文件。
```
