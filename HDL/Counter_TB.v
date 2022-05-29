`timescale 1ps/1ps

`include "Counter.v"

module Counter_TB();

    reg  clk_reg;
    reg  [6:0] up_reg;
    reg  [6:0] down_reg;
    reg  select_reg;

    Counter uut (
        .clk(clk_reg),
        .up(up_reg),
        .down(down_reg),
        .select(select_reg)
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) clk_reg=~clk_reg;

    initial begin
        clk_reg  = 0;
        up_reg   = 7'd110;
        down_reg = 7'd20;
        select_reg = 0;
        #1000;
        select_reg = 1;
    end

    initial begin
        $dumpfile("Counter.vcd");
        $dumpvars(-1, uut);
        #10000 $finish;
    end

endmodule