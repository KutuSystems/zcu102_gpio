# XDC for ZCU102_GPIO design

# PMOD I/O's
set_property IOSTANDARD LVCMOS33 [get_ports pmod*]
set_property IOSTANDARD LVCMOS33 [get_ports msp_nrst]
set_property PACKAGE_PIN B20     [get_ports msp_nrst]
set_property IOSTANDARD LVCMOS33 [get_ports msp_test]
set_property PACKAGE_PIN A22     [get_ports msp_test]

set_property IOSTANDARD LVCMOS33 [get_ports gpio_led*]
set_property PACKAGE_PIN AG14    [get_ports {gpio_led[0]}]
set_property PACKAGE_PIN AF13    [get_ports {gpio_led[1]}]
set_property PACKAGE_PIN AE13    [get_ports {gpio_led[2]}]
set_property PACKAGE_PIN AJ14    [get_ports {gpio_led[3]}]

#set_property PACKAGE_PIN A20      [get_ports {pmod_0[0]}]
#set_property PACKAGE_PIN B20      [get_ports {pmod_0[1]}]
#set_property PACKAGE_PIN A22      [get_ports {pmod_0[2]}]
#set_property PACKAGE_PIN A21      [get_ports {pmod_0[3]}]
#set_property PACKAGE_PIN B21      [get_ports {pmod_0[4]}]
#set_property PACKAGE_PIN C21      [get_ports {pmod_0[5]}]
#set_property PACKAGE_PIN C22      [get_ports {pmod_0[6]}]
#set_property PACKAGE_PIN D21      [get_ports {pmod_0[7]}]

set_property PACKAGE_PIN D20      [get_ports {pmod_1[0]}]
set_property PACKAGE_PIN E20      [get_ports {pmod_1[1]}]
set_property PACKAGE_PIN D22      [get_ports {pmod_1[2]}]
set_property PACKAGE_PIN E22      [get_ports {pmod_1[3]}]
set_property PACKAGE_PIN F20      [get_ports {pmod_1[4]}]
set_property PACKAGE_PIN G20      [get_ports {pmod_1[5]}]
set_property PACKAGE_PIN J20      [get_ports {pmod_1[6]}]
set_property PACKAGE_PIN J19      [get_ports {pmod_1[7]}]
