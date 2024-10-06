set_clock_groups -async -group [get_clocks -of [get_pins design_1_i/clk_wiz_0/main_clk]] -group [get_clocks -of [get_pins design_1_i/clk_wiz_0/sa_clk]]

# set_property -dict {LOC AM17 IOSTANDARD LVCMOS18 PULLUP true} [get_ports i_pcie_rstn]
set_property -dict { PACKAGE_PIN AM17  IOSTANDARD LVCMOS18  PULLUP true } [get_ports i_pcie_rstn];   
# PCIe 复位


set_property PACKAGE_PIN AL9  [get_ports { i_pcie_refclkp }];   
# PCIe 差分时钟



set_property PACKAGE_PIN Y7   [get_ports { o_pcie_txp[0] }];    # PCIe 差分信号 (FPGA侧TX 第0对)
# set_property PACKAGE_PIN AB7  [get_ports { o_pcie_txp[1] }];    # PCIe 差分信号 (FPGA侧TX 第1对)
# set_property PACKAGE_PIN AD7  [get_ports { o_pcie_txp[2] }];    # PCIe 差分信号 (FPGA侧TX 第2对)
# set_property PACKAGE_PIN AF7  [get_ports { o_pcie_txp[3] }];    # PCIe 差分信号 (FPGA侧TX 第3对)
# set_property PACKAGE_PIN AH7  [get_ports { o_pcie_txp[4] }];    # PCIe 差分信号 (FPGA侧TX 第4对)
# set_property PACKAGE_PIN AK7  [get_ports { o_pcie_txp[5] }];    # PCIe 差分信号 (FPGA侧TX 第5对)
# set_property PACKAGE_PIN AM7  [get_ports { o_pcie_txp[6] }];    # PCIe 差分信号 (FPGA侧TX 第6对)
# set_property PACKAGE_PIN AN5  [get_ports { o_pcie_txp[7] }];    # PCIe 差分信号 (FPGA侧TX 第7对)

# set_property PACKAGE_PIN AP7  [get_ports { o_pcie_txp[8] }];    # PCIe 差分信号 (FPGA侧TX  第8对 )
# set_property PACKAGE_PIN Ar5  [get_ports { o_pcie_txp[9] }];    # PCIe 差分信号 (FPGA侧TX  第9对 )
# set_property PACKAGE_PIN AT7  [get_ports { o_pcie_txp[10] }];    # PCIe 差分信号 (FPGA侧TX 第10对)
# set_property PACKAGE_PIN AU5  [get_ports { o_pcie_txp[11] }];    # PCIe 差分信号 (FPGA侧TX 第11对)
# set_property PACKAGE_PIN AW5  [get_ports { o_pcie_txp[12] }];    # PCIe 差分信号 (FPGA侧TX 第12对)
# set_property PACKAGE_PIN BA5  [get_ports { o_pcie_txp[13] }];    # PCIe 差分信号 (FPGA侧TX 第13对)
# set_property PACKAGE_PIN BC5  [get_ports { o_pcie_txp[14] }];    # PCIe 差分信号 (FPGA侧TX 第14对)
# set_property PACKAGE_PIN BE5  [get_ports { o_pcie_txp[15] }];    # PCIe 差分信号 (FPGA侧TX 第15对)



set_property PACKAGE_PIN AA4  [get_ports { i_pcie_rxp[0] }];   # PCIe 差分信号 (FPGA侧RX 第0对)
# set_property PACKAGE_PIN AB2  [get_ports { i_pcie_rxp[1] }];    # PCIe 差分信号 (FPGA侧RX 第1对)
# set_property PACKAGE_PIN AC4  [get_ports { i_pcie_rxp[2] }];    # PCIe 差分信号 (FPGA侧RX 第2对)
# set_property PACKAGE_PIN AD2  [get_ports { i_pcie_rxp[3] }];    # PCIe 差分信号 (FPGA侧RX 第3对)
# set_property PACKAGE_PIN AE4  [get_ports { i_pcie_rxp[4] }];    # PCIe 差分信号 (FPGA侧RX 第4对)
# set_property PACKAGE_PIN AF2  [get_ports { i_pcie_rxp[5] }];    # PCIe 差分信号 (FPGA侧RX 第5对)
# set_property PACKAGE_PIN AG4  [get_ports { i_pcie_rxp[6] }];    # PCIe 差分信号 (FPGA侧RX 第6对)
# set_property PACKAGE_PIN AH2  [get_ports { i_pcie_rxp[7] }];    # PCIe 差分信号 (FPGA侧RX 第7对)

# set_property PACKAGE_PIN AJ4  [get_ports { i_pcie_rxp[8] }];    # PCIe 差分信号  (FPGA侧RX 第8对 ) 
# set_property PACKAGE_PIN AK2  [get_ports { i_pcie_rxp[9] }];    # PCIe 差分信号  (FPGA侧RX 第9对 )
# set_property PACKAGE_PIN AM2  [get_ports { i_pcie_rxp[10] }];    # PCIe 差分信号 (FPGA侧RX 第10对)
# set_property PACKAGE_PIN AP2  [get_ports { i_pcie_rxp[11] }];    # PCIe 差分信号 (FPGA侧RX 第11对)
# set_property PACKAGE_PIN AT2  [get_ports { i_pcie_rxp[12] }];    # PCIe 差分信号 (FPGA侧RX 第12对)
# set_property PACKAGE_PIN AV2  [get_ports { i_pcie_rxp[13] }];    # PCIe 差分信号 (FPGA侧RX 第13对)
# set_property PACKAGE_PIN AY2  [get_ports { i_pcie_rxp[14] }];    # PCIe 差分信号 (FPGA侧RX 第14对)
# set_property PACKAGE_PIN BB2  [get_ports { i_pcie_rxp[15] }];    # PCIe 差分信号 (FPGA侧RX 第15对)
