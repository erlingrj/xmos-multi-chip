#TARGET=2_STARTKITS
TARGET=2XCORE-200-EXPLORER
XSIM_OPTIONS=--vcd-tracing "-o trace.vcd -tile tile[0] -ports"
SOURCES=$(wildcard *.xc)

INCLUDE_OPTIONS=-I../uar

XCC_FLAGS= -Os -g -report -save-temps
XCC_MAP_FLAGS =-report
XMOS_MAKE_PATH ?= ../..

include $(XMOS_MAKE_PATH)/xcommon/module_xcommon/build/Makefile.common

clean:
	rm -f *.xe *.vcd *.gtkw objdump

sim:
	xsim $(XSIM_OPTIONS) $(EXE)

objdump:
	xobjdump --source $(EXE) > objdump