module fpga_file(
    output reg led1, led2, led3, led4,
    input clk,
    output [6:0] seg,
    output [3:0] an
);
    wire [11:0] out_con;
    reg [7:0] x1 = 8'd10;
    reg [7:0] x2 = 8'd20;
    reg [7:0] x3 = 8'd15;
    reg [7:0] x4 = 8'd25;
    reg [7:0] x5 = 8'd30;
    reg [7:0] x6 = 8'd12;
    reg [7:0] x7 = 8'd22;
    reg [7:0] x8 = 8'd17;

   // wire [11:0] out_con;
    wire [7:0] out1, out2, out3, out4;

    // Neural network module instantiation
    neural_network x (
        .x1(x1), .x2(x2), .x3(x3), .x4(x4),
        .x5(x5), .x6(x6), .x7(x7), .x8(x8),
        .out1(out1), .out2(out2), .out3(out3), .out4(out4),
        .out_con(out_con)
    );
    
    // Assign the output
    assign out_con = out_con;
    // LED logic
    always @(*) begin
        if (out1 > out2 && out1 > out3 && out1 > out4)
            {led4, led3, led2, led1} = 4'b0001;
        else if (out2 > out1 && out2 > out3 && out2 > out4)
            {led4, led3, led2, led1} = 4'b0010;
        else if (out3 > out1 && out3 > out2 && out3 > out4)
            {led4, led3, led2, led1} = 4'b0100;
        else
            {led4, led3, led2, led1} = 4'b1000;
    end

    // 7-segment display instantiation
    seven_segment_display d (
        .clk(clk),
        .out_con(out_con),
        .seg(seg),
        .an(an)
    );

endmodule
