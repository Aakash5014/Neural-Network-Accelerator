`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2025 11:59:17
// Design Name: 
// Module Name: 7_segment_controller
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


module seven_segment_controller(
    input clk,
    input [3:0] digit3, digit2, digit1, digit0,
    output reg [6:0] seg,
    output reg [3:0] an
    );
     reg [1:0] sel = 0;
    reg [3:0] current_digit;

    // Simple clock divider (~1kHz for multiplexing)
    reg [15:0] clkdiv = 0;
    always @(posedge clk)
        clkdiv <= clkdiv + 1;

    always @(posedge clkdiv[15]) begin
        sel <= sel + 1;
        case (sel)
            2'd0: begin current_digit = digit0; an = 4'b1110; end
            2'd1: begin current_digit = digit1; an = 4'b1101; end
            2'd2: begin current_digit = digit2; an = 4'b1011; end
            2'd3: begin current_digit = digit3; an = 4'b0111; end
        endcase

        case (current_digit)
            4'd0: seg = 7'b1000000;
            4'd1: seg = 7'b1111001;
            4'd2: seg = 7'b0100100;
            4'd3: seg = 7'b0110000;
            4'd4: seg = 7'b0011001;
            4'd5: seg = 7'b0010010;
            4'd6: seg = 7'b0000010;
            4'd7: seg = 7'b1111000;
            4'd8: seg = 7'b0000000;
            4'd9: seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end
endmodule
