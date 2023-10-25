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


module Controller(op, func, ALUOp, ALUSrc, RegDst, PCWrite, WB, AddController, M);

    input [5:0] op, func;
    
    output reg [5:0] ALUOp;
    output reg ALUSrc, RegDst, PCWrite;
    // WB = RegWrite, MemtoReg
    // AddController for jump addresses
    output reg [1:0] WB, AddController; 
    // M = Branch MemWrite, MemRead
    output reg [4:0] M;

    
            
    always @ (op, func) begin
      
                  // add (Add)
                  if ((op == 6'b000000) && (func == 6'b100000)) begin
                    WB <= 2'b01;
                    ALUSrc <= 0;
                    RegDst <= 1;
                    M <= 5'b00000;
                    ALUOp <= 5'b00000;
                  end
                  
                  // addi (Add Immediate)
                  else if (op == 6'b001000) begin
                    ALUSrc <= 1;
                    ALUOp <= 1;
                    RegDst <= 0;
                    WB <= 2'b11;
                    M <= 3'b000; 
                    ALUOp <= 5'b00001;
                  end
                  
                  // sub (Subtract)
                  else if ((op == 6'b000000) && (func == 100010)) begin
                    WB <= 2'b01;
                    ALUSrc <= 0;
                    RegDst <= 1;
                    M <= 5'b00000;
                    ALUOp <= 5'b00010;
                  end
                  
                  // mul (Multiply)    
                  else if ((op == 6'b000000) && (func == 011000)) begin
                    WB <= 2'b01;
                    ALUSrc <= 0;
                    RegDst <= 1;
                    M <= 5'b00000;
                    ALUOp <= 5'b00011;
                  end
                  
                  // lw (Load word)
                  else if (op == 6'b100011) begin
                    ALUSrc <= 1'b1;
                    RegDst <= 1'b0;
                    WB <= 2'b10;
                    M <= 5'b00001; 
                    ALUOp <= 5'b00100;
                  end
                  
                  // sw (Store word)
                  else if (op == 6'b101011) begin
                    ALUSrc <= 1'b1;
                    RegDst <= 1'b0;
                    WB <= 2'b0x;
                    M <= 5'b00100;
                    ALUOp <= 5'b00101;
                  end
                  
                  // sb (Store byte)
                  else if (op == 6'b101000) begin
                    ALUSrc <= 1'b1;
                    RegDst <= 1'b0;
                    WB <= 2'b0x;
                    M <= 5'b01000;
                    ALUOp <= 5'b00110;
                  end
                  
                  // lh (Load half)
                  else if (op == 6'b100101) begin
                    ALUSrc <= 1'b1;
                    RegDst <= 1'b0;
                    WB <= 2'b10;
                    M <= 5'b00011; 
                    ALUOp <= 5'b00111;
                  end
                  
                  // lb (Load byte)
                  else if (op == 6'b100000) begin
                    ALUSrc <= 1'b1;
                    RegDst <= 1'b0;
                    WB <= 2'b10;
                    M <= 5'b00010; 
                    ALUOp <= 5'b01000;
                  end
                 
                 // sh (Store half)
                  else if (op == 6'b101001) begin
                    ALUSrc <= 1'b1;
                    RegDst <= 1'b0;
                    WB <= 2'b0x;
                    M <= 5'b01100; 
                    ALUOp <= 5'b01001;
                  end
                  
                  // bgez (branch if greater than or equal to zero)
                  else if (op == 6'b000001) begin
                    ALUSrc <= 1'b0;
                    RegDst <= 1'b0;
                    WB <= 2'b00;
                    M <= 5'b10000; 
                    ALUOp <= 5'b01010;
                  end
                  
                  // beq (branch on equal)
                  else if (op == 6'b000100) begin
                    ALUSrc <= 1'b0;
                    RegDst <= 1'b0;
                    WB <= 2'b00;
                    M <= 5'b10000; 
                    ALUOp <= 5'b01011;
                  end
                  
                  // bne (branch on not equal)
                  else if (op == 6'b000101) begin
                    ALUSrc <= 1'b0;
                    RegDst <= 1'b0;
                    WB <= 2'b00;
                    M <= 5'b10000; 
                    ALUOp <= 5'b01100;
                  end
                  
                  // bgtz (branch on greater than zero)
                  else if (op == 6'b000111) begin
                    ALUSrc <= 1'b0;
                    RegDst <= 1'b0;
                    WB <= 2'b00;
                    M <= 5'b10000; 
                    ALUOp <= 5'b01101;
                  end
                  
                  // blez (branch on less than or equal to zero)
                  else if (op == 6'b000110) begin
                    ALUSrc <= 1'b0;
                    RegDst <= 1'b0;
                    WB <= 2'b00;
                    M <= 5'b10000; 
                    ALUOp <= 5'b01110;
                  end
                  
                  // bltz (branch on less than zero)
                  else if (op == 6'b000001) begin
                    ALUSrc <= 1'b0;
                    RegDst <= 1'b0;
                    WB <= 2'b00;
                    M <= 5'b10000;  
                    ALUOp <= 5'b01111;
                  end
                  
                  // j (jump)
                  else if (op == 6'b000010) begin
                    ALUSrc <= 1'b0;
                    RegDst <= 1'b0;
                    WB <= 2'b00;
                    M <= 5'b10000;
                    AddController <= 2;
                    ALUOp <= 5'b10000;
                  end
                  
                  // jr (jump register)
                  else if ((op == 6'b000000) && (func == 001000)) begin
                    AddController <= 1;
                    ALUSrc <= 1'b0;
                    RegDst <= 1'b0;
                    WB <= 2'b00;
                    M <= 5'b10000; 
                    ALUOp <= 5'b10001;
                  end
                  
                  // jal (jump and link)
                  else if (op == 6'b000011) begin
                    PCWrite <= 1;
                    ALUSrc <= 1'b0;
                    RegDst <= 1'b0;
                    WB <= 2'b00;
                    M <= 5'b10000;
                    ALUOp <= 5'b10010;
                  end
                  
                  // and (And)
                  else if ((op == 6'b000000) && (func == 6'b100100)) begin
                    WB <= 2'b01;
                    ALUSrc <= 0;
                    RegDst <= 1;
                    M <= 5'b00000; 
                    ALUOp <= 5'b10011;
                  end
                  
                  // andi (And immediate)
                  else if (op == 6'b001100) begin
                    ALUSrc <= 1;
                    RegDst <= 0;
                    WB <= 2'b11;
                    M <= 5'b00000;
                    ALUOp <= 5'b10100;
                  end
                  
                  // or (Or)
                  else if ((op == 6'b000000) && (func == 6'b100101)) begin
                    WB <= 2'b01;
                    ALUSrc <= 0;
                    RegDst <= 1;
                    M <= 5'b00000;  
                    ALUOp <= 5'b10101;
                  end
                  
                  // nor (Nor or)
                  else if ((op == 6'b000000) && (func == 6'b100111)) begin
                    WB <= 2'b01;
                    ALUSrc <= 0;
                    RegDst <= 1;
                    M <= 5'b00000;  
                    ALUOp <= 5'b10110;
                  end
                  
                  // xor (Exclusive or)
                  else if ((op == 6'b000000) && (func == 6'b100110)) begin
                    WB <= 2'b01;
                    ALUSrc <= 0;
                    RegDst <= 1;
                    M <= 5'b00000;  
                    ALUOp <= 5'b10111;
                  end
                  
                  // ori (Or immediate)
                  else if (op == 6'b001101) begin
                    ALUSrc <= 1;
                    RegDst <= 0;
                    WB <= 2'b11;
                    M <= 5'b00000; 
                    ALUOp <= 5'b11000;
                  end
                  
                  // xori (Exclusive or Immediate)
                  else if (op == 6'b001110) begin
                    ALUSrc <= 1;
                    RegDst <= 0;
                    WB <= 2'b11;
                    M <= 5'b00000; 
                    ALUOp <= 5'b11000;
                  end
                  
                  // sll (Shift left logical)
                  else if ((op == 6'b000000) && (func == 6'b000000)) begin
                    WB <= 2'b01;
                    ALUSrc <= 0;
                    RegDst <= 1;
                    M <= 5'b00000; 
                    ALUOp <= 5'b11010;
                  end
                  
                  // srl (Shift right logical)
                  else if ((op == 6'b000000) && (func == 6'b000010)) begin
                    WB <= 2'b01;
                    ALUSrc <= 0;
                    RegDst <= 1;
                    M <= 5'b00000; 
                    ALUOp <= 5'b11011;
                  end
                  
                  // slt (Set on less than)
                  else if ((op == 6'b000000) && (func == 6'b101010)) begin
                    WB <= 2'b01;
                    ALUSrc <= 0;
                    RegDst <= 1;
                    M <= 5'b00000; 
                    ALUOp <= 5'b11011;
                  end
                  
                  // slti (Set on less than immediate)
                  else if (op == 6'b001010) begin
                    ALUSrc <= 1;
                    RegDst <= 0;
                    WB <= 2'b11;
                    M <= 5'b00000;
                    ALUOp <= 5'b11101;
                  end

                  else begin
                    ALUSrc <= 1'b0;
                    RegDst <= 1'b0;
                    WB <= 2'b00;
                    M <= 5'b00000;
                    AddController <= 0;
                    PCWrite <= 0; 
                    ALUOp <= 5'd0;
                  end
           end      
endmodule
