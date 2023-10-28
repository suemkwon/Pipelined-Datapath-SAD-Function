`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Module Name: Mux5Bit2To1
// 
// Additional Comments:
//
// Last Updated: 10:35 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux5Bit2To1(out, inA, inB, sel);
    
    input [4:0] inA, inB;
    input sel;
    
    output reg [4:0] out;

    always @(inA or inB or sel) begin
        if(sel == 0) begin
            out = inA;
        end
        else if(sel == 1) begin
            out = inB;
        end
    end   
     
endmodule
