`include "ALU.v"
`timescale 1ps/1ps

module ALU_TB();

    reg [15:0] in1_reg;
    reg [15:0] in2_reg;
    reg [2:0] mode_reg;

    ALU uut(
        .in1(in1_reg),
        .in2(in2_reg),
        .mode(mode_reg)
    );

    // localparam CLK_PERIOD = 10;
    // always #(CLK_PERIOD/2) clk=~clk;

    localparam ADD    = 3'd0;
    localparam SUBST  = 3'd1;
    localparam SHIFTR = 3'd2;
    localparam SHIFTL = 3'd3;
    localparam AND    = 3'd4;
    localparam OR     = 3'd5;
    localparam NOT    = 3'd6;
    localparam XOR    = 3'd7;

    initial begin
        mode_reg = 16'd0;
        in1_reg = 16'd0;
        in2_reg = 16'd0;
        //Modo 1: Resta
        #20;
        mode_reg = SUBST;
        in1_reg = 16'd100;
        in2_reg = 16'd35;
        #20;
        mode_reg = SUBST;
        in1_reg = 16'd0;
        in2_reg = 16'd65534;

        // #1 rst_n<=1'bx;clk<=1'bx;
        // #(CLK_PERIOD*3) rst_n<=1;
        // #(CLK_PERIOD*3) rst_n<=0;clk<=0;
        // repeat(5) @(posedge clk);
        // rst_n<=1;
        // @(posedge clk);
        // repeat(2) @(posedge clk);

    end


    initial begin
        $dumpfile("ALU_TB.vcd");
        $dumpvars(-1, uut);
        #1000 $finish;
    end


endmodule
