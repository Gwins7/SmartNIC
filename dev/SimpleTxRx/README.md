### SimpleTxRx使用方法

0.使用su root获取root权限，并参照说明文档，使用DPDK的dpdk-setup.sh完成QDMA卡绑定。

1.设置RTE_SDK环境变量为DPDK的路径。

2.make编译。

3.运行./build/simpleTxRx。示例如下：

```bash
./build/simpleTxRx -c 0x1ffff -p 0x1 
#解释：
#-c 0x1ffff: -c参数用于控制Lcore数，本程序中用于控制程序行为；
#			 Lcore 0~15用于在16个队列上收包，16用于打印信息，17及以后用于发包(此时发包队列号是trivial的)。
#			 如果需要只收不发，则-c为0x1ffff,如果还需要发包则-c为0x3ffff(一个核发包速度足够达到满速)。
#            发出的包设置为不填TCP/IP checksum的TCP/IP包，从64B开始填充随机字节(用于测试AES)，包大小由PKT_LEN宏控制。
#		     其他的生成包的相关参数可以直接在代码中设置。
#-p 0x1: 只有一个PF(physical function))；可以在硬件工程的QDMA IP设置中调成多个PF，没有本质区别。
# 自行编写DPDK程序时，主要需要注意参考的是该程序向智能网卡传参数的方法。
```

除了主程序外，该文件夹还包含三个小程序，均可直接使用gcc编译：

```
toeplitz_test:使用软件的toeplitz算法对dump下来的包{src_ip,src_port,dst_ip,dst_port}地址四元组进行验证。
使用方法：
1.在main.c内修改(开启LOG_IP_PORT宏)并重新编译，使得SimpleTxRx的dump四元组功能开启。
(注意，dump内容太多会导致软件处理不过来，速率拖慢；默认实现是每约10000个包抽1个包的四元组dump)
2.进行收发包测试，此时根目录下生成一系列dump_log_x文件，其中x是接收队列，文件中内容每行为该队列抽取的包的四元组。
3.编译运行toeplitz_test，使用16线程对所有文件内的包四元组进行计算并与接收队列号对比。此时默认跳转表为一一对应，即接收队列号直接取哈希计算结果的最后四位。
4.如果运算结果正确则会打印测试成功信息，否则打印测试出错的部分（对比）。

aes_test: AES算法加解密演示，用于参考；密钥和内容在代码中设置。
使用方法：
修改代码中的加密内容和密钥，编译并直接运行，会打印显示对应的加密和解密效果。

aes_test_file:使用软件的AES算法对aes_cipher_input的包内容(64B之后的部分)进行加密/解密，结果存储在aes_cipher_output中。
使用方法：
1.在main.c内修改(开启LOG_ALL宏)并重新编译，使得SimpleTxRx的dump包功能开启。此时所有收发的包均在软件界面收发时被dump，dump_log_x的x代表队列号。
2.参考说明文档的方法进行测试；将得到的包内容复制到aes_cipher_input内，在代码中设定好密钥并编译aes_test_file，运行时需要加上一个参数，'+'参数代表加密，'-'参数代表解密。操作完成后打印信息，在aes_cipher_output内得到加解密操作后的包内容。

```

