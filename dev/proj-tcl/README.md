### Proj-tcl使用方法

使用Vivado的tcl脚本可以简单地生成仿真与上板工程。

如要生成上板工程并打开，使用

```
make fpga
```

此时根目录下得到上板用硬件工程，文件夹名称为smart_nic_dev。

如要生成仿真工程并打开，使用

```
make sim
```

此时根目录下得到仿真用硬件工程，文件夹名称为smart_nic_sim。