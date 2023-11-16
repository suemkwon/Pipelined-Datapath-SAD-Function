`timescale 1ns / 1ps


module BottomMuxBeforeALU(out, inA, inB, inC, sel);
    
    input [31:0] inA;
    input [31:0] inB;
    input [31:0] inC;
    input [2:0] sel;
    
    output reg [31:0] out;

    always @ (sel, inA, inB, inC) begin
        if (sel == 0)
            out <= inA;
            
        else if(sel == 1)
            out <= inB;
            
            else if(sel == 2)
            out <= inC;
    end   
           
endmodule

