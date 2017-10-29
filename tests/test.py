import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer

clock_speed = 1000

@cocotb.test()
def dummy_test(dut):
    dut._log.info("Running test")
    cocotb.fork(Clock(dut.clk, clock_speed).start())
    yield Timer(clock_speed*10)
