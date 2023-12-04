`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: SignExtend
// 
// Additional Comments:
//
// Last Updated: 10:23 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module SignExtend(in, out);

    input [4:0] in;
    
    output reg [31:0] out;
    
    always @(in) begin
        out = in;
    end
    
endmodule
