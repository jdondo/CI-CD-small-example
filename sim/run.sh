#!/bin/bash

iverilog -o sim.out ../RTL/adder.v ../tb/adder_tb.v
vvp sim.out

