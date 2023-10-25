`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 05:05:51 AM
// Design Name: 
// Module Name: Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder(addIn, shiftIn, control, A, JAddress, out);
    input [31:0] addIn, shiftIn, A, JAddress;
    input [1:0] control;
    output reg [31:0]out;
    
    initial begin
        out <= 0;
    end
        
        
    always @(*) begin
     if(control == 0) begin
        out <= $signed(addIn) + $signed(shiftIn);
    end
     else if(control == 1) begin
       out <= A;
     end
     else if(control == 2) begin
       out <= JAddress;
     end
    end
    
endmodule
