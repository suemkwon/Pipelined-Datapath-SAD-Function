`timescale 1ns / 1ps

module Adder(pcPlus4, shiftleft, out);

    input [31:0] pcPlus4, shiftleft;
    output reg [31:0] out;
    
    initial begin
        out <= 0;
    end    
    
    always @(pcPlus4 or shiftleft) begin
        out <= pcPlus4 + shiftleft;
    end    

endmodule
