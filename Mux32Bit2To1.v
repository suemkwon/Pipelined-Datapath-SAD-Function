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


module Mux32Bit2To1(out, inA, inB, sel);
    
    input [31:0] inA, inB;
    input sel;
    
    output reg [31:0] out;

    always @ (sel, inA, inB) begin
        if (sel)
            out <= inA;
        else
            out <= inB;
    end   
           
endmodule
