`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2023 02:58:31 PM
// Design Name: 
// Module Name: Controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Controller(opCode, PCSrc, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, zeroExt, ALUOp);

    input [5:0] opCode;
    output reg PCSrc, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, zeroExt;
    output reg [3:0] ALUOp;
    
    initial begin
       PCSrc <= 0;
       RegWrite <= 0;
       RegDst <= 0;
       ALUSrc <= 0;
       Branch <= 0; 
       MemWrite<= 0; 
       MemRead<= 0; 
       MemToReg<= 0; 
       zeroExt<= 0;
     end   

    always @(opCode)    begin
        
    case(opCode)
        6'b000000:  begin   
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 1;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; 
        zeroExt <= 0;
        ALUOp <= 4'b0000;
        end
    6'b001001: begin   
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1;
        zeroExt <= 0;
        ALUOp <= 4'b0001;
        end             
    6'b001000: begin   
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; 
        zeroExt <= 0;
        ALUOp <= 4'b0001;
        end
    6'b011100: begin  
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 1;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; 
        zeroExt <= 0;
        ALUOp <= 4'b0010;    
        end
    6'b001100: begin 
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; 
        zeroExt <= 1;
        ALUOp <= 4'b0011;    
        end
    6'b001101: begin  
       PCSrc <= 0;
       RegWrite <= 1;
       RegDst <= 0;
       ALUSrc <= 1;
       Branch <= 0;
       MemWrite <= 0;
       MemRead <= 0;
       MemToReg <= 1;
       zeroExt <= 1;
       ALUOp <= 4'b0100;    
       end 
    6'b001110: begin  
       PCSrc <= 0;
       RegWrite <= 1;
       RegDst <= 0;
       ALUSrc <= 1;
       Branch <= 0;
       MemWrite <= 0;
       MemRead <= 0;
       MemToReg <= 1; 
       zeroExt <= 1;
       ALUOp <= 4'b0101;    
       end
    6'b011111: begin   
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 1;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; 
        zeroExt <= 0;
        ALUOp <= 4'b0011;    
        end   
    6'b001010:  begin   
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1;
        zeroExt <= 0;
        ALUOp <= 4'b0110;    
        end   
    6'b001011:  begin  
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 1; 
        zeroExt <= 0;
        ALUOp <= 4'b0110;    
        end
        endcase    
    end


endmodule
