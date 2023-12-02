`timescale 1ns / 1ps

module ALU64Bit(ALUControl, A, B, regHiLow, ALUResult, Zero, clk);

	input [63:0] regHiLow;
    input [31:0] A, B;
    input [3:0] ALUControl; 
    input clk;
	output reg [63:0] ALUResult;
	output reg Zero;	    
	reg [63:0] temp;
	
	initial begin
	   ALUResult <= 0;
	end   

    //always @(posedge clk or negedge clk) begin
    always @(A or B or ALUControl) begin
        case (ALUControl)
        4'b0000: ALUResult = A + B;     
        4'b0001: ALUResult = A - B;
        4'b0010: ALUResult = $signed(A * B);
        4'b0011: ALUResult = A & B;
        4'b0100: ALUResult = A | B;
        4'b0101: ALUResult = ~(A | B);
        4'b0110: ALUResult = A ^ B;
        4'b0111: ALUResult = B << A;
        4'b1000: ALUResult =  B >> A;
        4'b1001: begin 
                    if (A < B) 
                        ALUResult = 1; 
                    else 
                        ALUResult = 0;
                end
        4'b1010: if(B != 1) ALUResult = A;       
        4'b1011: if(B == 0) ALUResult = A;       
        4'b1100: ALUResult = (A >> B) | (A << (32-B));
        4'b1101: begin
                    temp = regHiLow + $signed(A*B);
                    ALUResult[31:0] = temp[31:0];
                    ALUResult[63:32] = temp[63:32];
                end
        4'b1110: begin
                    temp = regHiLow - $signed(A*B);
                    ALUResult[31:0] = temp[31:0];
                    ALUResult[63:32] = temp[63:32];
                end
        4'b1111: ALUResult = A * B;                
        endcase  
    
        if (ALUResult == 0)
            Zero = 1;
        else
            Zero = 0;             
    end      
endmodule

