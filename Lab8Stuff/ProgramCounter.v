`timescale 1ns / 1ps

module ProgramCounter(Address, PCResult, rst, clk);

	input [31:0] Address;
	input rst, clk;
	output reg [31:0] PCResult;
	
	always @(posedge clk) begin
	   if (rst == 1) begin
	       PCResult <= 0;
	   end
	   else
	       PCResult <= Address;
	end
	
endmodule
