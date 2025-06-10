`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
// Company:  
// Engineer: 
// 
// Create Date: 02.06.2025 15:45:02
// Design Name: 
// Module Name: softmax function
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


module softmax_function(
    input [7:0] main_in,in2,in3,in4,
    output reg[7:0] out1,out2,out3,out4
    );
    reg [15:0] exp1, exp2, exp3, exp4;
    reg [15:0] sum;
    
    function[15:0]approx_exp;
        input signed[7:0]x;
        begin
        if (x <= -32) approx_exp = 1;
            else if (x <= -16) approx_exp = 4;
            else if (x <= 0)   approx_exp = 16;
            else if (x <= 16)  approx_exp = 64;
            else if (x <= 32)  approx_exp = 128;
            else               approx_exp = 255;
        end
    endfunction

    always@(*)begin
    exp1=approx_exp(main_in);
    exp2=approx_exp(in2);
    exp3=approx_exp(in3);
    exp4=approx_exp(in4);
     
    sum=exp1+exp2+exp3+exp4;
    if (sum == 0) begin
            out1 = 0;out2=0;out3=0;out4=0;
    end
    else begin
    
    out1=(exp1*256)/sum;
    out2=(exp2*256)/sum;
    out3=(exp3*256)/sum;
    out4=(exp4*256)/sum;
    end
    end
    
        
endmodule
