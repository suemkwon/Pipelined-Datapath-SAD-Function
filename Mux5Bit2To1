`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Module Name: Mux5Bit2To1
// 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux5Bit2To1(out, inA, inB, sel);

    output reg [4:0] out;
    
    input [4:0] inA;
    input [4:0] inB;
    input sel;

    always @(inA or inB or sel) begin
        if(sel == 0) begin
            out = inA;
        end
        else if(sel == 1) begin
            out = inB;
        end
    end    
endmodule
