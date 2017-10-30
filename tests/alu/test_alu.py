import cocotb
from cocotb.triggers import Timer
from cocotb.scoreboard import Scoreboard
from cocotb.result import TestFailure
import random

NUM_TESTS = 10


@cocotb.test()
def test_add(dut):
    yield Timer(2)
    dut.ctl = 0b0010
    for i in range(NUM_TESTS):

        A = random.randint(-1000, 1000)
        B = random.randint(-1000, 1000)

        dut.data_1 = A
        dut.data_2 = B
        dut._log.debug("Testing {}, {}".format(A, B))

        yield Timer(2)

        res = dut.res.value # Get the cocotb.binary.BinaryRepresentation
        if res.signed_integer != A + B:
            raise TestFailure("Failed: {} {}: expected {}, got {}".format(
                A, B, A+B, res.signed_integer))
        else:
            dut._log.debug("Good")

@cocotb.test()
def test_sub(dut):
    yield Timer(2)
    dut.ctl = 0b0110
    for i in range(NUM_TESTS):

        A = random.randint(-1000, 1000)
        B = random.randint(-1000, 1000)

        dut.data_1 = A
        dut.data_2 = B
        dut._log.debug("Testing {}, {}".format(A, B))

        yield Timer(2)

        res = dut.res.value # Get the cocotb.binary.BinaryRepresentation
        if res.signed_integer != A - B:
            raise TestFailure("Failed: {} {}: expected {}, got {}".format(
                A, B, A-B, res.signed_integer))
        else:
            dut._log.debug("Good")

@cocotb.test()
def test_AND(dut):
    yield Timer(2)
    dut.ctl = 0b0000
    for i in range(NUM_TESTS):

        A = random.randint(-1000, 1000)
        B = random.randint(-1000, 1000)

        dut.data_1 = A
        dut.data_2 = B
        dut._log.debug("Testing {}, {}".format(A, B))

        yield Timer(2)

        res = dut.res.value # Get the cocotb.binary.BinaryRepresentation
        if res.signed_integer != A & B:
            raise TestFailure("Failed: {} {}: expected {}, got {}".format(
                A, B, A&B, res.signed_integer))
        else:
            dut._log.debug("Good")

@cocotb.test()
def test_OR(dut):
    yield Timer(2)
    dut.ctl = 0b0001
    for i in range(NUM_TESTS):

        A = random.randint(-1000, 1000)
        B = random.randint(-1000, 1000)

        dut.data_1 = A
        dut.data_2 = B
        dut._log.debug("Testing {}, {}".format(A, B))

        yield Timer(2)

        res = dut.res.value # Get the cocotb.binary.BinaryRepresentation
        if res.signed_integer != A | B:
            raise TestFailure("Failed: {} {}: expected {}, got {}".format(
                A, B, A|B, res.signed_integer))
        else:
            dut._log.debug("Good")

@cocotb.test()
def test_NOR(dut):
    yield Timer(2)
    dut.ctl = 0b1100
    for i in range(NUM_TESTS):

        A = random.randint(-1000, 1000)
        B = random.randint(-1000, 1000)

        dut.data_1 = A
        dut.data_2 = B
        dut._log.debug("Testing {}, {}".format(A, B))

        yield Timer(2)

        res = dut.res.value # Get the cocotb.binary.BinaryRepresentation
        if res.signed_integer != ~(A | B):
            raise TestFailure("Failed: {} {}: expected {}, got {}".format(
                A, B, ~(A|B), res.signed_integer))
        else:
            dut._log.debug("Good")
