`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2025 15:45:02
// Design Name: 
// Module Name: neuron
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//hidden layer neuron
module neuron(
input [7:0]x1,x2,x3,x4,x5,x6,x7,x8,w1,w2,w3,w4,w5,w6,w7,w8,bias,
output [7:0]out_val
    );
     wire signed [7:0]p1,p2,p3,p4,p5,p6,p7,p8;
    wire signed[7:0]s1,pre_final;
    
    multiplier8bit m1(x1,w1,p1);
    multiplier8bit m2(x2,w2,p2);
    multiplier8bit m3(x3,w3,p3);
    multiplier8bit m4(x4,w4,p4);
    multiplier8bit m5(x5,w5,p5);
    multiplier8bit m6(x6,w6,p6);
    multiplier8bit m7(x7,w7,p7);
    multiplier8bit m8(x8,w8,p8);
    
    adder8bit a1(p1,p2,p3,p4,p5,p6,p7,p8,bias,pre_final);
    
    relu_function r1(pre_final,out_val);
endmodule
