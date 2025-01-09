XDMA学习记录

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

      
