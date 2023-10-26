`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/04 20:08:58
// Design Name: 
// Module Name: eyeriss_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module eyeriss_tb();
    reg clk;
    reg rst;
    reg CE;
    initial
        begin
            clk=0;
            rst=0;
            forever
            #5 clk=~clk;
        end
    reg [3*3*8-1:0]filter;
    reg [64*48*8-1:0]image;
    wire [19:0]out1,out2,out3;
    initial
        begin
            $readmemb("E:/yanjiusheng/study/fpga/eyeriss_qgl/eyeriss_qgl.srcs/sim_1/new/filter.txt",filter);
            $readmemb("E:/yanjiusheng/study/fpga/eyeriss_qgl/eyeriss_qgl.srcs/sim_1/new/image.txt",image);
        end
    initial
        begin
//            $fsdbDumpfile("wave.fsdb");
//            $fsdbDumpvars(0,eyeriss_tb);
            #10000 $finish;
        end
    wire [62*46*8-1:0] result;
    eyeriss_qgl u_eyeriss(
        .clk(clk),
        .rst(rst),
        .CE(CE),
        .image(image),
        .filter(filter),
        .out1(out1),
        .out2(out2),
        .out3(out3)
        );
    
endmodule
