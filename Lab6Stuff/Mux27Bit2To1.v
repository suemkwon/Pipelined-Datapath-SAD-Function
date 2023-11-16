`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Mux32Bit2To1
//
// Description - Performs signal multiplexing between 2 32-Bit words.
// 
// Additional Comments:
//
// Last Updated: 10:37 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux27Bit2To1(out, inA, inB, sel, pcplus4, jumpReturn);
    
    input [27:0] inA;
    input [31:0] inB;//normal operations
    input [31:0] jumpReturn;//rs for jr
    input [31:0] pcplus4;
    input [2:0]sel;
    wire [31:0] inA2;
    output reg [31:0] out;

    assign inA2 = {{pcplus4[31:28]}, {inA[27:0]}};//concatenate pcplus4 with jump code
    always @ (sel, inA, inB, pcplus4) begin
        if (sel == 1)//j and jal
            out = inA2;
        
        else if (sel == 2)//jr
            out = jumpReturn;
       
        //else if (sel == 3)//jal
          //  out <= inA;
        
        else
            out = inB;
    end   
           
endmodule
