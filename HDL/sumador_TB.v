`timescale 1ps/1ps

`include "sumador.v"

module sumador_TB();

    reg [7:0] inA_reg;
    reg [7:0] inB_reg;

  


    sumador uut (
        .inA(inA_reg),
        .inB(inB_reg)
    );




    initial begin
        inA_reg = 0;
        inB_reg = 0;

        #20;
        inA_reg = 10;

        #20;
        inA_reg = 20;

    end


    initial begin
        $dumpfile("sumador.vcd");
        $dumpvars(-1, uut);
        #1000 $finish;
    end


endmodule