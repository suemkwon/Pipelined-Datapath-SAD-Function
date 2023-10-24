`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input [3:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input [31:0] A, B;	    // inputs

	output reg [31:0] ALUResult;	// answer
	output reg Zero;	    // Zero = 1 if ALUResult == 0

	always @ (ALUControl, A, B) begin

		Zero = 0;

		case (ALUControl)
		
		// arithmetic operations
		
			// addition, lw, sw (ALUControl = 0)
			4'b0000: begin
				ALUResult = (A + B);
				if (ALUResult == 0)
					Zero = 1;
			end

			// subtraction, beq, bne (ALUControl = 1)
			4'b0001: begin
				ALUResult = (A - B);
				if (ALUResult == 0)
					Zero = 1;
			end

			// multiplication (ALUControl = 2)
			4'b0010: begin
				ALUResult = (A * B);
				if (ALUResult == 0)
					Zero = 1;
			end

        	// logical operations
        
			// and (ALUControl = 3)
			4'b0011: begin
				ALUResult = (A & B);
				if (ALUResult == 0)
					Zero = 1;
			end

			// or (ALUControl = 4)
			4'b0100: begin
				ALUResult = (A | B);
				if (ALUResult == 0)
					Zero = 1;
			end

            		// shift left logical (ALUControl = 5)
            		4'b0101: begin
	                	ALUResult = (A << B);
                		if (ALUResult == 0)
                    			Zero = 1;
             		end
                
            		// shift right logical (ALUControl = 6)
            		4'b0110: begin
               			 ALUResult = (A >> B);
                		if (ALUResult == 0)
                   			Zero = 1;
            		end     

			// set less than (ALUControl = 7)
			4'b0111: begin
			     	if (A < B) begin
			         	ALUResult = 32'h00000001;
			         	Zero = 0;
			     	end
			     	else begin
			         	ALUResult = 32'h00000000;
			         	Zero = 1;
			     	end
		    	end
		    
		    	// equal (ALUControl = 8)
		    	4'b1000: begin
		      		if (A == B) begin
		          		ALUResult = 32'h00000001;
		          		Zero = 0;
		      		end
		      		else begin
		          		ALUResult = 32'h00000000;
		          		Zero = 1;
		      		end
		    	end
		    
		    	// not equal (ALUControl = 9)
		    	4'b1001: begin
		      		if (A != B) begin
		          		ALUResult = 32'h00000001;
		          		Zero = 0;
		      		end
		      		else begin
		          		ALUResult = 32'h00000000;
		          		Zero = 1;
		      		end
		    	end

		// data

		// branch
			
		endcase
	end
endmodule


