`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 04:15:24 AM
// Design Name: 
// Module Name: ID-EX
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


module IFID(Clk, Rst, PCSrc, IFIDWrite, addIn, addOut, IMin, IMout);

    input Clk, Rst, IFIDWrite, PCSrc;
    input [31:0] addIn, IMin;
    
    output reg [31:0] addOut, IMout;
    
    always @ (posedge Clk) begin
    
      addOut = 0;
      IMout = 0;
      
        if((IFIDWrite == 1) && (PCSrc == 0)) begin
          addOut <= addIn;
          IMout <= IMin;
        end
    end
endmodule
