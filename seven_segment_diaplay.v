`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 11:56:49
// Design Name: 
// Module Name: seven_segment_diaplay
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


module seven_segment_display(
    input clk,
    input [11:0] out_con,        // 12-bit neural output
    output [6:0] seg,            // a-g segments
    output [3:0] an              // Digit enable
    );
    wire [3:0] bcd3, bcd2, bcd1, bcd0;
    // Convert binary to 4 BCD digits
    binary_to_bcd bcd_converter (
        .binary(out_con),
        .thousands(bcd3),
        .hundreds(bcd2),
        .tens(bcd1),
        .ones(bcd0)
    );
    // Display logic
    seven_segment_controller display (
        .clk(clk),
        .digit3(bcd3),
        .digit2(bcd2),
        .digit1(bcd1),
        .digit0(bcd0),
        .seg(seg),
        .an(an)
    );
    
endmodule
