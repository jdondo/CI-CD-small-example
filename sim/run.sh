#!/bin/bash

iverilog -o sim.out ../RTL/adder.v ../tb/adder_tb.v
vvp sim.out
gtkwave adder_tb.vcd --script add_signals.tcl

