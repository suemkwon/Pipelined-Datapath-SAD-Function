`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ProgramCounter_tb.v
// Description - Test the 'ProgramCounter.v' module.
////////////////////////////////////////////////////////////////////////////////

module ProgramCounter_tb(); 

    // 32-Bit reg
	reg [31:0] Address; 
	// 1-Bit reg
	reg Reset, Clk; 
	
    // 32-Bit wire
	wire [31:0] PCResult; 

    // Instantiate ProgramCounter
    ProgramCounter u0(
        .Address(Address), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(Clk)
    );

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
	// Test Cases
    Address <= 32'h00000001;
    Reset <= 1'b0;
    
    Address <= 32'h00000005;
    Reset <= 1'b0;
    
    Address <= 32'h0000000f;
    Reset <= 1'b0;
	
	end

endmodule

