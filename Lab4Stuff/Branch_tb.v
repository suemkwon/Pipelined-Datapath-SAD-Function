`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 05:35:26 AM
// Design Name: 
// Module Name: Branch_tb
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


module Branch_tb();

    reg branch, zero;
    wire PCSrc;
    
    Branch Bra(
        .branch(branch),
        .zero(zero), 
        .PCSrc(PCSrc)
    );
    
    initial begin
    
        // case 1
        branch <= 1;
        zero <= 0;
        #50;
    
        // case 2
        branch <= 0;
        zero <= 1;
        #50;
       
        // case 3
        branch <= 1;
        zero <= 1;
        #50;
    end 
endmodule

