# Digital Systems Design & VHDL Laboratories

##  Overview
This repository contains a structured collection of digital circuit designs, custom component libraries, and exam implementations in **VHDL** developed during my coursework at the **Universidade de Aveiro**. 

The projects cover foundational digital logic concepts, transitioning from basic combinational blocks to complex synchronous sequential systems designed for FPGA deployment.

##  Repository Structure
To maintain a professional layout, all synthesis tool-generated binaries and temporary compiler logs (such as Quartus `db` or `simulation` folders) have been omitted. Only pure `.vhd` source files and testbenches are archived:

* **`/Componentes`**: A custom-built hardware library containing reusable core blocks (multiplexers, registers, gates). Designed defensively during the semester to speed up implementation and keep components handy for laboratory sessions.
* **`/work01` to `/work10`**: Chronological laboratory modules mapping my weekly progress through combinational logic, arithmetic structures, counters, and advanced verification.
* **`/Projeto1`**: Mid-term practical exam script developed to validate structural design skills.
* **`/Projeto2`**: Final practical exam featuring a fully functional Finite State Machine (FSM) designed, synthesized.

## 🛠️ Concepts & Digital Structures Implemented
* **Combinational Logic:** Parametric Arithmetic Units (generic $n$-bit adders), encoders, decoders, and data selectors.
* **Sequential Logic:** Registers, synchronous counters, and advanced **Finite State Machines (FSMs)** for control paths.
* **Structural VHDL:** Hierarchical modular design, component instantiation, and structural port mapping.
* **Hardware Verification:** Developing custom Testbenches to simulate and stress-test digital behavior.
