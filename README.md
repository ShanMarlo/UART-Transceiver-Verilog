# UART Transceiver Using Verilog HDL

## Project Overview
This project implements a Universal Asynchronous Receiver Transmitter (UART) using Verilog HDL on the Nexys A7-100T FPGA development board.

The system supports serial data transmission and reception with an 8-bit data format, one start bit, and one stop bit.

## Hardware and Software Requirements
- FPGA Board: Nexys A7-100T (Artix-7)
- HDL: Verilog
- Design Tool: Xilinx Vivado
- Communication Protocol: UART
- Baud Rate: 9600
- Data Width: 8 Bits

## Project Modules
1. UART Transmitter (uart_tx.v)
2. UART Receiver (uart_rx.v)
3. Baud Rate Generator (baud_generator.v)
4. UART Top Module (uart_top.v)
5. UART Testbench (uart_tb.v)

## Key Features
- Serial data transmission and reception.
- 8-bit data communication.
- Configurable baud rate generation.
- Start and stop bit detection.
- Transmission and reception error detection.
- FPGA-based implementation.

## Design and Verification
The project was developed and verified using Xilinx Vivado.

The following stages were completed:
- RTL Design
- Behavioral Simulation
- Synthesis
- Implementation
- Bitstream Generation
- FPGA Programming and Testing

## Simulation Results
The UART transmitter and receiver were tested through a loopback communication setup.

Successfully transmitted and received data:
- Transmitted: AA
- Received: AA
- RX Error: 0

## Applications
- Embedded Systems
- Serial Communication
- FPGA-Based Digital Systems
- Hardware Communication Interfaces

## Author
Kaileesh TT

B.Tech Electronics and Communication Engineering
SRM Institute of Science and Technology

GitHub: https://github.com/Kaileesh
