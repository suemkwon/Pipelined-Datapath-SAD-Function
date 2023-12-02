`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 
// Module - InstructionMemory_tb.v
// Description - Test the 'InstructionMemory_tb.v' module.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb(); 

    wire [31:0] Instruction; // 32-Bit wire

    reg [31:0] Address; // 32-Bit reg

    // Instantiate InstructionMemory
	InstructionMemory u0(
		.Address(Address),
        .Instruction(Instruction)
	);

	initial begin
	
	// Test Cases
    Address <= 32'h00000000; #100 
    Address <= 32'h0000000F; #100
    Address <= 32'h0000001E; #100
    Address <= 32'h00000003; #100
    Address <= 32'h00000002;
	
	end

endmodule


