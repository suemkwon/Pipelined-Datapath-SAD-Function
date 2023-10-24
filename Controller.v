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


module Controller(op, RegDst, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemtoReg, PCSrc, RegA, RegB);

    input [5:0] op;
    output reg RegDst, RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg, PCSrc, RegA, RegB;
    output reg [3:0] ALUOp;
    
            
    always @ (op) begin
      
                  
                  if (op == 6'b000000) begin
                    RegDst <= 0; 
                    RegWrite <= 0;
                    ALUSrc <= 0; 
                    MemRead <= 0; 
                    MemWrite <= 0;
                    MemtoReg <= 0; 
                    PCSrc <= 0; 
                    RegA <= 0; 
                    RegB <= 0;
                    ALUOp <= 4'd0000;
                  end
                  
                  else if (op == 6'b000000) begin
                    RegDst <= 0; 
                    RegWrite <= 0;
                    ALUSrc <= 0; 
                    MemRead <= 0; 
                    MemWrite <= 0;
                    MemtoReg <= 0; 
                    PCSrc <= 0; 
                    RegA <= 0; 
                    RegB <= 0;
                    ALUOp <= 4'b0000;
                  end
                  
                  else if (op == 6'b000000) begin
                    RegDst <= 0; 
                    RegWrite <= 0;
                    ALUSrc <= 0; 
                    MemRead <= 0; 
                    MemWrite <= 0;
                    MemtoReg <= 0; 
                    PCSrc <= 0; 
                    RegA <= 0; 
                    RegB <= 0;
                    ALUOp <= 4'b0000;
                  end
                      
                  else if (op == 6'b000000) begin
                    RegDst <= 0; 
                    RegWrite <= 0;
                    ALUSrc <= 0; 
                    MemRead <= 0; 
                    MemWrite <= 0;
                    MemtoReg <= 0; 
                    PCSrc <= 0; 
                    RegA <= 0; 
                    RegB <= 0;
                    ALUOp <= 4'b0000;
                  end
                  
                  else if (op == 6'b000000) begin
                    RegDst <= 0; 
                    RegWrite <= 0;
                    ALUSrc <= 0; 
                    MemRead <= 0; 
                    MemWrite <= 0;
                    MemtoReg <= 0; 
                    PCSrc <= 0; 
                    RegA <= 0; 
                    RegB <= 0;
                    ALUOp <= 4'b0000;
                  end
                  
                  else if (op == 6'b000000) begin
                    RegDst <= 0; 
                    RegWrite <= 0;
                    ALUSrc <= 0; 
                    MemRead <= 0; 
                    MemWrite <= 0;
                    MemtoReg <= 0; 
                    PCSrc <= 0; 
                    RegA <= 0; 
                    RegB <= 0;
                    ALUOp <= 4'b0000;
                  end
                  
                  else if (op == 6'b000000) begin
                    RegDst <= 0; 
                    RegWrite <= 0;
                    ALUSrc <= 0; 
                    MemRead <= 0; 
                    MemWrite <= 0;
                    MemtoReg <= 0; 
                    PCSrc <= 0; 
                    RegA <= 0; 
                    RegB <= 0;
                    ALUOp <= 4'b0000;
                  end
                  
                  else if (op == 6'b000000) begin
                    RegDst <= 0; 
                    RegWrite <= 0;
                    ALUSrc <= 0; 
                    MemRead <= 0; 
                    MemWrite <= 0;
                    MemtoReg <= 0; 
                    PCSrc <= 0; 
                    RegA <= 0; 
                    RegB <= 0;
                    ALUOp <= 4'b0000;
                  end
                  
                  else if (op == 6'b000000) begin
                    RegDst <= 0; 
                    RegWrite <= 0;
                    ALUSrc <= 0; 
                    MemRead <= 0; 
                    MemWrite <= 0;
                    MemtoReg <= 0; 
                    PCSrc <= 0; 
                    RegA <= 0; 
                    RegB <= 0;
                    ALUOp <= 4'b0000;
                  end
                 
                  else if (op == 6'b000000) begin
                    RegDst <= 0; 
                    RegWrite <= 0;
                    ALUSrc <= 0; 
                    MemRead <= 0; 
                    MemWrite <= 0;
                    MemtoReg <= 0; 
                    PCSrc <= 0; 
                    RegA <= 0; 
                    RegB <= 0;
                    ALUOp <= 4'b0000;
                  end
                  
                  else begin
                    RegDst <= 0; 
                    RegWrite <= 0;
                    ALUSrc <= 0; 
                    MemRead <= 0; 
                    MemWrite <= 0;
                    MemtoReg <= 0; 
                    PCSrc <= 0; 
                    RegA <= 0; 
                    RegB <= 0;
                  end
           end      
endmodule

