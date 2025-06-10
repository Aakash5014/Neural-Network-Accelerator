**Neural Network-based Gas Classification with Concentration Display on Nexys artix 7 FPGA.**

OBJECTIVE:
            Design a neural network that classifies gases based on sensor data (e.g., from MQ-series sensors), identifies the gas with the highest probability of presence, and displays its concentration using a seven-segment display. The complete implementation should be synthesized and deployed on an FPGA using Verilog and Vivado.

SYSTEM OVERVIEW:
Inputs:

Analog signals from gas sensors (Electro chemical gas detector MQ-2).

ADC-converted 8-bit digital values representing concentration levels.

Neural Network (NN):

1 hidden layer (for hardware simplicit).

Input layer: 8 nodes (one per sensor).

Hidden layer: 8 nodes.

Output layer: 4 classes (e.g., CO, CH₄, NH₃, etc.)

Outputs:

Classification result (max softmax output index).

Corresponding gas concentration displayed on a 7-segment display.

FPGA IMPLEMENTATION STRATEGY:
Steps:

1)Pre-train the NN model offline (e.g., in Python).

2)Quantize the weights and biases to fixed-point format (e.g., Q3.4).

3)Hardcode the weights in Verilog as constants (ROM style).

4)Implement the NN as a pipelined combinational logic block.

5)Apply softmax approximation.

6)Identify the gas with the maximum output value.

7)Map the corresponding sensor value to display (gas concentration).
