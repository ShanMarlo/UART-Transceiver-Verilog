# UART Transceiver Using Verilog HDL

## Project Overview
This project implements a UART (Universal Asynchronous Receiver Transmitter) using Verilog HDL and FPGA technology.

The design consists of a transmitter and receiver module, integrated through a top-level module and verified using simulation testbenches.

## Hardware and Software
- FPGA Board: Nexys A7-100T (Artix-7)
- Design Tool: Xilinx Vivado
- Hardware Description Language: Verilog HDL
- Communication Protocol: UART

## Project Structure

```text
UART-Transceiver-Verilog/
│
├── RTL/
│   ├── uart_tx.v
│   ├── uart_rx.v
│   └── uart_top.v
│
├── Testbench/
│   ├── uart_tb.v
│   └── uart_tx_tb.v
│
├── Constraints/
│   └── Nexys_A7_UART.xdc
│
├── Results/
│
└── README.md
```

## Design Modules

**1. UART Transmitter**
- Converts parallel data into serial data.
- Handles UART data transmission.

**2. UART Receiver**
- Receives serial data.
- Converts serial data into parallel data.

**3. UART Top Module**
- Integrates the transmitter and receiver.

## Verification
The design was verified using Verilog testbenches in Xilinx Vivado.

The following implementation stages were completed:
- RTL Design
- Behavioral Simulation
- Synthesis
- Implementation
- Bitstream Generation
- FPGA Programming and Testing

## Applications
- Embedded Systems
- Serial Communication
- FPGA-Based Digital Systems
- Hardware Communication Interfaces

## Author

**Shan Marlo K**

B.Tech Electronics and Communication Engineering  
SRM Institute of Science and Technology

GitHub: [ShanMarlo](https://github.com/ShanMarlo)
