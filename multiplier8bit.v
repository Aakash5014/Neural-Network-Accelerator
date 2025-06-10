`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2025 15:45:02
// Design Name: 
// Module Name: multiplier8bit
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


module multiplier8bit(
    input [7:0] a,b,
    output [7:0] pro
    );
    wire signed [11:0]a_ext,b_ext;
    wire signed [23:0]pro_ext;
    wire signed [15:0]q68;
    wire signed [11:0]q34;
    
    assign a_ext = {{4{a[7]}}, a}; 
    assign b_ext = {{4{b[7]}}, b};
    
    assign pro_ext = a_ext * b_ext;
    
    assign q68 = pro_ext[19:4];
    
    assign q34=q68>>>4;
    assign pro=(34>127)?8'b01111111:(q34<-128)?8'b10000000:pro_ext[11:4];
endmodule
