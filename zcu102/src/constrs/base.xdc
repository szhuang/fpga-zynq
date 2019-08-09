set_property PACKAGE_PIN H9 [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS [get_ports SYSCLK_P]
set_property PACKAGE_PIN G9 [get_ports SYSCLK_N]
set_property IOSTANDARD LVDS [get_ports SYSCLK_N]
create_clock -add -name SYSCLK_P -period 5.00 -waveform {0 2.5} [get_ports SYSCLK_P]

#########################################################
set_property PACKAGE_PIN AL8 [get_ports SYSCLK_P]
set_property IOSTANDARD DIFF_SSTL12 [get_ports SYSCLK_P]



set_property PACKAGE_PIN AL7 [get_ports SYSCLK_N]
set_property IOSTANDARD DIFF_SSTL12 [get_ports SYSCLK_N]


set_property PACKAGE_PIN E13 [get_ports UART_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_rxd]
set_property PACKAGE_PIN F13 [get_ports UART_txd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_txd]


create_clock -period 3.333 -name SYSCLK_P -waveform {0.000 1.6666666666666667} -add [get_ports SYSCLK_P]
