`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2023 03:19:03 PM
// Design Name: 
// Module Name: TopLevel_tb
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


module TopLevel_tb();

    reg clk;
    reg rst;
    wire [31:0] finalData;
    wire [31:0] ProgramCounter;
 
    
    TopLevel tl( 
              .clk(clk),
              .rst(rst),
              .finalData(finalData),
              .ProgramCounter(ProgramCounter)
              );
         
    initial begin
        clk <= 1'b0;
        forever #50 clk = ~clk;
    end     
    
    initial begin
        rst <= 1;
        #20; 
        rst <= 0;
    end                                       
endmodule
endmodule
