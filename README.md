# 🚦 Traffic Light Controller (Verilog FSM)

This project implements a **Traffic Light Controller** using a Finite State Machine (FSM) in Verilog HDL.

##  Features
1. FSM-based traffic control  
2. Highway priority logic  
3. Counter-based timing control  
4. Simulation verified using EPWave  

##  State Sequence

| State | Highway | Farm Road |
|------|--------|----------|
| S0 | Green | Red |
| S1 | Yellow | Red |
| S2 | Red | Green |
| S3 | Red | Yellow |

## ⏱Timing
- Green duration → 5 clock cycles  
- Yellow duration → 2 clock cycles  

## 🛠 Tools Used
- Verilog HDL
- Icarus Verilog
- EPWave / GTKWave

## ▶️ Simulation

```bash
iverilog rtl/traffic_light_controller.v tb/testbench.sv
vvp a.out
