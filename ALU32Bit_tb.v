`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [3:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );

	initial begin
	
// addition
	//case 1
   	 A <= 32'h000003E8;
   	 B <= 32'h00000112;
   	 ALUControl <=4'b0000;
   	 #50;
   	 //case 2
   	 A <= 32'hffff0000;
   	 B <= 32'h1000000f;
   	 ALUControl <=4'b0000;
   	 #50;
    
 // subtraction
  	 //case 5
  	 A <= 32'h000003E8;
  	 B <= 32'h00000112;
   	 ALUControl <= 4'b0001;
   	 #50;
   	 //case 6
   	 A <= 32'h00000112;
	 B <= 32'h000003E8;
   	 ALUControl <= 4'b0001;
   	 #50;
    
 // multiplication
   	 //case 10
   	 A <= 32'h000003E8;
   	 B <= 32'h00000112;
   	 ALUControl <= 4'b0010;
  	 #50;
 	 //case 11
  	 A <= 32'hFFFF0000;
   	 B <= 32'h0000000F;
  	 ALUControl <= 4'b0010;
  	 #50;
	
	end

endmodule

