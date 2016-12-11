## This file is a general .xdc for the Nexys4 DDR Rev. C
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports CLK100MHZ]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK100MHZ]


##Switches

set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {SW[0]}]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {SW[1]}]
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {SW[2]}]
set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports {SW[3]}]
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {SW[4]}]
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports {SW[5]}]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {SW[6]}]
set_property -dict {PACKAGE_PIN R13 IOSTANDARD LVCMOS33} [get_ports {SW[7]}]
set_property -dict {PACKAGE_PIN T8 IOSTANDARD LVCMOS18} [get_ports {SW[8]}]
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS18} [get_ports {SW[9]}]
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports {SW[10]}]
set_property -dict {PACKAGE_PIN T13 IOSTANDARD LVCMOS33} [get_ports {SW[11]}]
set_property -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS33} [get_ports {SW[12]}]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {SW[13]}]
#set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { SW[14] }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=sw[14]
#set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { SW[15] }]; #IO_L21P_T3_DQS_14 Sch=sw[15]


## LEDs

set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {LED[0]}]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {LED[1]}]
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {LED[2]}]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {LED[3]}]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {LED[4]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {LED[5]}]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {LED[6]}]
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {LED[7]}]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {LED[8]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {LED[9]}]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {LED[10]}]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {LED[11]}]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {LED[12]}]
set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {LED[13]}]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {LED[14]}]
set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports {LED[15]}]

#set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { LED16_B }]; #IO_L5P_T0_D06_14 Sch=led16_b
#set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { LED16_G }]; #IO_L10P_T1_D14_14 Sch=led16_g
#set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { LED16_R }]; #IO_L11P_T1_SRCC_14 Sch=led16_r
#set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { LED17_B }]; #IO_L15N_T2_DQS_ADV_B_15 Sch=led17_b
#set_property -dict { PACKAGE_PIN R11   IOSTANDARD LVCMOS33 } [get_ports { LED17_G }]; #IO_0_14 Sch=led17_g
#set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { LED17_R }]; #IO_L11N_T1_SRCC_14 Sch=led17_r


#7 segment display

set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {seg[0]}]
set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports {seg[1]}]
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports {seg[2]}]
set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {seg[3]}]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {seg[4]}]
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {seg[5]}]
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {seg[6]}]

set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports dp]

set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports {an[0]}]
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {an[1]}]
set_property -dict {PACKAGE_PIN T9 IOSTANDARD LVCMOS33} [get_ports {an[2]}]
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {an[3]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {an[4]}]
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {an[5]}]
set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33} [get_ports {an[6]}]
set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports {an[7]}]


##Buttons

set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVCMOS33 } [get_ports { CPU_RESETN }]; #IO_L3P_T0_DQS_AD1P_15 Sch=cpu_resetn

set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports BTNC]
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports BTNU]
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports BTNL]
#set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { BTNR }]; #IO_L10N_T1_D15_14 Sch=btnr
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports BTND]


##Pmod Headers


##Pmod Header JA

#set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { JA[1] }]; #IO_L20N_T3_A19_15 Sch=ja[1]
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { JA[2] }]; #IO_L21N_T3_DQS_A18_15 Sch=ja[2]
#set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { JA[3] }]; #IO_L21P_T3_DQS_15 Sch=ja[3]
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { JA[4] }]; #IO_L18N_T2_A23_15 Sch=ja[4]
#set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { JA[7] }]; #IO_L16N_T2_A27_15 Sch=ja[7]
#set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { JA[8] }]; #IO_L16P_T2_A28_15 Sch=ja[8]
#set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { JA[9] }]; #IO_L22N_T3_A16_15 Sch=ja[9]
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { JA[10] }]; #IO_L22P_T3_A17_15 Sch=ja[10]


##Pmod Header JB

#set_property -dict { PACKAGE_PIN D14   IOSTANDARD LVCMOS33 } [get_ports { JB[1] }]; #IO_L1P_T0_AD0P_15 Sch=jb[1]
#set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { JB[2] }]; #IO_L14N_T2_SRCC_15 Sch=jb[2]
#set_property -dict { PACKAGE_PIN G16   IOSTANDARD LVCMOS33 } [get_ports { JB[3] }]; #IO_L13N_T2_MRCC_15 Sch=jb[3]
#set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVCMOS33 } [get_ports { JB[4] }]; #IO_L15P_T2_DQS_15 Sch=jb[4]
#set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports { JB[7] }]; #IO_L11N_T1_SRCC_15 Sch=jb[7]
#set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVCMOS33 } [get_ports { JB[8] }]; #IO_L5P_T0_AD9P_15 Sch=jb[8]
#set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { JB[9] }]; #IO_0_15 Sch=jb[9]
#set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { JB[10] }]; #IO_L13P_T2_MRCC_15 Sch=jb[10]


##Pmod Header JC

#set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { JC[1] }]; #IO_L23N_T3_35 Sch=jc[1]
#set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { JC[2] }]; #IO_L19N_T3_VREF_35 Sch=jc[2]
#set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { JC[3] }]; #IO_L22N_T3_35 Sch=jc[3]
#set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { JC[4] }]; #IO_L19P_T3_35 Sch=jc[4]
#set_property -dict { PACKAGE_PIN E7    IOSTANDARD LVCMOS33 } [get_ports { JC[7] }]; #IO_L6P_T0_35 Sch=jc[7]
#set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { JC[8] }]; #IO_L22P_T3_35 Sch=jc[8]
#set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { JC[9] }]; #IO_L21P_T3_DQS_35 Sch=jc[9]
#set_property -dict { PACKAGE_PIN E6    IOSTANDARD LVCMOS33 } [get_ports { JC[10] }]; #IO_L5P_T0_AD13P_35 Sch=jc[10]


##Pmod Header JD

#set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { JD[1] }]; #IO_L21N_T3_DQS_35 Sch=jd[1]
#set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { JD[2] }]; #IO_L17P_T2_35 Sch=jd[2]
#set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { JD[3] }]; #IO_L17N_T2_35 Sch=jd[3]
#set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { JD[4] }]; #IO_L20N_T3_35 Sch=jd[4]
#set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { JD[7] }]; #IO_L15P_T2_DQS_35 Sch=jd[7]
#set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { JD[8] }]; #IO_L20P_T3_35 Sch=jd[8]
#set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { JD[9] }]; #IO_L15N_T2_DQS_35 Sch=jd[9]
#set_property -dict { PACKAGE_PIN F3    IOSTANDARD LVCMOS33 } [get_ports { JD[10] }]; #IO_L13N_T2_MRCC_35 Sch=jd[10]


#Pmod Header JXADC

set_property -dict {PACKAGE_PIN A14 IOSTANDARD LVCMOS33} [get_ports vauxn3]
set_property -dict {PACKAGE_PIN A13 IOSTANDARD LVCMOS33} [get_ports vauxp3]
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33     } [get_ports { vauxn10}]; #IO_L8N_T1_AD10N_15 Sch=xa_n[2]
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33     } [get_ports { vauxp10 }]; #IO_L8P_T1_AD10P_15 Sch=xa_p[2]
set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33     } [get_ports { vauxn2 }]; #IO_L7N_T1_AD2N_15 Sch=xa_n[3]
set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33     } [get_ports { vauxp2 }]; #IO_L7P_T1_AD2P_15 Sch=xa_p[3]
set_property -dict {PACKAGE_PIN A18 IOSTANDARD LVCMOS33} [get_ports vauxn11]
set_property -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS33} [get_ports vauxp11]


##VGA Connector

set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {VGA_R[0]}]
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports {VGA_R[1]}]
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS33} [get_ports {VGA_R[2]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {VGA_R[3]}]

set_property -dict {PACKAGE_PIN C6 IOSTANDARD LVCMOS33} [get_ports {VGA_G[0]}]
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS33} [get_ports {VGA_G[1]}]
set_property -dict {PACKAGE_PIN B6 IOSTANDARD LVCMOS33} [get_ports {VGA_G[2]}]
set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVCMOS33} [get_ports {VGA_G[3]}]

set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS33} [get_ports {VGA_B[0]}]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS33} [get_ports {VGA_B[1]}]
set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS33} [get_ports {VGA_B[2]}]
set_property -dict {PACKAGE_PIN D8 IOSTANDARD LVCMOS33} [get_ports {VGA_B[3]}]

set_property -dict {PACKAGE_PIN B11 IOSTANDARD LVCMOS33} [get_ports VGA_HS]
set_property -dict {PACKAGE_PIN B12 IOSTANDARD LVCMOS33} [get_ports VGA_VS]


##Micro SD Connector

#set_property -dict { PACKAGE_PIN E2    IOSTANDARD LVCMOS33 } [get_ports { SD_RESET }]; #IO_L14P_T2_SRCC_35 Sch=sd_reset
#set_property -dict { PACKAGE_PIN A1    IOSTANDARD LVCMOS33 } [get_ports { SD_CD }]; #IO_L9N_T1_DQS_AD7N_35 Sch=sd_cd
#set_property -dict { PACKAGE_PIN B1    IOSTANDARD LVCMOS33 } [get_ports { SD_SCK }]; #IO_L9P_T1_DQS_AD7P_35 Sch=sd_sck
#set_property -dict { PACKAGE_PIN C1    IOSTANDARD LVCMOS33 } [get_ports { SD_CMD }]; #IO_L16N_T2_35 Sch=sd_cmd
#set_property -dict { PACKAGE_PIN C2    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[0] }]; #IO_L16P_T2_35 Sch=sd_dat[0]
#set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[1] }]; #IO_L18N_T2_35 Sch=sd_dat[1]
#set_property -dict { PACKAGE_PIN F1    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[2] }]; #IO_L18P_T2_35 Sch=sd_dat[2]
#set_property -dict { PACKAGE_PIN D2    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[3] }]; #IO_L14N_T2_SRCC_35 Sch=sd_dat[3]


##Accelerometer

#set_property -dict { PACKAGE_PIN E15   IOSTANDARD LVCMOS33 } [get_ports { ACL_MISO }]; #IO_L11P_T1_SRCC_15 Sch=acl_miso
#set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { ACL_MOSI }]; #IO_L5N_T0_AD9N_15 Sch=acl_mosi
#set_property -dict { PACKAGE_PIN F15   IOSTANDARD LVCMOS33 } [get_ports { ACL_SCLK }]; #IO_L14P_T2_SRCC_15 Sch=acl_sclk
#set_property -dict { PACKAGE_PIN D15   IOSTANDARD LVCMOS33 } [get_ports { ACL_CSN }]; #IO_L12P_T1_MRCC_15 Sch=acl_csn
#set_property -dict { PACKAGE_PIN B13   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[1] }]; #IO_L2P_T0_AD8P_15 Sch=acl_int[1]
#set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[2] }]; #IO_L20P_T3_A20_15 Sch=acl_int[2]


##Temperature Sensor

#set_property -dict { PACKAGE_PIN C14   IOSTANDARD LVCMOS33 } [get_ports { TMP_SCL }]; #IO_L1N_T0_AD0N_15 Sch=tmp_scl
#set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { TMP_SDA }]; #IO_L12N_T1_MRCC_15 Sch=tmp_sda
#set_property -dict { PACKAGE_PIN D13   IOSTANDARD LVCMOS33 } [get_ports { TMP_INT }]; #IO_L6N_T0_VREF_15 Sch=tmp_int
#set_property -dict { PACKAGE_PIN B14   IOSTANDARD LVCMOS33 } [get_ports { TMP_CT }]; #IO_L2N_T0_AD8N_15 Sch=tmp_ct

##Omnidirectional Microphone

#set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { M_CLK }]; #IO_25_35 Sch=m_clk
#set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { M_DATA }]; #IO_L24N_T3_35 Sch=m_data
#set_property -dict { PACKAGE_PIN F5    IOSTANDARD LVCMOS33 } [get_ports { M_LRSEL }]; #IO_0_35 Sch=m_lrsel


##PWM Audio Amplifier

#set_property -dict { PACKAGE_PIN A11   IOSTANDARD LVCMOS33 } [get_ports { AUD_PWM }]; #IO_L4N_T0_15 Sch=aud_pwm
#set_property -dict { PACKAGE_PIN D12   IOSTANDARD LVCMOS33 } [get_ports { AUD_SD }]; #IO_L6P_T0_15 Sch=aud_sd


##USB-RS232 Interface

#set_property -dict { PACKAGE_PIN C4    IOSTANDARD LVCMOS33 } [get_ports { UART_TXD_IN }]; #IO_L7P_T1_AD6P_35 Sch=uart_txd_in
#set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { UART_RXD_OUT }]; #IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
#set_property -dict { PACKAGE_PIN D3    IOSTANDARD LVCMOS33 } [get_ports { UART_CTS }]; #IO_L12N_T1_MRCC_35 Sch=uart_cts
#set_property -dict { PACKAGE_PIN E5    IOSTANDARD LVCMOS33 } [get_ports { UART_RTS }]; #IO_L5N_T0_AD13N_35 Sch=uart_rts

##USB HID (PS/2)

#set_property -dict { PACKAGE_PIN F4    IOSTANDARD LVCMOS33 } [get_ports { PS2_CLK }]; #IO_L13P_T2_MRCC_35 Sch=ps2_clk
#set_property -dict { PACKAGE_PIN B2    IOSTANDARD LVCMOS33 } [get_ports { PS2_DATA }]; #IO_L10N_T1_AD15N_35 Sch=ps2_data


##SMSC Ethernet PHY

#set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDC }]; #IO_L11P_T1_SRCC_16 Sch=eth_mdc
#set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDIO }]; #IO_L14N_T2_SRCC_16 Sch=eth_mdio
#set_property -dict { PACKAGE_PIN B3    IOSTANDARD LVCMOS33 } [get_ports { ETH_RSTN }]; #IO_L10P_T1_AD15P_35 Sch=eth_rstn
#set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { ETH_CRSDV }]; #IO_L6N_T0_VREF_16 Sch=eth_crsdv
#set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXERR }]; #IO_L13N_T2_MRCC_16 Sch=eth_rxerr
#set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[0] }]; #IO_L13P_T2_MRCC_16 Sch=eth_rxd[0]
#set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[1] }]; #IO_L19N_T3_VREF_16 Sch=eth_rxd[1]
#set_property -dict { PACKAGE_PIN B9    IOSTANDARD LVCMOS33 } [get_ports { ETH_TXEN }]; #IO_L11N_T1_SRCC_16 Sch=eth_txen
#set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[0] }]; #IO_L14P_T2_SRCC_16 Sch=eth_txd[0]
#set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[1] }]; #IO_L12N_T1_MRCC_16 Sch=eth_txd[1]
#set_property -dict { PACKAGE_PIN D5    IOSTANDARD LVCMOS33 } [get_ports { ETH_REFCLK }]; #IO_L11P_T1_SRCC_35 Sch=eth_refclk
#set_property -dict { PACKAGE_PIN B8    IOSTANDARD LVCMOS33 } [get_ports { ETH_INTN }]; #IO_L12P_T1_MRCC_16 Sch=eth_intn


##Quad SPI Flash

#set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[0] }]; #IO_L1P_T0_D00_MOSI_14 Sch=qspi_dq[0]
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[1] }]; #IO_L1N_T0_D01_DIN_14 Sch=qspi_dq[1]
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[2] }]; #IO_L2P_T0_D02_14 Sch=qspi_dq[2]
#set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[3] }]; #IO_L2N_T0_D03_14 Sch=qspi_dq[3]
#set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33 } [get_ports { QSPI_CSN }]; #IO_L6P_T0_FCS_B_14 Sch=qspi_csn
















connect_debug_port u_ila_0/probe0 [get_nets [list {state[0]} {state[1]}]]
connect_debug_port u_ila_0/probe1 [get_nets [list {previousState[0]} {previousState[1]}]]


connect_debug_port u_ila_0/probe1 [get_nets [list {cursor1VoltageCharacter1[0]} {cursor1VoltageCharacter1[1]} {cursor1VoltageCharacter1[2]} {cursor1VoltageCharacter1[3]} {cursor1VoltageCharacter1[4]} {cursor1VoltageCharacter1[5]} {cursor1VoltageCharacter1[6]}]]
connect_debug_port u_ila_0/probe2 [get_nets [list {cursor1VoltageCharacter0[0]} {cursor1VoltageCharacter0[1]} {cursor1VoltageCharacter0[2]} {cursor1VoltageCharacter0[3]} {cursor1VoltageCharacter0[4]} {cursor1VoltageCharacter0[5]} {cursor1VoltageCharacter0[6]}]]
connect_debug_port u_ila_0/probe3 [get_nets [list {cursor1Voltage[0]} {cursor1Voltage[1]} {cursor1Voltage[2]} {cursor1Voltage[3]} {cursor1Voltage[4]} {cursor1Voltage[5]} {cursor1Voltage[6]} {cursor1Voltage[7]} {cursor1Voltage[8]} {cursor1Voltage[9]}]]
connect_debug_port u_ila_0/probe4 [get_nets [list {cursor1Number2[0]} {cursor1Number2[1]} {cursor1Number2[2]} {cursor1Number2[3]}]]
connect_debug_port u_ila_0/probe5 [get_nets [list {cursor1Number1[0]} {cursor1Number1[1]} {cursor1Number1[2]} {cursor1Number1[3]}]]
connect_debug_port u_ila_0/probe6 [get_nets [list {cursor1Number0[0]} {cursor1Number0[1]} {cursor1Number0[2]} {cursor1Number0[3]}]]






set_property MARK_DEBUG true [get_nets {cursor1Voltage[9]}]
set_property MARK_DEBUG true [get_nets {cursor1Voltage[8]}]
set_property MARK_DEBUG true [get_nets {cursor1Voltage[7]}]
set_property MARK_DEBUG true [get_nets {cursor1Voltage[6]}]
set_property MARK_DEBUG true [get_nets {cursor1Voltage[5]}]
set_property MARK_DEBUG true [get_nets {cursor1Voltage[4]}]
set_property MARK_DEBUG true [get_nets {cursor1Voltage[3]}]
set_property MARK_DEBUG true [get_nets {cursor1Voltage[2]}]
set_property MARK_DEBUG true [get_nets {cursor1Voltage[1]}]
set_property MARK_DEBUG true [get_nets {cursor1Voltage[0]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltage[9]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltage[8]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltage[2]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltage[0]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltage[7]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltage[5]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltage[1]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltage[6]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltage[3]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltage[4]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltageAbsoluteValue[9]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltageAbsoluteValue[7]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltageAbsoluteValue[5]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltageAbsoluteValue[3]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltageAbsoluteValue[1]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltageAbsoluteValue[6]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltageAbsoluteValue[4]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltageAbsoluteValue[2]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltageAbsoluteValue[8]}]
set_property MARK_DEBUG false [get_nets {yCursor1ToVoltage/voltageAbsoluteValue[0]}]
connect_debug_port u_ila_0/probe5 [get_nets [list {cursor1Voltage[0]} {cursor1Voltage[1]} {cursor1Voltage[2]} {cursor1Voltage[3]} {cursor1Voltage[4]} {cursor1Voltage[5]} {cursor1Voltage[6]} {cursor1Voltage[7]} {cursor1Voltage[8]} {cursor1Voltage[9]}]]


set_property MARK_DEBUG false [get_nets {yCursor1[10]}]
set_property MARK_DEBUG false [get_nets {yCursor1[9]}]
set_property MARK_DEBUG false [get_nets {yCursor1[11]}]
set_property MARK_DEBUG false [get_nets {yCursor1[8]}]
set_property MARK_DEBUG false [get_nets {yCursor1[7]}]
set_property MARK_DEBUG false [get_nets {yCursor1[6]}]
set_property MARK_DEBUG false [get_nets {yCursor1[4]}]
set_property MARK_DEBUG false [get_nets {yCursor1[3]}]
set_property MARK_DEBUG false [get_nets {yCursor1[2]}]
set_property MARK_DEBUG false [get_nets {yCursor1[0]}]
set_property MARK_DEBUG false [get_nets {yCursor1[5]}]
set_property MARK_DEBUG false [get_nets {yCursor1[1]}]

connect_debug_port u_ila_0/probe0 [get_nets [list {getMaxVoltageCharacters/signal[0]} {getMaxVoltageCharacters/signal[1]} {getMaxVoltageCharacters/signal[2]} {getMaxVoltageCharacters/signal[3]} {getMaxVoltageCharacters/signal[4]} {getMaxVoltageCharacters/signal[5]} {getMaxVoltageCharacters/signal[6]} {getMaxVoltageCharacters/signal[7]} {getMaxVoltageCharacters/signal[8]} {getMaxVoltageCharacters/signal[9]} {getMaxVoltageCharacters/signal[10]} {getMaxVoltageCharacters/signal[11]}]]
connect_debug_port u_ila_0/probe1 [get_nets [list {getMaxVoltageCharacters/character0[0]} {getMaxVoltageCharacters/character0[1]} {getMaxVoltageCharacters/character0[2]} {getMaxVoltageCharacters/character0[3]} {getMaxVoltageCharacters/character0[4]} {getMaxVoltageCharacters/character0[5]} {getMaxVoltageCharacters/character0[6]}]]
connect_debug_port u_ila_0/probe2 [get_nets [list {getMaxVoltageCharacters/character2[0]} {getMaxVoltageCharacters/character2[1]} {getMaxVoltageCharacters/character2[2]} {getMaxVoltageCharacters/character2[3]} {getMaxVoltageCharacters/character2[4]} {getMaxVoltageCharacters/character2[5]} {getMaxVoltageCharacters/character2[6]}]]
connect_debug_port u_ila_0/probe3 [get_nets [list {getMaxVoltageCharacters/character1[0]} {getMaxVoltageCharacters/character1[1]} {getMaxVoltageCharacters/character1[2]} {getMaxVoltageCharacters/character1[3]} {getMaxVoltageCharacters/character1[4]} {getMaxVoltageCharacters/character1[5]} {getMaxVoltageCharacters/character1[6]}]]
connect_debug_port u_ila_0/probe4 [get_nets [list {getMaxVoltageCharacters/scale[0]} {getMaxVoltageCharacters/scale[1]} {getMaxVoltageCharacters/scale[2]} {getMaxVoltageCharacters/scale[3]} {getMaxVoltageCharacters/scale[4]} {getMaxVoltageCharacters/scale[5]} {getMaxVoltageCharacters/scale[6]} {getMaxVoltageCharacters/scale[7]} {getMaxVoltageCharacters/scale[8]} {getMaxVoltageCharacters/scale[9]}]]
connect_debug_port u_ila_0/probe5 [get_nets [list {getMaxVoltageCharacters/scaleExponent[0]} {getMaxVoltageCharacters/scaleExponent[1]} {getMaxVoltageCharacters/scaleExponent[2]} {getMaxVoltageCharacters/scaleExponent[3]}]]
connect_debug_port u_ila_0/probe9 [get_nets [list {getminVoltageCharacters/scale[0]} {getminVoltageCharacters/scale[1]} {getminVoltageCharacters/scale[2]} {getminVoltageCharacters/scale[3]} {getminVoltageCharacters/scale[4]} {getminVoltageCharacters/scale[5]} {getminVoltageCharacters/scale[6]} {getminVoltageCharacters/scale[7]} {getminVoltageCharacters/scale[8]} {getminVoltageCharacters/scale[9]}]]
connect_debug_port u_ila_0/probe12 [get_nets [list {getMaxVoltageCharacters/voltageAbsoluteValue[0]} {getMaxVoltageCharacters/voltageAbsoluteValue[1]} {getMaxVoltageCharacters/voltageAbsoluteValue[2]} {getMaxVoltageCharacters/voltageAbsoluteValue[3]} {getMaxVoltageCharacters/voltageAbsoluteValue[4]} {getMaxVoltageCharacters/voltageAbsoluteValue[5]} {getMaxVoltageCharacters/voltageAbsoluteValue[6]} {getMaxVoltageCharacters/voltageAbsoluteValue[7]} {getMaxVoltageCharacters/voltageAbsoluteValue[8]} {getMaxVoltageCharacters/voltageAbsoluteValue[9]}]]
connect_debug_port u_ila_0/probe13 [get_nets [list {getminVoltageCharacters/voltage[0]} {getminVoltageCharacters/voltage[1]} {getminVoltageCharacters/voltage[2]} {getminVoltageCharacters/voltage[3]} {getminVoltageCharacters/voltage[4]} {getminVoltageCharacters/voltage[5]} {getminVoltageCharacters/voltage[6]} {getminVoltageCharacters/voltage[7]} {getminVoltageCharacters/voltage[8]} {getminVoltageCharacters/voltage[9]}]]
connect_debug_port u_ila_0/probe14 [get_nets [list {getMaxVoltageCharacters/voltageNumber0[0]} {getMaxVoltageCharacters/voltageNumber0[1]} {getMaxVoltageCharacters/voltageNumber0[2]} {getMaxVoltageCharacters/voltageNumber0[3]}]]
connect_debug_port u_ila_0/probe16 [get_nets [list {getMaxVoltageCharacters/voltageNumber2[0]} {getMaxVoltageCharacters/voltageNumber2[1]} {getMaxVoltageCharacters/voltageNumber2[2]} {getMaxVoltageCharacters/voltageNumber2[3]}]]
connect_debug_port u_ila_0/probe17 [get_nets [list {getMaxVoltageCharacters/voltageNumber1[0]} {getMaxVoltageCharacters/voltageNumber1[1]} {getMaxVoltageCharacters/voltageNumber1[2]} {getMaxVoltageCharacters/voltageNumber1[3]}]]
connect_debug_port u_ila_0/probe20 [get_nets [list {getMaxVoltageCharacters/voltage[0]} {getMaxVoltageCharacters/voltage[1]} {getMaxVoltageCharacters/voltage[2]} {getMaxVoltageCharacters/voltage[3]} {getMaxVoltageCharacters/voltage[4]} {getMaxVoltageCharacters/voltage[5]} {getMaxVoltageCharacters/voltage[6]} {getMaxVoltageCharacters/voltage[7]} {getMaxVoltageCharacters/voltage[8]} {getMaxVoltageCharacters/voltage[9]}]]
connect_debug_port u_ila_0/probe23 [get_nets [list getMaxVoltageCharacters/isPositive]]
connect_debug_port u_ila_0/probe24 [get_nets [list getMaxVoltageCharacters/voltageIsNegative]]



create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list ClockDivider/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 7 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {minCharacter4[0]} {minCharacter4[1]} {minCharacter4[2]} {minCharacter4[3]} {minCharacter4[4]} {minCharacter4[5]} {minCharacter4[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 7 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {minCharacter3[0]} {minCharacter3[1]} {minCharacter3[2]} {minCharacter3[3]} {minCharacter3[4]} {minCharacter3[5]} {minCharacter3[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 6 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {minCharacter2[0]} {minCharacter2[1]} {minCharacter2[2]} {minCharacter2[3]} {minCharacter2[5]} {minCharacter2[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 7 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {maxCharacter4[0]} {maxCharacter4[1]} {maxCharacter4[2]} {maxCharacter4[3]} {maxCharacter4[4]} {maxCharacter4[5]} {maxCharacter4[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 7 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {maxCharacter3[0]} {maxCharacter3[1]} {maxCharacter3[2]} {maxCharacter3[3]} {maxCharacter3[4]} {maxCharacter3[5]} {maxCharacter3[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 7 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {cursor2Character4[0]} {cursor2Character4[1]} {cursor2Character4[2]} {cursor2Character4[3]} {cursor2Character4[4]} {cursor2Character4[5]} {cursor2Character4[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 7 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {cursor2Character3[0]} {cursor2Character3[1]} {cursor2Character3[2]} {cursor2Character3[3]} {cursor2Character3[4]} {cursor2Character3[5]} {cursor2Character3[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 7 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {cursor2Character2[0]} {cursor2Character2[1]} {cursor2Character2[2]} {cursor2Character2[3]} {cursor2Character2[4]} {cursor2Character2[5]} {cursor2Character2[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 7 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {myText/maxCharacter2[0]} {myText/maxCharacter2[1]} {myText/maxCharacter2[2]} {myText/maxCharacter2[3]} {myText/maxCharacter2[4]} {myText/maxCharacter2[5]} {myText/maxCharacter2[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 7 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {myText/maxCharacter3[0]} {myText/maxCharacter3[1]} {myText/maxCharacter3[2]} {myText/maxCharacter3[3]} {myText/maxCharacter3[4]} {myText/maxCharacter3[5]} {myText/maxCharacter3[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 7 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {myText/maxCharacter4[0]} {myText/maxCharacter4[1]} {myText/maxCharacter4[2]} {myText/maxCharacter4[3]} {myText/maxCharacter4[4]} {myText/maxCharacter4[5]} {myText/maxCharacter4[6]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets CLK108MHZ]
