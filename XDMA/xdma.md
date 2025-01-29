XDMA学习记录

// 最新整理版本20250129

lab1：从PC向FPGA中的Bram读写实验（本实验室VCU118适配）

参考内容： https://github.com/WangXuan95/Xilinx-FPGA-PCIe-XDMA-Tutorial/tree/main

1.创建blockdesign

2.添加XDMAIP核

（1）board 

RST选pcie perstn 、 pcie_7x_mgt 选pci express x16

（2）其他设置参考

XDMA ip核设置：Board下，RST： pcie-perstn pcie—7x：pci express x16

basic： maximum link speed 8.0

misc: user interrupt :16


![837b151df843db3fb93794071c36e66e](https://github.com/user-attachments/assets/ad179b81-6484-46ca-ae21-1e5dc17f1e65)

![6493e906957126c85f1cc3b2b32077b8](https://github.com/user-attachments/assets/337c10cf-dafd-47b9-9e84-1738ba25d4f1)

![34acb4434429c580fbeffad1b561bfaa](https://github.com/user-attachments/assets/23172da1-5368-4a53-b7a2-f5701e7f1235)

![2a5119d7b131c831b538981a1c5901e2](https://github.com/user-attachments/assets/76c21145-920e-46e3-ac28-c88d02cfbf5d)

![95cee49b3c7c946f2adbc471b71a53d1](https://github.com/user-attachments/assets/5d4a3147-a779-464a-9375-607a702a2eac)

![ebb7f068a5e59fe28a39da4d7d6e608f](https://github.com/user-attachments/assets/89f90df1-2710-42e3-9b81-bf389a5a6fae)

![a1c096f7e7cd2895b1e09bc692256187](https://github.com/user-attachments/assets/b60abe37-0931-4710-b3f9-925c79786e60)

![76a3bcfc2eee997a7c44e81d05139101](https://github.com/user-attachments/assets/651042ec-530c-44f2-b7e4-735eb3ccb844)

3.添加AXI BRAM Controller IP核

Bram controller 设置： AXI Data width设置为512bit，和XDMA保持一致，AXI 带宽512bit ,深度8192 Bram容量： 512*8192=4194304 bit = 524288 B = 512KB

注意sysclk clkgt 和rstn这三个信号，auto就好了，会生成一个utility buffer

配置参见顶部“参考内容”

4.其它电路、分配地址之类的设置也参考“参考内容”

![image](https://github.com/user-attachments/assets/d4950414-6198-4a22-bffa-a872f27aa670)


5.生成HDL Wrapper，这里不用再写一个top来控制了，直接生成比特流就好

6.C语言读写测试，参考，很重要，再本工程的

7.python读写测试


// ***********          以下的是旧版本    ****************//

lab1(需要设置引脚)

1.参考下面连接，做lab1-使用XDMA实现：从PC发送数据到FPGA的BRAM，再从FPGA读取到PC
https://github.com/WangXuan95/Xilinx-FPGA-PCIe-XDMA-Tutorial/tree/main

2.注意事项：

（1）选择VCU118时，xdma ip核会多出一个sys_clk_gt接口，这个是高速接口，和sys_clk一样，引到外部就好

（2）在fpag_top文件中，将IBUFDS_GTE3改为IBUFDS_GTE4，添加wire  pcie_refclk_gt，其余更改参考下面的fpga.v（删去了o_led0的版本）

（3）引脚约束参考  引脚大全
https://github.com/alexforencich/verilog-pcie/blob/master/example/VCU118/fpga/fpga.xdc
或者下面的top.xdc

（4）random.bin可用下方create_bin.py实现，如果用python将txt转为bin似乎会导致：驱动无法读取bin文件

lab2（无需设置引脚）

1.参考陈师兄block design ，去掉和ip核相关的电路，只保留XDMA和DDR4部分，ip核生成顶层文件后无需再添加新的顶层文件，直接生成比特流即可使用（记得烧进去后重启）

（1）XDMA ip核设置：Board下，RST： pcie-perstn pcie—7x：pci express x16

（2）basic： maximum link speed 8.0

 (3) misc: user interrupt :16

 (4) Bram controller 设置： AXI Data width设置为512bit，和XDMA保持一致，AXI 带宽512bit ,深度8192 Bram容量： 512*8192=4194304 bit = 524288 B = 512KB

 (5) 注意sysclk clkgt 和rstn这三个信号，auto就好了，会生成一个utility buffer


2.测试驱动可以和lab1公用（本质上都是读写h2c、c2h），有两种测试驱动：

（1）参考lab1里的
https://github.com/WangXuan95/Xilinx-FPGA-PCIe-XDMA-Tutorial/blob/main/doc/run_software_xdma_bram.md

（2）python dma_test.py

      
