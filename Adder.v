`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Adder
// 
// Additional Comments:
//
// Last Updated: 10:49 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder(pc_plus4, shiftleft, out);

    input [31:0] pc_plus4, shiftleft;
    output reg [31:0] out;
    
    initial begin
        out <= 0;
    end    
    
    always @(pc_plus4 or shiftleft) begin
        out <= pc_plus4 + shiftleft;
    end    

endmodule
