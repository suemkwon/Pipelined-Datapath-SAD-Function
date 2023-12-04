`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Mux32Bit2To1
//
// Description - Performs signal multiplexing between 2 32-Bit words.
// 
// Additional Comments:
//
// Last Updated: 10:37 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module mux32Bit3To1(out, inA, inB, inC, sel);
    
    input [31:0] inA;
    input [31:0] inB;
    input [31:0] inC;

    input[2:0] sel;
    
    output reg [31:0] out;

    always @ (sel, inA, inB,inC) begin
        if (sel == 1)
            out <= inA;
            
        else if (sel == 0)
            out <= inB;
            
        else 
        out <= inC;
        
        
        
    end   
           
endmodule
