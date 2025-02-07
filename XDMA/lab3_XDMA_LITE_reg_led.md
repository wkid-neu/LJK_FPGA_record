
LAB3 PCIE （XDMA上的）AXI LITE 学习笔记

参考 以下文档制作LITE Master 方法，做出自己的LITE Slave并通过XDMA ip核进行控制

https://blog.csdn.net/weixin_45937291/article/details/129771811?spm=1001.2014.3001.5501

///////////           可直接修改版：

AXI 地址与 slv_reg 变量的映射

AXI4-Lite 访问寄存器的方式通常是：每个寄存器占用 4 字节（32-bit）。地址是按 4 字节对齐的，例如 0x00000000, 0x00000004, 0x00000008, 0x0000000C 等。

如果AXI 从机模块的地址范围是 4K（0x00000000 ~ 0x00000FFF），

那么通常 slv_reg0 对应的地址是 0x00000000，slv_reg1 对应 0x00000004，依次类推。 

本实验中， 将 slv_reg0的低8位赋给led引脚， 通过XDMA向slv_reg0写入0x1007，

sudo ./reg_rw /dev/xdma0_user 0x0000 w 0x0007 

尾号7，就是0111，最右侧三个灯会亮起


////////             以下是一步一步操作

1.点击右上角 Tools->Create and Package New IP，点next

![image](https://github.com/user-attachments/assets/ab86b1fd-ca01-41f4-b021-933eabdc57a3)

2.起个名字

![image](https://github.com/user-attachments/assets/280ea7d0-696a-4da6-a1d4-da2dd865be4f)

3.选择Slave端，LITE协议 , 这里默认带宽32，控制4个寄存器

![image](https://github.com/user-attachments/assets/c642e750-626c-482b-a2f7-2853891c37a7)

4.生成一个有测试文件的示例

![image](https://github.com/user-attachments/assets/43ccda5f-efa0-483d-8e83-2671b9266a67)

5.测试结果的波形、LITE协议的解读 参考顶部的参考博客，这里在source中找到刚刚生成的SLAVE ip核，右键，Generate Output Products,  generate

6.这样就得到SLAVE的代码了，展开到最下面，把最里层的代码复制到一个新的工程

![image](https://github.com/user-attachments/assets/edad565d-6cd5-4fb6-bea3-9ad79a6b5503)

7.在新的工程里，修改刚刚的文件，

（1）新增输出端口及其寄存器

![image](https://github.com/user-attachments/assets/2ba2716d-af9c-4f99-a01d-d179f1363bee)

![image](https://github.com/user-attachments/assets/f8f396d8-9686-4eed-aef4-69186d33b921)


（2）拉到最后，写输出逻辑，这里截取slv_reg0的低8位作为LED的输出信号

![image](https://github.com/user-attachments/assets/bda439cc-72d9-411e-8c33-309dc5265769)


8.创建blockdesign，导入刚刚设计的SLAVE、XDMA、DDR（挂两个设备，练习区分地址），之后AUTO剩下的模块

![image](https://github.com/user-attachments/assets/c42a80ef-3204-43aa-99ea-d1aa83fa7dfc)

9.生成顶层代码，引脚约束，烧入FPGA，重启

10.驱动使用的是XDMA安装程序自带的，在tools下面的reg_rw.c,编译它，

AXI 地址与 slv_reg 变量的映射

AXI4-Lite 访问寄存器的方式通常是：每个寄存器占用 4 字节（32-bit）。地址是按 4 字节对齐的，例如 0x00000000, 0x00000004, 0x00000008, 0x0000000C 等。

如果AXI 从机模块的地址范围是 4K（0x00000000 ~ 0x00000FFF），

那么通常 slv_reg0 对应的地址是 0x00000000，slv_reg1 对应 0x00000004，依次类推。 0x0000 是 AXI_lite_slave 的基址，slv_reg0对应的 就是0x0000，所以向0x00000000中写入就是向slv_reg0中写入

本实验中， 将 slv_reg0的低8位赋给led引脚， 通过XDMA向slv_reg0写入0x1007，

sudo ./reg_rw /dev/xdma0_user 0x00000000 w 0x0007 

0x00000000是AXI分配给这个SLAVE的基址（blockdesign中的 address Editor 选项卡里可查看），也是slv_reg0的地址

写入0x0007，就是0111，最右侧三个灯会亮起

写入0x0008，就是1000，从右边数第四个灯会亮
