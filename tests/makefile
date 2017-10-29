VERILOG_SOURCES = ../src/*.v
TOPLEVEL = smips
MODULE = test
COMPILE_ARGS = -I ../src/

include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim

clean::
	rm -f waveform.vcd
	rm -rf sim_build
