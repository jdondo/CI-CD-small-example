#!/bin/bash

iverilog -o sim.out ../rtl/adder.v ../tb/adder_tb.v
vvp sim.out
