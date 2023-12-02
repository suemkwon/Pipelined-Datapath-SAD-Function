`timescale 1ns / 1ps

module Mux64_32Bit(out, inA, inB, sel);

    input [31:0] inA;
    input [63:0] inB;
    input sel;
    output reg [31:0] out;
    
    initial begin   
        out <= 0;
    end    
    
    always @(inA or inB or sel) begin
        if(sel == 0)
            out = inA;
        else
            out = inB[31:0];
     end           
endmodule
