module Counter(
    input  wire       clk,
    input  wire       rst,
    input  wire [6:0] up,    
    input  wire [6:0] down,
    input  wire       select,  
    output reg  [6:0] count
);



    initial begin
        count = 7'd0;
    end

    always@(posedge clk, rst)begin
        if(rst)begin
            count <= 7'd0;
        end else begin
            if(select == 0)  begin  
                if(count == up || count == 7'd0)begin
                    count <= down;
                end else begin  
                    count <= count + 1;
                end
            end else begin
                if(count == down || count == 7'd0)begin
                    count <= up;
                end else begin
                    count <= count - 1;
                end
            end
        end
    end

endmodule