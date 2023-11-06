`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Hazard
// 
// Additional Comments:
//
// Last Updated: 11/6/2023
// 
//////////////////////////////////////////////////////////////////////////////////

module Hazard(clk, instruction, memReadEX, memReadMEM, PCWrite, RegRtEX, RegRdMEM, WriteIFID, controlMux);
    input [31:0] instruction;
    input [4:0] RegRtEX, RegRdMEM;
    input [1:0] memReadEX, memReadMEM;
    input clk;
    
    output reg PCWrite, WriteIFID, controlMux;
 
  always @ (negedge clk) begin
    if(memReadEX > 0 && (RegRtEX == instruction[25:21] || RegRtEX == instruction[20:16])) begin
            PCWrite <= 0;
            WriteIFID <= 0;
            controlMux <= 0;
        end
    else if(memReadMEM > 0 && (RegRdMEM == instruction[25:21] || RegRdMEM == instruction[20:16])) begin
              PCWrite <= 0;
              WriteIFID <= 0;
              controlMux <= 0;
         end
         else begin
             PCWrite <= 1;
             WriteIFID <= 1;
             controlMux <= 1;
         end     
      
    end
endmodule
