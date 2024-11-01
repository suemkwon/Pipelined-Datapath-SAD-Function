`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Module Name: PCAdder
//
// INPUTS:-
// PCResult: 32-Bit input port.
// 
// OUTPUTS:-
// PCAddResult: 32-Bit output port.
//
// FUNCTIONALITY:-
// Design an incrementor (or a hard-wired ADD ALU whose first input is from the 
// PC, and whose second input is a hard-wired 4) that computes the current 
// PC + 4. The result should always be an increment of the signal 'PCResult' by 
// 4 (i.e., PCAddResult = PCResult + 4).
// 
// Additional Comments:
//
// Last Updated: 10:12 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module PCAdder(PCResult, PCAddResult, clk, rst);

    input [31:0] PCResult;
    input clk, rst;
    
    output reg [31:0] PCAddResult;

    initial begin
        PCAddResult <= 0;
         $display("This is a test");
    end    

    always @(PCResult) begin
    	PCAddResult <= PCResult + 32'h000000004;
    end       
    
endmodule
