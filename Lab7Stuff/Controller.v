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


module Controller(opcode, PCSrc, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, zeroExt, JumpInstCont, ALUOp,funct,hazardjump,clk,flushifid);

    input [5:0] opcode,funct;
    output reg PCSrc, RegWrite, ALUSrc, Branch, MemWrite, MemRead, zeroExt; 
    output reg [2:0] JumpInstCont, MemToReg, RegDst;
    output reg [4:0] ALUOp;
    input [2:0] hazardjump;
    input clk;
    
    output reg flushifid;
    
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
       flushifid <= 0;
     end   




    always @*    begin
        
    case(opcode)
    
    6'b000000:  begin   // R-format (0 opcode)
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
        JumpInstCont <= 0;
    if (funct == 6'b001000)begin//jr
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
        JumpInstCont <= 2;
        end
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
        JumpInstCont <= 0;
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
        JumpInstCont <= 0;   
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
        JumpInstCont <= 0;
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
       ALUOp <= 5'b11000;    
       JumpInstCont <= 0;
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
       JumpInstCont <= 0; 
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
        JumpInstCont <= 0;  
        end 
        //https://opencores.org/projects/plasma/opcodes
        //https://student.cs.uwaterloo.ca/~isg/res/mips/opcodes
       6'b100011:  begin  // lw 
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 1;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b00001; 
        JumpInstCont <= 0;   
        end   
        
        6'b101011:  begin  // sw
        PCSrc <= 0;
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 1;
        MemRead <= 0;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b00001;  
        JumpInstCont <= 0;  
        end 
        
         6'b101000:  begin  // sb
        PCSrc <= 0;
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 1;
        MemRead <= 0;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b00110;
        JumpInstCont <= 0;    
        end
         6'b100001:  begin  // lh
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 1;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b00111; 
        JumpInstCont <= 0;   
        end
         6'b100000:  begin  // lb
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 1;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b01000;    
        JumpInstCont <= 0;
        end  
        6'b101001:  begin  // sh
        PCSrc <= 0;
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        MemWrite <= 1;
        MemRead <= 0;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b01001;    
        JumpInstCont <= 0;
        end
	 6'b000001:  begin  // bgez(same opcode as bltz)
        PCSrc <= 1;
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 0;
        Branch <= 1;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b01010;  
        JumpInstCont <= 0;  
        end
         6'b000100:  begin  // beq
        PCSrc <= 1;
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 0;
        Branch <= 1;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b01011;  
        JumpInstCont <= 0;  
        end
         6'b000101:  begin  // bne
        PCSrc <= 1;
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 0;
        Branch <= 1;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b01100;  
        JumpInstCont <= 0;  
        end
         6'b000111:  begin  // bgtz
        PCSrc <= 1;
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 0;
        Branch <= 1;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b01101;  
        JumpInstCont <= 0;  
        end
         6'b000110:  begin  // blez
        PCSrc <= 1;
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 0;
        Branch <= 1;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 0;
        zeroExt <= 0;
        ALUOp <= 5'b01110;  
        JumpInstCont <= 0;  
        end
//         6'b000001:  begin  // bltz (same opcode as bgez)
//        PCSrc <= 1;
//        RegWrite <= 0;
//        RegDst <= 0;
//        ALUSrc <= 0;
//        Branch <= 1;
//        MemWrite <= 0;
//        MemRead <= 0;
//        MemToReg <= 0;
//        zeroExt <= 0;
//        ALUOp <= 5'b01111;  
//        JumpInstCont <= 0;  
//        end
//    6'b000000:  begin  // jr
//        PCSrc <= 0;
//        RegWrite <= 0;
//        RegDst <= 0;
//        ALUSrc <= 0;
//        Branch <= 0;
//        MemWrite <= 0;
//        MemRead <= 0;
//        MemToReg <= 0;
//        zeroExt <= 0;
//        ALUOp <= 5'b10001; 
//        JumpInstCont <= 2;
//        end   
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
        ALUOp <= 5'b10000;  //doesnt matter
        JumpInstCont <= 1;  
        end   
    6'b000011:  begin  // jal 
        PCSrc <= 0;
        RegWrite <= 1;
        RegDst <= 2;
        ALUSrc <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 2;
        zeroExt <= 0;
        ALUOp <= 5'b10010;  //doesnt matter
        JumpInstCont <= 1;  
        end   
        
     endcase 
     flushifid <= 0;
     if (hazardjump == 1) begin
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
       flushifid <= 1;
       end   
       
//       else if (hazardjump == 2) begin
//       PCSrc <= 0;
//       RegWrite <= 1;
//       RegDst <= 2;
//       ALUSrc <= 0;
//       Branch <= 0; 
//       MemWrite <= 0; 
//       MemRead <= 0; 
//       MemToReg <= 2; 
//       zeroExt <= 0;
//       JumpInstCont <= 0;
//       end 
       
    end

endmodule
