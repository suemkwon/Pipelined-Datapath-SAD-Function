`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Lab D2L group 38, bench 28 
//Team Members: Christopher Hughes, Sarah Wiltbank
//Percent Effort: Christopher 50/50 Sarah
//
// ECE369A - Computer Architecture
// Laboratory 1
// Module - pc_register.v
// Description - 32-Bit program counter (PC) register.
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
// instantiation in your module. Hence, please add a synchronous 'Reset' 
// signal to your PC register to enable global reset of your datapath to point 
// to the first instruction in your instruction memory (i.e., the first address 
// location, 0x00000000H).
////////////////////////////////////////////////////////////////////////////////

module ProgramCounter(PCWrite, Address, PCResult, Reset, Clk);

	input [31:0] Address;
	input Reset, Clk, PCWrite;

	output reg [31:0] PCResult;

   reg counter;
   
   initial begin
   counter <= 0;
   end

    always @(posedge Clk) begin
        
        if(Reset)begin
          PCResult <= 0;
          counter <= 0;
          end
        else if(PCWrite == 0 && counter == 0 ) begin
          PCResult <= Address - 8;
          counter <= 1;
        end
        else if (PCWrite == 0) begin
          PCResult <= Address - 4;
        end
        else begin
          PCResult <= Address;
          counter <= 0;
          end
    end

endmodule
