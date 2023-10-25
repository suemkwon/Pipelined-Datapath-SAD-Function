`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 05:35:26 AM
// Design Name: 
// Module Name: ShiftLeft_tb
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


module ShiftLeft_tb();

    reg [31:0] in;
    wire [31:0] out;
    
    ShiftLeft SL(
        .in(in), 
        .out(out)
    );
    
    initial begin
    
    // case 1
    in <= 1;
    #50;
    
    // case 2
    in <= 8;
    #50;
    
    // case 3  
    in <= 54;
    #50;
        
    end
    
endmodule
