## **AXI学习笔记（一）观察AXI full 时序**

## 学习原视频：b站奇哥，这里记录要一下学习过程，原视频非常细致，系统

https://www.bilibili.com/video/BV1mD4y1p7UK/?spm_id_from=333.788&vd_source=e35fc70f68490e4d1819679daf66d69b

AXI 4 FULL——从vivado创建一个ip核管理工程，选择axi接口，自己的输出连输入，电路和仿真代码参考奇哥

![block design](https://i-blog.csdnimg.cn/direct/460ecdc67d0546bfae5a457ac3339f87.png)

1.协议参考文件 IHI0022E（俩哎不是俩1）
![通信原理图](https://i-blog.csdnimg.cn/direct/4ca11cefa9f74c13a14288cb9c76d7e2.png)

五个通道：
（1）w_add channel： AWVALID（M） AWREADY（S）两者同时拉高，才是有效信号 
（2） w_data channel：
（3）w_response : 返回00表示 成功响应
（4） r_add 
（5）r_data
   
2.AXI突发总线--连续传输（效率高速度快）
eg：突发8次，一次连续传输8次
P47 突发模式
（1）FIX 固定模式，突发8次全都写到一个内存地址里
（2）INCR 自增模式，写一个数据地址+1
（3）WRAP扫描模式，不怎么用
3.时序
valid和ready同时拉高，表示有效
eg：m awvalid 和 m awvalid同时拉高，表示M端、地址写入、有效（可以写入地址了）
先写地址，（两高后）紧跟着（打一拍后，黄线）写数据，最后一个数据和last信号同时发送
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/2ebbd83441934613b1f5c90f1807f51f.png)

写完数据，有一个响应信号

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/72dddc40b18042e8b940551a4cf43829.png)


先读地址，紧跟着读数据，最后一个数据和last信号同时发出
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/a1ebd9ac380a4fdea4a2567ca9259681.png)


写完信号，有一个响应引信号 00代表ok
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/ec15af3856554f0395bee551ba924ec3.png)


几个主要的信号，S端和M端是一样的
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/d32af48df431454fbde96dc8a872e2dd.png)


其他零碎笔记：
粗暴划分channel：每到一个id 表示一个通道的开始，ready 表示一个通道的结束
eg：m主机 a地址w写通道 
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/7ede5163f501406fa3f689f22b6322ad.png)


（1）写地址，awvalid 与awready同时拉高，当前地址、数据有效，
注意：awaddr是32位，下图中则是“40000000（七个零）”其中“4”是0100 ，那就是01+32个0，这个“01”是映射的时候才有的，不影响阅读（01在后面32位有效位之外）
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/b8fc6d490a674441bdb23abf26052ad2.png)


 （2）写数据（准备信号、有效信号都拉高）
 
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/e2da27e09f6f4ae4984f1487bc8ee941.png)

（3）反馈


![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/0adf2518571743cbba3bde89c75d3b45.png)
