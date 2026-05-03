# Hardware CI/CD Example – Automated RTL Verification

## 📌 Overview
This project demonstrates a simple but powerful CI/CD workflow applied to hardware design and verification.

A basic RTL module (adder) is verified using a testbench, and simulations are automatically executed on every commit using GitHub Actions.

## 🎯 Objective
Show how continuous integration can be applied to hardware projects to:
- Automatically validate RTL changes
- Detect functional errors early
- Improve verification efficiency

## 🧱 Project Structure

RTL/ -> Verilog design (adder 8bit)
tb/  ->  Testbench
sim/ -> Simularion Scripts
.github/workflow/ -> CI pipeline

## ⚙️ Tools Used
- Icarus Verilog (simulation)
- GTKWAVE 
- GitHub Actions (CI/CD automation)

## 🔄 CI Flow
On every push:
1. Code is checked out
2. Simulator is installed
3. Testbench is executed
4. Results determine pass/fail

## 🧪 Test Cases
- Basic additions
- Boundary conditions
- Error detection via assertions

## 🚀 Why This Matters
Modern hardware development increasingly adopts software practices like CI/CD.

This project shows how verification can be:
- Automated
- Reproducible
- Scalable

## 📈 Future Improvements
- Add randomized testing
- Coverage analysis
- Python-based result parsing
- More complex DUT (FIFO, ALU)

## 👤 Author: Julio Dondo Gazzano
Hardware Engineer focused on verification, automation, and robust system design.
