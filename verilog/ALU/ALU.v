module ALU(
    input wire [15:0] in1,
    input wire [15:0] in2,
    input wire [2:0] mode,
    output reg [15:0] out,  //Latch
    output wire [15:0] flags
);

    wire zero;
    reg negative;   //Latch
    reg overflow;   //Latch

    localparam ADD    = 3'd0;
    localparam SUBST  = 3'd1;
    localparam SHIFTR = 3'd2;
    localparam SHIFTL = 3'd3;
    localparam AND    = 3'd4;
    localparam OR     = 3'd5;
    localparam NOT    = 3'd6;
    localparam XOR    = 3'd7;

    always@(*)begin
        case(mode)
            ADD:begin
                {overflow,out} = (in1 + in2);
                out = in1 + in2;
            end
            SUBST:begin
                {overflow,out} = (in1 + ~in2 + 1'b1);
                out = in1 + in2;
            end
            SHIFTR:begin out = in1 >> in2; end
            SHIFTL:begin out = in1 << in2; end
            AND:begin out = in1 && in2; end
            OR:begin out = in1 || in2; end
            NOT:begin out = ~in1; end
            XOR:begin out = in1 ^^ in2; end
            default: begin
                out = 16'd0;
                negative = 1'b0;
                overflow = 1'b0;+
            end
        endcase
    end

    assign zero = (out == 16'd0) ? 16'd1 : 16'd0;

endmodule