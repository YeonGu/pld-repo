# E203在ZYBO板上的引脚绑定

## JTAG UART

```Plain
#####               MCU JTAG define           #####

set_property PACKAGE_PIN N15 [get_ports mcu_TDO]

set_property PACKAGE_PIN L14 [get_ports mcu_TCK]

set_property PACKAGE_PIN K16 [get_ports mcu_TDI]

set_property PACKAGE_PIN K14 [get_ports mcu_TMS]

set_property KEEPER true [get_ports mcu_TMS]

## UART TX

set_property PACKAGE_PIN J16  [get_ports {gpioA[17]}]

## UART RX

set_property PACKAGE_PIN J14  [get_ports {gpioA[16]}]
```

![[pmod.png]]
On PMOD1 JA

|     |     |     |     |
| --- | --- | --- | --- |
| 4   | 3   | 2   | 1   |
| K14 | K16 | L14 | N15 |
| TMS | TDI | TCK | TDO |
| 10  | 9   | 8   | 7   |
| J14 | J16 | L15 | N16 |
| RXD | TXD |     |     |
