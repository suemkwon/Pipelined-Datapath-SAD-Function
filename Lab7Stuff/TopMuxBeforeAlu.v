`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2023 01:49:30 AM
// Design Name: 
// Module Name: TopMuxBeforeAlu
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


module TopMuxBeforeAlu(out, inA, inB, inC, sel );


input [31:0] inA;
    input [31:0] inB;
    input [31:0] inC;
    input[2:0] sel;
    
    output reg [31:0] out;

    always @ (sel, inA, inB,inC) begin
        if (sel == 0)//normal operation
            out <= inA;
        else if (sel == 1)
            out <= inB;
        else if (sel == 2)
        out <= inC;
        
    end   
endmodule
