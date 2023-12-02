`timescale 1ns / 1ps

module TopLevel_tb();

    reg clk, rst;
    wire [31:0] finalData, lowRegister, highRegister, ProgramCounter;

    TopLevel ece369lol( 
              .clk(clk),
              .rst(rst),
              .finalData(finalData),
              .lowRegister(lowRegister),
              .highRegister(highRegister),
              .ProgramCounter(ProgramCounter)
    );
           
    initial begin
        clk <= 1'b0;
        forever #10 clk = ~clk;
    end     
    
    initial begin
        rst <= 1;
        #20; 
        rst <= 0;
        end                                     
endmodule
