`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2025 10:40:59
// Design Name: 
// Module Name: adder12bit
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


module adder12bit(
    input [7:0] in0,in1,in2,in3,in4,in5,in6,in7,bias,
    output [11:0]out_val
    );
    wire signed[11:0]sum1;
    wire signed [11:0] w0 = {{4{in0[7]}}, in0};
    wire signed [11:0] w1 = {{4{in1[7]}}, in1};
    wire signed [11:0] w2 = {{4{in2[7]}}, in2};
    wire signed [11:0] w3 = {{4{in3[7]}}, in3};
    wire signed [11:0] w4 = {{4{in4[7]}}, in4};
    wire signed [11:0] w5 = {{4{in5[7]}}, in5};
    wire signed [11:0] w6 = {{4{in6[7]}}, in6};
    wire signed [11:0] w7 = {{4{in7[7]}}, in7};
    wire signed [11:0] w8= {{4{bias[7]}},bias};
    
    assign sum1=w0+w1+w2+w3+w4+w5+w6+w7+w8;
    
   
     assign   out_val=sum1;
    
endmodule
