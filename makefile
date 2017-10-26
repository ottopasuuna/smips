VERILOG_SOURCES = *.v
TOPLEVEL = smips
MODULE = test
GUI = 1

include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim

clean::
	rm -f waveform.vcd
	rm -rf sim_build
