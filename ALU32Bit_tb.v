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
	
// addition (ALUControl = 0)
	//case 1
   	 A <= 32'h000003E8;
   	 B <= 32'h00000112;
   	 ALUControl <=4'b0000;
   	 #50;
   	 //case 2
   	 A <= 32'h00000009;
   	 B <= 32'h00000005;
   	 ALUControl <=4'b0000;
   	 #50;
    
 // subtraction (ALUControl = 1)
  	 //case 3
  	 A <= 32'h000003E8;
  	 B <= 32'h00000112;
   	 ALUControl <= 4'b0001;
   	 #50;
   	 //case 4
   	 A <= 32'h00000009;
   	 B <= 32'h00000005;
   	 ALUControl <= 4'b0001;
   	 #50;
    
 // multiplication (ALUControl = 2)
   	 //case 5
  	 A <= 32'h000003E8;
  	 B <= 32'h00000112;
   	 ALUControl <= 4'b0010;
  	 #50;
 	 //case 6
   	 A <= 32'h00000009;
   	 B <= 32'h00000005;
  	 ALUControl <= 4'b0010;
  	 #50;
	
// and (ALUControl = 3)
    	// case 7
    	A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 4'b0011;
  	#50;
 	// case 8
   	A <= 32'h00000009;
   	B <= 32'h00000005;
  	ALUControl <= 4'b0011;
    	#50;
	
// or (ALUControl = 4)
    	// case 9
    	A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 4'b0100;
  	#50;
 	// case 10
   	A <= 32'h00000009;
   	B <= 32'h00000005;
  	ALUControl <= 4'b0100;
    	#50;
    
// shift left logical (ALUControl = 5)
    	// case 11
    	A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 4'b0101;
  	#50;
 	// case 12
 	A <= 32'h00000009;
   	B <= 32'h00000005;
  	ALUControl <= 4'b0101;
    	#50;
    
// shift right logical (ALUControl = 6)
    	// case 13
    	A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 4'b0110;
  	#50;
 	// case 14
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 4'b0110;
    	#50;
    
// set less than (ALUControl = 7)
    	// case 15
    	A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 4'b0111;
  	#50;
 	// case 16
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 4'b0111;
    	#50;

// equal (ALUControl = 8)
    // case 17
    	A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 4'b1000;
  	#50;
 	// case 18
   	A <= 32'h00000009;
   	B <= 32'h00000009;
  	ALUControl <= 4'b1000;
    	#50;

// not equal (ALUControl = 9)
    	// case 19
    	A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 4'b1001;
  	#50;
 	// case 20
   	A <= 32'h00000009;
   	B <= 32'h00000009;
  	ALUControl <= 4'b1001;
    	#50;
    
	end
endmodule
