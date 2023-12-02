`timescale 1ns / 1ps

module PCAdder(PCResult, PCAddResult, clk, rst);

    input [31:0]  PCResult;
    input clk, rst;
    output reg [31:0] PCAddResult;

    initial begin
        PCAddResult <= 0;
    end    

    always @(PCResult) begin //always @(posedge clk)
    	PCAddResult <= PCResult + 4;
    end       
    
endmodule
