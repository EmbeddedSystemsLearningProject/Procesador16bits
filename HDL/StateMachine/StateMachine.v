module StateMachine (
    input wire clk,
    input wire reset,
    input wire [15:0] in,
    input wire rq,
    output reg [15:0] out
);

    wire [15:0] ALU_out;
    reg [15:0] ALU_in1;
    reg [15:0] ALU_in2;
    ALU alu(
        .clk(clk),
        .reset(reset),
        .in1(ALU_in1),
        .in2(ALU_in2),
        .mode(3'd0),
        .out(ALU_out)
    );

    reg [1:0] state;

    localparam IN1 = 3'd0;
    localparam IN2 = 3'd1;
    localparam PROCESSING = 3'd2;
    localparam OUT = 3'd3;

    initial begin
        out = 16'd0;
        state = IN1;
        ALU_in1 = 1'd0;
        ALU_in2 = 1'd0;
    end

    always @(posedge clk, reset ) begin
        if (reset) begin
            out <= 16'd0;
            state <= IN1;
            ALU_in1 <= 1'd0;
            ALU_in2 <= 1'd0; 
        end else begin
            case (state)
                IN1: begin
                    if(rq)begin
                        ALU_in1 <= in;
                        state <=IN2;
                    end
                end

                IN2: begin
                    if(rq)begin
                        ALU_in2 <= in;
                        state <= PROCESSING;
                    end
                end
                PROCESSING: begin
                    // espera de 1 clock
                    state <= OUT;

                end

                OUT: begin
                    out<=ALU_out;
                    state <= IN1;
                    ALU_in1 = 1'd0;
                    ALU_in2 = 1'd0;
                end

                default: begin
                    out<= 1'b0;
                    ALU_in1 = 1'd0;
                    ALU_in2 = 1'd0;
                end
           endcase 
        end
    end


endmodule