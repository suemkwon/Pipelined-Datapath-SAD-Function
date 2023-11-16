`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: TopLevel_tb
// 
// Additional Comments:
//
// Last Updated: 11:00 AM 10/28/23
// 
//////////////////////////////////////////////////////////////////////////////////


module TopLevel_tb();

    wire [31:0] WriteData, ProgramCounter;
    reg clk; 
    reg rst;
    
    TopLevel tl( 
              .WriteData(WriteData),
              .ProgramCounter(ProgramCounter),
              .clk(clk),
              .rst(rst)
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
