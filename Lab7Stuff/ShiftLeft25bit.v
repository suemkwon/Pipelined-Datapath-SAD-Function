`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Module Name: ShiftLeft
// 
// Additional Comments:
//
// Last Updated: 10:47 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module ShiftLeft25bit(in, out);

    input [25:0] in;
    output reg [27:0] out;
    
    initial begin
        out <= 0;
    end
    
    always @(*) begin
        out <= in << 2;
     end
        
endmodule
