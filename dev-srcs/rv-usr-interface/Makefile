SHELL := /bin/bash
run:
	@cd build && cmake .. && ./rv_user_interface

TARGET = soc-main

HBIRD_SDK_ROOT = ../../../hbird-sdk
SIM_FILE_ROOT = ../../rtl-srcs/e203-soc/sims

SRCDIRS = . soc core

INCDIRS = . soc core

include $(HBIRD_SDK_ROOT)/Build/Makefile.base

rv:
	make dasm -j20
	cp ./$(TARGET).verilog $(SIM_FILE_ROOT)