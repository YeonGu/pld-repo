# Interfaces
- **output** HDMI(TMDS)
	- HDMI_M
	- HDMI_S
- VIDEO_REQ
	- **output** REQ
	- **input** DATA
- RAW VIDEO READ
	- CAMERA READ FIFO
	- UI READ FIFO
- 
# Config RAM 配置寄存器
1. APB WRITE/READ
2. Register (Video generator) READ

```
Video Generator Config RAM
4 bytes on E203 APB BUS

0x0 SETX
XXXX XXXX

0x1 SETY
YYYY YYYY

0x2 SET
SSSS ZEOO
|||| ||
|||| ||Enable (Slave) Video Output
|||| |Size 
||||	(0b0:256 0b1:128)
|Select
	0x0: bicubic 2x
	0x1: bicubic 4x

0x3 CONF
CCCC CCCC

```
