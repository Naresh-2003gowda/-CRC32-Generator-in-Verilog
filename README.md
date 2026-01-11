# CRC32 Generator in Verilog

## 📌 Overview
This project implements a **CRC32 (Cyclic Redundancy Check – 32 bit)** generator using **Verilog HDL**.  
CRC32 is widely used in communication protocols such as **Ethernet, USB, PCIe**, and storage systems for error detection.
The design uses a **serial, LFSR-based approach** and is verified using **EDA Playground (Icarus Verilog)** with waveform visualization via **EPWave**.

## 🧠 CRC Polynomial
Standard CRC-32 (IEEE 802.3) polynomial:

## ⚙️ Design Features
- Serial CRC computation (1 bit per clock)
- Polynomial-based XOR logic
- Synchronous design with reset
- Enable-controlled CRC operation
- Verified using waveform analysis

## 🏗️ Architecture
1. Initialize CRC register to `0xFFFFFFFF`
2. XOR input bit with MSB of CRC
3. Shift CRC register left
4. Apply polynomial XOR when feedback = 1
5. Final CRC obtained after processing all bits

## 🧪 Simulation Details
- Tool: **EDA Playground**
- Simulator: **Icarus Verilog**
- Waveform Viewer: **EPWave**


