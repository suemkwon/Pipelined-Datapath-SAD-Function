`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: ALUControl
// 
// Additional Comments:
//
// Last Updated: 11:42 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module ALUControl(funct, ALUOp, rBit6, rBit21, ALUControl, ALUSrc2);

    input [5:0] funct;
    input [4:0] ALUOp;
    input rBit6, rBit21;
    output reg [4:0] ALUControl;
    output reg ALUSrc2;
    
    initial begin
        ALUControl <= 0;
    end    
    
    always @(ALUOp) begin
        
        ALUSrc2 <= 0;
        //addi
        if(ALUOp == 5'b00001)  begin
                ALUControl <= 5'b00001;
                end
            // add
            else if(funct == 6'b100000)  begin
                ALUControl <= 5'b00000;
                end
            // sub
            else if(funct == 6'b100010) begin 
                ALUControl <= 5'b00010;
                end
            // mult
            else if(funct == 6'b011000) begin 
                ALUControl <= 5'b00011;
                end
            // and
            else if(funct == 6'b100100) begin 
                ALUControl <= 5'b10011;
                end
            // or
            else if(funct == 6'b100101) begin
                ALUControl <= 5'b10101;
                end
            // nor
            else if(funct == 6'b100111) begin 
                ALUControl <= 5'b10110;
                end
            // xor
            else if(funct == 6'b100110) begin
                ALUControl <= 5'b10111;
                end
            // sll
          //  else if(funct == 6'b000000) begin 
            //    ALUControl <= 5'b11010;
              //  end
            // srl
            else if(funct == 6'b000010) begin
                ALUControl <= 5'b11011;
                end
            // slt
            else if(funct == 6'b101010) begin
                ALUControl <= 5'b11100;
                end     
            end                           
endmodule
