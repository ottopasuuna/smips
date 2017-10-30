VERILOG_SOURCES = ../../src/alu.v
TOPLEVEL = alu
MODULE = test_alu
COMPILE_ARGS = -I ../../src/

include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim

clean::
	rm -f waveform.vcd
	rm -rf sim_build
