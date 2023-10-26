module conv1_3(
    input CLK,
    input RST,
    input CE,
    input [23:0] IN1,
    input [23:0] IN2,
    output reg[17:0] Out,
    output reg[23:0] out_you,
    output reg[23:0] out_youshang
);
//reg [17:0] Out;
//reg [23:0] out_you;
//reg [23:0] out_youshang;
always @(posedge CLK) begin
    if(RST) begin
        Out<=0;
        out_you<=0;
        out_youshang<=0;
    end
    else begin
    Out<=IN1[23:16]*IN2[23:16]+IN1[15:8]*IN2[15:8]+IN1[7:0]*IN2[7:0];
    out_you<=IN1;
    out_youshang<=IN2;
    end
end
endmodule
