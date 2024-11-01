`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Controller
// 
// Additional Comments:
//
// Last Updated: 3:11 AM 11/1/23 
// 
//////////////////////////////////////////////////////////////////////////////////


module Controller(opcode, PCSrc, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, zeroExt, JumpInstCont, ALUOp);

    input [5:0] opcode;
    output reg PCSrc, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, zeroExt, JumpInstCont;
    output reg [4:0] ALUOp;
    
    initial begin
       PCSrc <= 0;
       RegWrite <= 0;
       RegDst <= 0;
       ALUSrc <= 0;
       Branch <= 0; 
       MemWrite <= 0; 
       MemRead <= 0; 
       MemToReg <= 0; 
       zeroExt <= 0;
       JumpInstCont <= 0;
     end   

    always @(opcode)    begin
        
    case(opcode)
    
    6'b000000:  begin   // R-format
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 1;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; 
        zeroExt <= 0;
        ALUOp <= 5'b00000;
        end         
    6'b001000: begin   // addi
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; 
        zeroExt <= 0;
        ALUOp <= 5'b00001;
        end
    6'b011100: begin  // mul
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 1;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; 
        zeroExt <= 0;
        ALUOp <= 5'b00011;    
        end
    6'b001100: begin // andi
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; 
        zeroExt <= 1;
        ALUOp <= 5'b10100;    
        end
    6'b001101: begin  // ori
       PCSrc <= 0;
       RegWrite <= 1;
       RegDst <= 0;
       ALUSrc <= 1;
       Branch <= 0;
       MemWrite <= 0;
       MemRead <= 0;
       MemToReg <= 1;
       zeroExt <= 1;
       ALUOp <= 5'b10101;    
       end 
    6'b001110: begin  // xori
       PCSrc <= 0;
       RegWrite <= 1;
       RegDst <= 0;
       ALUSrc <= 1;
       Branch <= 0;
       MemWrite <= 0;
       MemRead <= 0;
       MemToReg <= 1; 
       zeroExt <= 1;
       ALUOp <= 5'b11001;    
       end  
    6'b001010:  begin  // slti 
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1;
        zeroExt <= 0;
        ALUOp <= 5'b11101;    
        end   
    6'b000000:  begin  // jr
        PCSrc <= 0;
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b10001; 
        JumpInstCont <= 1;   
        end   
    6'b000010:  begin  // j
        PCSrc <= 0;
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b10000;  
        JumpInstCont <= 2;  
        end   
    6'b000011:  begin  // jal 
        PCSrc <= 0;
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b10010;  
        JumpInstCont <= 2;  
        end   
     endcase    
    end

endmodule
