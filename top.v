`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2025 15:45:02
// Design Name: 
// Module Name: top
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


module neural_network(
input [7:0]x1,x2,x3,x4,x5,x6,x7,x8,
output [7:0]out1,out2,out3,out4,
output [11:0]out_con
    );
    wire [7:0]w1[1:8];wire [7:0]w2[1:8];wire [7:0]w[1:8];wire [7:0]w3[1:8];wire [7:0]w4[1:8];wire [7:0]w5[1:8];wire [7:0]w6[1:8];wire [7:0]w7[1:8];wire [7:0]w8[1:8];
    wire[7:0]h[1:8]; 
    wire [7:0]bias[1:8];
    wire [7:0]bias1[1:8];
    wire [7:0]biasc;
    wire[7:0]wc[1:8];
    wire [7:0]o[1:4];
    wire [7:0]w11[1:4];wire[7:0]w12[1:4];wire[7:0]w13[1:4];wire[7:0]w14[1:4];wire[7:0]w15[1:4];wire[7:0]w16[1:4];wire[7:0]w17[1:4];wire[7:0]w18[1:4];
    //hidden layer weights
    assign w1[1]=8'b00000000;assign w2[1]=8'b00000011;assign w3[1]=8'b11101110;assign w4[1]=8'b00010011;assign w5[1]=8'b11110101;assign w6[1]=8'b11111110;assign w7[1]=8'b00011010;assign w8[1]=8'b00100101;
    assign w1[2]=8'b00000101;assign w2[2]=8'b00001011;assign w3[2]=8'b00001110;assign w4[2]=8'b11101101;assign w5[2]=8'b11101101;assign w6[2]=8'b11100011;assign w7[2]=8'b00011010;assign w8[2]=8'b00100011;
    assign w1[3]=8'b11110110;assign w2[3]=8'b00011101;assign w3[3]=8'b00100000;assign w4[3]=8'b11111101;assign w5[3]=8'b00010101;assign w6[3]=8'b00000000;assign w7[3]=8'b11100010;assign w8[3]=8'b11101000;
    assign w1[4]=8'b00000010;assign w2[4]=8'b00001101;assign w3[4]=8'b00000110;assign w4[4]=8'b00000101;assign w5[4]=8'b00100000;assign w6[4]=8'b00010011;assign w7[4]=8'b11111011;assign w8[4]=8'b11101110;
    assign w1[5]=8'b11111110;assign w2[5]=8'b11011011;assign w3[5]=8'b11100000;assign w4[5]=8'b00110000;assign w5[5]=8'b00101010;assign w6[5]=8'b00101101;assign w7[5]=8'b00010110;assign w8[5]=8'b00011110;
    assign w1[6]=8'b11110110;assign w2[6]=8'b11010110;assign w3[6]=8'b11110011;assign w4[6]=8'b11101000;assign w5[6]=8'b11010011;assign w6[6]=8'b00000010;assign w7[6]=8'b00101110;assign w8[6]=8'b00111010;
    assign w1[7]=8'b00000000;assign w2[7]=8'b00001011;assign w3[7]=8'b11111110;assign w4[7]=8'b00001010;assign w5[7]=8'b00011110;assign w6[7]=8'b00100000;assign w7[7]=8'b11101011;assign w8[7]=8'b11101110;
    assign w1[8]=8'b11111101;assign w2[8]=8'b00010101;assign w3[8]=8'b00101010;assign w4[8]=8'b00010101;assign w5[8]=8'b00110101;assign w6[8]=8'b11110010;assign w7[8]=8'b11101101;assign w8[8]=8'b11010010;
    assign bias[1]=8'b00000000;assign bias[2]=8'b00011000;assign bias[3]=8'b00011000;assign bias[4]=8'b11111010;assign bias[5]=8'b00000000;assign bias[6]=8'b11101011;assign bias[7]=8'b11111110;assign bias[8]=8'b11111101;
    
    //outputlayer weights
    assign w11[1]=8'b11111110;assign w12[1]=8'b11000110;assign w13[1]=8'b11010110;assign w14[1]=8'b00101011;assign w15[1]=8'b00100011;assign w16[1]=8'b00110010;assign w17[1]=8'b00000101;assign w18[1]=8'b11111110;
    assign w11[2]=8'b11110101;assign w12[2]=8'b11000110;assign w13[2]=8'b11101011;assign w14[2]=8'b11011101;assign w15[2]=8'b11011101;assign w16[2]=8'b11110000;assign w17[2]=8'b00100101;assign w18[2]=8'b00101010;
    assign w11[3]=8'b00001000;assign w12[3]=8'b00101000;assign w13[3]=8'b00011101;assign w14[3]=8'b00000000;assign w15[3]=8'b00000011;assign w16[3]=8'b10110000;assign w17[3]=8'b00001010;assign w18[3]=8'b00000000;
    assign w11[4]=8'b11111000;assign w12[4]=8'b01000000;assign w13[4]=8'b00100101;assign w14[4]=8'b11111101;assign w15[4]=8'b00100010;assign w16[4]=8'b00000000;assign w17[4]=8'b11001101;assign w18[4]=8'b11001100;
   assign bias1[1]=8'b11110010;assign bias1[2]=8'b11111000;assign bias1[3]=8'b00001110;assign bias1[4]=8'b00000101;
   
   //to concentrated neuron
    assign wc[1]=8'b11111110;assign wc[2]=8'b11000110;assign wc[3]=8'b11010110;assign wc[4]=8'b00101011;assign wc[5]=8'b00100011;assign wc[6]=8'b00110010;assign wc[7]=8'b00000101;assign wc[8]=8'b11111110;
    assign biasc=8'b11110010;
    //hidden layer
    //integer i;
    //initial begin
   // for(i=1;i<9;i=i+1) begin:
    // neuron (x1,x2,x3,x4,x5,x6,x7,x8,w[i][1],w[i][2],w[i][3],w[i][4],w[i][5],w[i][6],w[i][7],w[i][8],bias[i],h[i]);
 //       end
 //  end
   
     genvar i;
    generate
        for (i = 1; i < 9; i = i + 1) begin : gen_neurons
            neuron u_neuron (
               x1,x2,x3,x4,x5,x6,x7,x8,w1[i],w2[i],w3[i],w4[i],w5[i],w6[i],w7[i],w8[i],bias[i],h[i]
            );
        end
    endgenerate
    
    //output layer
    genvar j;
    generate
        for (j = 1; j < 5; j = j + 1) begin : gen_neuron
            outlayer_neuron h_neuron (
               h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8],w11[j],w12[j],w13[j],w14[j],w15[j],w16[j],w17[j],w18[j],bias1[j],o[j]
            );
        end 
    endgenerate
    
    concentrated_neuron k2(h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8],wc[1],wc[2],wc[3],wc[4],wc[5],wc[6],wc[7],wc[8],biasc,out_con);
    //sending outlayer neurons into soft max
    softmax_function s1(o[1],o[2],o[3],o[4],out1,out2,out3,out4);
    
    //concentrated neuron
// reg[1:0]select_line;
// always@(*)
// begin
// if(out1>out2 && out1>out3 &&out1>out4)
//   select_line=2'd0;
// else if(out1<out2 && out2>out3 &&out4<out2)
//    select_line=2'd1;
// else if( out1<out3 && out2<out3 &&out4<out3)
//   select_line=2'd2;
// else
//     select_line=2'd3;    
//  end
//  
// always@(*)
// begin
// case(select_line)
// 2'd0:begin 
// wa=w11[1];wb=w12[1];wc=w13[1];wd=w14[1];we=w15[1];wf=w16[1];wg=w17[1];wh=w18[1];
//  end                              
// 2'd1:begin                               
// wa=w11[2];wb=w12[2];wc=w13[2];wd=w14[2];we=w15[2];wf=w16[2];wg=w17[2];wh=w18[2];
//          end                      
// 2'd2:begin                             
// wa=w11[3];wb=w12[3];wc=w13[3];wd=w14[3];we=w15[3];wf=w16[3];wg=w17[3];wh=w18[3];
//       end                         
// 2'd3:begin                           
// wa=w11[4];wb=w12[4];wc=w13[4];wd=w14[4];we=w15[4];wf=w16[4];wg=w17[4];wh=w18[4];
// end
// endcase
// end
 
 //concentrated_neuron k1(h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8],wa,wb,wc,wd,we,wf,wg,wh,8'd0,out_con);
//lu_function k1(o[1],out1);
//lu_function k2(o[2],out2);
//lu_function k3(o[3],out3);
//lu_function k4(o[4],out4);

//concentrated_neuron z1(h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8],wa,wb,wc,wd,we,wf,wg,wh,8'd0,out_con);
endmodule
