`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Module Name: ALU32Bit
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
//
// Additional Comments:
//
// Last Updated: 1:36 AM 10/30/23
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU32Bit(ALUControl, A, B, ALUResult, Zero, clk,shiftAmountEX);

    // control bits for ALU operation
    // you need to adjust the bitwidth as needed
	input [4:0] ALUControl;            
	input [31:0] A, B,shiftAmountEX;	
	input clk;    

    // answer
	output reg [31:0] ALUResult;	
	
	// Zero = 1 if ALUResult == 0
	output reg Zero;	    

	always @ (ALUControl, A, B) begin

		Zero = 0;

		case (ALUControl)
		
		// arithmetic operations
		
			// add (Add)
			// ALUControl = 0
			5'b00000: begin
				ALUResult = (A + B);
				if (ALUResult == 0)
					Zero = 1;
			end

			// addi (Add Immediate)
			// ALUControl = 1
			5'b00001: begin
				ALUResult = (A + B);
				if (ALUResult == 0)
					Zero = 1;
			end

			// sub (Subtract)
			// ALUControl = 2
			5'b00010: begin
				ALUResult = (A - B);
				if (ALUResult == 0)
					Zero = 1;
			end
			
			// mul (Multiply)
			// ALUControl = 3
			5'b00011: begin
				ALUResult = (A * B);
				if (ALUResult == 0)
					Zero = 1;
			end

        	// data operations
        
        		// lw (Load word)
			// ALUControl = 4
			5'b00100: begin
				ALUResult = (A + B);
				if (ALUResult == 0)
					Zero = 1;
			end
        
           		// sw (Store word)
			// ALUControl = 5
			5'b00101: begin
				ALUResult = (A + B);
				if (ALUResult == 0)
					Zero = 1;
			end
			
			// sb (Store byte)
			// ALUControl = 6
			5'b00110: begin
				ALUResult = (A + B);
				if (ALUResult == 0)
					Zero = 1;
			end     
        
            		// lh (Load half)
			// ALUControl = 7
			5'b00111: begin
			//if (opcode == 1)
				ALUResult = (A + B);
				if (ALUResult == 0)
					Zero = 1;
					//end//end of new if
			end
        
            		// lb (Load byte)
			// ALUControl = 8
			5'b01000: begin
				ALUResult = (A + B);
				if (ALUResult == 0)
					Zero = 1;
			end
        
            		// sh (Store half)
			// ALUControl = 9
			5'b01001: begin
				ALUResult = (A + B);
				if (ALUResult == 0)
					Zero = 1;
			end
        
        	// branch operations 
        
            		// bgez (branch if greater than or equal to zero)
			// ALUControl = 10
			5'b01010: begin
				ALUResult = (A >= 0);
			   if (A == -1) begin
			   Zero = 0;
			   end
			  else if (A >= 0) begin
					Zero = 1;
			 end
			end
			
			// beq (branch on equal)
			// ALUControl = 11
			5'b01011: begin
				ALUResult = (A == B);
				if (A == B) begin
				Zero = 1;
				end
				//if (ALUResult == 0)
					//Zero = 1;
			end
			
			// bne (branch on not equal)
			// ALUControl = 12
			5'b01100: begin
				ALUResult = (A != B);
				//if (ALUResult == 0)
				if (A != B) begin
					Zero = 1;
					end
			end
			
			// bgtz (branch on greater than zero)
			// ALUControl = 13
			5'b01101: begin
				ALUResult = (A > 0);
				if (A > 0) begin
					Zero = 1;
					end
			end
			
			// blez (branch on less than or equal to zero)
			// ALUControl = 14
			5'b01110: begin
				ALUResult = (A <= 0);
				if (A <= 0) begin
					Zero = 1;   
					end
			end
			
			// bltz (branch on less than zero)
			// ALUControl = 15
			5'b01111: begin
				ALUResult = (A < 0);
				if (ALUResult == 1 || A == -1)
					Zero = 1;
			end
			
			// j (jump)
			// ALUControl = 16
			5'b10000: begin
				Zero = 1;
			end
			
			// jr (jump register)
			// ALUControl = 17
			5'b10001: begin
			ALUResult = A;
				Zero = 1;
			end
			
			// jal (jump and link)
			// ALUControl = 18
			5'b10010: begin
				Zero = 1;
			end   
			
		// logical operations
        
			// and (And)
			// ALUControl = 19
			5'b10011: begin
				ALUResult = (A & B);
				if (ALUResult == 0)
					Zero = 1;
			end

			// andi (And immediate)
			// ALUControl = 20
			5'b10100: begin
				ALUResult = (A & B);
				if (ALUResult == 0)
					Zero = 1;
			end

            		// or (Or)
			// ALUControl = 21
            		5'b10101: begin
                		ALUResult = (A | B);
                		if (ALUResult == 0)
                    			Zero = 1;
             		end
                
            		// nor (Nor or)
			// ALUControl = 22
            		5'b10110: begin
                		ALUResult = ~(A | B);
                		if (ALUResult == 0)
                   			Zero = 1;
            		end  
            
            		// xor (Exclusive or)
			// ALUControl = 23
            		5'b10111: begin
                		ALUResult = (A ^ B);
                		if (ALUResult == 0)
                    			Zero = 1;
            		end  
            
            		// ori (Or immediate)
			// ALUControl = 24
            		5'b11000: begin
                		ALUResult = (A | B);
                		if (ALUResult == 0)
                    			Zero = 1;
            		end 
            
            		// xori (Exclusive or Immediate)
			// ALUControl = 25
            		5'b11001: begin
                		ALUResult = (A ^ B);
                		if (ALUResult == 0)
                    			Zero = 1;
            		end
            
            		// sll (Shift left logical)
			// ALUControl = 26
            		5'b11010: begin
                		ALUResult = (B << shiftAmountEX);
                		if (ALUResult == 0)
                    			Zero = 1;
            		end
            
            		// srl (Shift right logical)
			// ALUControl = 27
            		5'b11011: begin
                		ALUResult = (B >> shiftAmountEX);
                		if (ALUResult == 0)
                    			Zero = 1;
            		end

			// slt (Set on less than)
			// ALUControl = 28
			5'b11100: begin
			     if (A < B) begin
			         ALUResult = 1;
			         Zero = 0;
			     end
			     else begin
			         ALUResult = 0;
			         Zero = 1;
			     end
		    	end
		    
            		// slti (Set on less than immediate)
			// ALUControl = 29
			5'b11101: begin
			    if (A < B) begin
			         ALUResult = 1;
			         Zero = 0;
			     end
			     else begin
			         ALUResult = 0;
			         Zero = 1;
			     end
		   	end
		endcase
	end

endmodule
