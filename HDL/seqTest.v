module seqTest(
    input  wire       clk,
    input  wire       rst,
    input  wire [7:0] inA,
    output reg  [7:0] out
);
    initial begin
        out = 8'd0;
    end
    always@(posedge clk, rst)begin
        if(rst)begin
            out <= 8'd0;
        end else begin
            out <= inA << 5;
        end
    end
    
endmodule