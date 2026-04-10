# 4-bit ALU Design in Verilog

## Overview

This project implements a **4-bit Arithmetic Logic Unit (ALU)** using **structural modeling in Verilog**.
The ALU performs basic Arithmetic and Logical Operations based on a 3-bit selection input (MUX). 

---

##  Operations Supported in the 4 bit ALU

| Select  | Operation   | Description      |
| -------------- | ----------- | ---------------- |
| 000            | Addition    | A + B            |
| 001            | Subtraction | A - B            |
| 010            | AND         | Bitwise AND      |
| 011            | OR          | Bitwise OR       |
| 100            | NOT         | Bitwise NOT of A |

---

##  Design Architecture

* **Adder**: Implemented using ripple carry full adders
* **Subtractor**: Implemented using full subtractor chain
* **Logic Operations**: AND, OR, NOT gates designed structurally
* **Multiplexer Logic**: `case(sel)` used to select operation
* **Output**: 5-bit (`out[4:0]`) to accommodate carry/borrow

---

## 📂 Project Structure

```
├── src/    → Verilog design files ( Adder, Subtractor, And gate,Or gate,Not gate)
├── tb/     → Testbench file
├── sim/    → Simulation waveforms
```

---

## 📊 Simulation Results

The ALU was verified using a testbench with multiple input combinations.

* All arithmetic and logical operations were tested
* Correct results observed in waveform simulation

 waveform screenshot:

```
## 📷 Waveform Output
![Waveform1](sim/waveform1.png)
![Waveform2](sim/waveform2.png)
![Waveform3](sim/waveform3.png)
![Waveform4](sim/waveform4.png)
![Waveform5](sim/waveform5.png)
```

---

##  Note on Subtraction

Subtraction is implemented using a **borrow-based subtractor**.

* If MSB (out[4]) = 1 → result is negative
* Output is in binary form and follows hardware representation
* This ALU does not convert into 2's Complement form of the borrow it is hardware form
---
##  Note on Not operation
* The not operation is done only in one input only
---
## 🚀 Future Improvements

* Add status flags:

  * Zero flag
  * Carry flag
  * Overflow flag
* Upgrade to **8-bit ALU**
* Upgarde to **32-bit ALU**
* Optimize design using **single adder for add/sub**

---

## 🛠 Tools Used

* Verilog HDL
* Xilinx Vivado (Simulation)

---

##  Author

PRAGADEESH J S

---

##  Conclusion

This project demonstrates the implementation of a basic ALU using structural modeling and verifies its functionality through simulation waveforms.The waveforms are in the sim folder
