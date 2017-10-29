import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer

clock_period = 1000

@cocotb.coroutine
def reset(reset_pin):
    reset_pin._log.info("Resetting")
    reset_pin <= 1
    yield Timer(clock_period*1.5)
    reset_pin <= 0
    reset_pin._log.info("Reset complete")


@cocotb.test()
def dummy_test(dut):
    dut._log.info("Running test")
    cocotb.fork(Clock(dut.clk, clock_period).start())
    reset_pin = dut.reset
    yield reset(reset_pin)
    yield Timer(clock_period*10)
