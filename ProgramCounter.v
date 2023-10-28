`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Module Name: ProgramCounter
//
// INPUTS:-
// Address: 32-Bit address input port.
// Reset: 1-Bit input control signal.
// Clk: 1-Bit input clock signal.
//
// OUTPUTS:-
// PCResult: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design a program counter register that holds the current address of the 
// instruction memory.  This module should be updated at the positive edge of 
// the clock. The contents of a register default to unknown values or 'X' upon 
// instantiation in your module.  
// You need to enable global reset of your datapath to point 
// to the first instruction in your instruction memory (i.e., the first address 
// location, 0x00000000H).
// 
// Additional Comments:
//
// Last Updated: 10:14 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module ProgramCounter(Address, PCResult, rst, clk);

	input [31:0] Address;
	input rst, clk;
	
	output reg [31:0] PCResult;
	
	always @(posedge clk, posedge rst) begin
	   if (rst == 1) begin
	       PCResult <= 32'h00000000;
	   end
	   else
	       PCResult <= Address;
	end
	
endmodule
