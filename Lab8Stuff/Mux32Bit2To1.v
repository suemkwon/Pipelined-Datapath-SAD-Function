`timescale 1ns / 1ps

module Mux32Bit2To1(out, inA, inB, sel);

    input [31:0] inA, inB;
    input sel;
    output reg [31:0] out;
    
    always @(inA or inB or sel) begin
        if(sel == 0) begin
            out = inA;
        end
        else if(sel == 1) begin
            out = inB;
        end
    end            
endmodule