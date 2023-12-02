`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [4:0] ALUControl;   // control bits for ALU operation
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
	
// arithmetic operations
	
// add (ALUControl = 0)
	//case 1
   	 A <= 32'h000003E8;
   	 B <= 32'h00000112;
   	 ALUControl <= 5'b00000;
   	 #50;
   	 //case 2
   	 A <= 32'h00000009;
   	 B <= 32'h00000005;
   	 ALUControl <= 5'b00000;
   	 #50;
    
 // addi (ALUControl = 1)
  	 //case 3
  	 A <= 32'h000003E8;
  	 B <= 32'h00000112;
   	 ALUControl <= 5'b00001;
   	 #50;
   	 //case 4
   	 A <= 32'h00000009;
   	 B <= 32'h00000005;
   	 ALUControl <= 5'b00001;
   	 #50;
    
 // sub (ALUControl = 2)
   	 //case 5
  	 A <= 32'h000003E8;
  	 B <= 32'h00000112;
   	 ALUControl <= 5'b00010;
  	 #50;
 	 //case 6
   	 A <= 32'h00000009;
   	 B <= 32'h00000005;
  	 ALUControl <= 5'b00010;
  	 #50;
	
// mul (ALUControl = 3)
    // case 7
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b00011;
  	#50;
 	// case 8
   	A <= 32'h00000009;
   	B <= 32'h00000005;
  	ALUControl <= 5'b00011;
    #50;
	
	
// data operations
	
	
// lw (ALUControl = 4)
    // case 9
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b00100;
  	#50;
 	// case 10
   	A <= 32'h00000009;
   	B <= 32'h00000005;
  	ALUControl <= 5'b00100;
    #50;
    
// sw (ALUControl = 5)
    // case 11
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b00101;
  	#50;
 	// case 12
 	A <= 32'h00000009;
   	B <= 32'h00000005;
  	ALUControl <= 5'b00101;
    #50;
    
// sb (ALUControl = 6)
    // case 13
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b00110;
  	#50;
 	// case 14
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b00110;
    #50;
    
// lh (ALUControl = 7)
    // case 15
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b00111;
  	#50;
 	// case 16
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b00111;
    #50;

// lb (ALUControl = 8)
    // case 17
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b01000;
  	#50;
 	// case 18
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b01000;
    #50;

// sh (ALUControl = 9)
    // case 19
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b01001;
  	#50;
 	// case 20
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b01001;
    #50;
    
// branch operations
    
// bgez (ALUControl = 10)
    // case 21
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b01010;
  	#50;
 	// case 22
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b01010;
    #50;
    
// beq (ALUControl = 11)
    // case 23
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b01011;
  	#50;
 	// case 24
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b01011;
    #50;   
    
// bne (ALUControl = 12)
    // case 25
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b01100;
  	#50;
 	// case 26
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b01100;
    #50;  
    
// bgtz (ALUControl = 13)
    // case 27
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b01101;
  	#50;
 	// case 28
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b01101;
    #50;    
    
// blez (ALUControl = 14)
    // case 29
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b01110;
  	#50;
 	// case 30
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b01110;
    #50;      
    
// bltz (ALUControl = 15)
    // case 31
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b01111;
  	#50;
 	// case 32
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b01111;
    #50;    
    
// j (ALUControl = 16)
    // case 33
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b10000;
  	#50;
 	// case 34
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b10000;
    #50;    
    
// jr (ALUControl = 17)
    // case 35
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b10001;
  	#50;
 	// case 36
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b10001;
    #50;        
    
// jal (ALUControl = 18)
    // case 37
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b10010;
  	#50;
 	// case 38
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b10010;
    #50;        
    
// logical operations

// and (ALUControl = 19)
    // case 39
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b10011;
  	#50;
 	// case 40
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b10011;
    #50;        
    
// andi (ALUControl = 20)
    // case 41
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b10100;
  	#50;
 	// case 42
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b10100;
    #50;    
    
// or (ALUControl = 21)
    // case 43
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b10101;
  	#50;
 	// case 44
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b10101;
    #50; 

// nor (ALUControl = 22)
    // case 45
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b10110;
  	#50;
 	// case 46
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b10110;
    #50; 

// xor (ALUControl = 23)
    // case 47
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b10111;
  	#50;
 	// case 48
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b10111;
    #50; 

// ori (ALUControl = 24)
    // case 49
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b11000;
  	#50;
 	// case 50
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b11000;
    #50; 

// xori (ALUControl = 25)
    // case 51
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b11001;
  	#50;
 	// case 52
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b11001;
    #50; 

// sll (ALUControl = 26)
    // case 53
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b11010;
  	#50;
 	// case 54
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b11010;
    #50;

// srl (ALUControl = 27)
    // case 55
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b11011;
  	#50;
 	// case 56
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b11011;
    #50;

// slt (ALUControl = 28)
    // case 57
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b11100;
  	#50;
 	// case 58
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b11100;
    #50;
   
// slti (ALUControl = 29)
    // case 59
    A <= 32'h000003E8;
  	B <= 32'h00000112;
   	ALUControl <= 5'b11101;
  	#50;
 	// case 60
   	A <= 32'h00000005;
   	B <= 32'h00000009;
  	ALUControl <= 5'b11101;
    #50;   
   
	end
endmodule
