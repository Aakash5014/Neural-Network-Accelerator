`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2025 15:45:02
// Design Name: 
// Module Name: relu function
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


module relu_function(
    input [7:0] in_var,
    output [7:0] out_var
    );
    assign out_var=(in_var[7]==1)?8'd0:in_var;
endmodule
