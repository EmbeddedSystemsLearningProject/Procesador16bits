`include "ALU/ALU.v"
`include "StateMachine/StateMachine.v"
`timescale 1ps/1ps

module StateMachine_TB();

    reg [15:0] in_reg;
    reg rq_reg;

    reg clk;

    StateMachine uut (
        .clk(clk),
        .in(in_reg),
        .rq(rq_reg)
    );



    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) clk=~clk;



    initial begin
        clk = 1'b0;
        in_reg = 16'd0;
        rq_reg = 1'd0;
        
        //Usuario ingrese in
        #20;
        in_reg = 16'd34;
        rq_reg = 1'b1;

        #6 rq_reg = 1'd0;

        #20;
        in_reg = 16'd10;
        rq_reg = 1'b1;

        #10 rq_reg = 1'd0;

        #20;

        // #1 rst_n<=1'bx;clk<=1'bx;
        // #(CLK_PERIOD*3) rst_n<=1;
        // #(CLK_PERIOD*3) rst_n<=0;clk<=0;
        // repeat(5) @(posedge clk);
        // rst_n<=1;
        // @(posedge clk);
        // repeat(2) @(posedge clk);

    end


    initial begin
        $dumpfile("StateMachine_TB.vcd");
        $dumpvars(-1, uut);
        #1000 $finish;
    end


endmodule
