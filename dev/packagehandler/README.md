### PackageHandler使用方法

本文件夹为PackageHandler的Chisel工程，使用mill 0.10.15进行环境搭建，请自行安装mill。(原模板使用方法可参考README1.md)

PackageHandler代码放置在./src下，可以自行使用IDE进行编辑修改。

如需生成Verilog代码，在根目录下运行make verilog，生成的verilog代码在build文件夹下。

使用该Verilog代码覆盖硬件工程的PackageHandler.v，即可进行测试（仿真与上板）。

