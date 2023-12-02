`timescale 1ns / 1ps

module ALUControl(funct, ALUOp, rBit6, rBit21, ALUControl, HiLowUpdate, ALUSrc2);

    input [5:0] funct;
    input [3:0] ALUOp;
    input rBit6, rBit21;
    output reg [3:0] ALUControl;
    output reg HiLowUpdate, ALUSrc2;
    
    initial begin
        ALUControl <= 0;
    end    
    
    always @(ALUOp or funct) begin
        
        if(ALUOp == 4'b0000) begin // R-Format
            if(funct == 6'b100000) begin // add
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b0000;
            end
            else if(funct == 6'b100001) begin // addu
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b0000;
            end
            else if(funct == 6'b100010) begin // sub
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b0001;
            end
            else if(funct == 6'b011000) begin // mult
                ALUSrc2 <= 0;
                HiLowUpdate <= 1;
                ALUControl <= 4'b0010;
            end
            else if(funct == 6'b011001) begin // multu
                ALUSrc2 <= 0;
                HiLowUpdate <= 1;
                ALUControl <= 4'b1111;
            end
            else if(funct == 6'b100100) begin // and
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b0011;
            end
            else if(funct == 6'b100101) begin // or
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b0100;
            end
            else if(funct == 6'b100110) begin // xor
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b0110;
            end
            else if(funct == 6'b100111) begin // nor
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b0101;
            end
            else if(funct == 6'b000000) begin // sll
                ALUSrc2 <= 1;
                HiLowUpdate <= 0;
                ALUControl <= 4'b0111;
            end
            else if(funct == 6'b000010) begin 
                HiLowUpdate <= 0;
                if(rBit21 == 0) begin
                    ALUControl <= 4'b1000; // srl
                    ALUSrc2 <= 1;   
                end
                else begin
                    ALUControl <= 4'b1100; // rotr
                    ALUSrc2 <= 0;   
                end
            end    
            else if(funct == 6'b000100) begin // sllv
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b0111;
            end
            else if(funct == 6'b000110) begin
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                if(rBit6 == 0) 
                    ALUControl <= 4'b1000; // srlv
                else
                    ALUControl <= 4'b1100; // rotrv 
            end    
            else if(funct == 6'b101010) begin // slt
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b1001;
            end
            else if(funct == 6'b000011) begin // sra 
                ALUSrc2 <= 1;
                HiLowUpdate <= 0;
                ALUControl <= 4'b1000;
            end
            else if(funct == 6'b000111) begin // srav
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b1000; 
            end                                                
            else if(funct == 6'b101011) begin // sltu
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b1001;    
            end   
            else if(funct == 6'b001011) begin // movn
                HiLowUpdate <= 0;
                ALUControl <= 4'b1010; 
            end
            else if(funct == 6'b001010) begin // movz
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b1011;
            end
//            else if(funct == 6'b000000) begin // nop
//                ALUSrc2 <= 0;
//                HiLowUpdate <= 0;
//                ALUControl <= 4'b0000;
//            end              
        end                      
        else if(ALUOp == 1) begin // addiu or addi
            ALUSrc2 <= 0;
            HiLowUpdate <= 0;
            ALUControl <= 4'b0000;
        end
        else if(ALUOp == 2) begin 
            if(funct == 6'b000010)  begin // mul
                ALUSrc2 <= 0;
                HiLowUpdate <= 0;
                ALUControl <= 4'b0010;
            end
            else if(funct == 6'b000000) begin // madd
                ALUSrc2 <= 0;
                HiLowUpdate <= 1;
                ALUControl <= 4'b1101;
            end
            else if(funct == 6'b000100) begin // msub
                ALUSrc2 <= 0;
                HiLowUpdate <= 1;
                ALUControl <= 4'b1110;
            end    
        end
        else if(ALUOp == 3) begin // andi
            ALUSrc2 <= 0;
            HiLowUpdate <= 0;
            ALUControl <= 4'b0011;
        end
        else if(ALUOp == 4) begin // ori
            ALUSrc2 <= 0;
            HiLowUpdate <= 0;
            ALUControl <= 4'b0100;
        end
        else if(ALUOp == 5) begin // xori             
            ALUSrc2 <= 0;
            HiLowUpdate <= 0;
            ALUControl <= 4'b0110;
        end
        else if(ALUOp == 6) begin // slt or slti
            ALUSrc2 <= 0;
            HiLowUpdate <= 0;
            ALUControl <= 4'b1001;
        end                            
    end  
endmodule
