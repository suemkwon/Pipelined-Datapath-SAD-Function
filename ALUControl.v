`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: ALUControl
// 
// Additional Comments:
//
// Last Updated: 10:44 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module ALUControl(funct, ALUOp, rBit6, rBit21, ALUControl, ALUSrc2);

    input [5:0] funct;
    input [3:0] ALUOp;
    input rBit6, rBit21;
    output reg [3:0] ALUControl;
    output reg ALUSrc2;
    
    initial begin
        ALUControl <= 0;
    end    
    
    always @(ALUOp or funct) begin
        
        if(ALUOp == 4'b0000)    begin  
            if(funct == 6'b100000)  begin
                ALUSrc2 <= 0;
                ALUControl <= 4'b0000;
                end
            else if(funct == 6'b100001) begin 
                ALUSrc2 <= 0;
                ALUControl <= 4'b0000;
                end
            else if(funct == 6'b100010) begin 
                ALUSrc2 <= 0;
                ALUControl <= 4'b0001;
                end
            else if(funct == 6'b011000) begin 
                ALUSrc2 <= 0;
                ALUControl <= 4'b0010;
                end
            else if(funct == 6'b011001) begin
                ALUSrc2 <= 0;
                ALUControl <= 4'b1111;
                end
            else if(funct == 6'b100100) begin 
                ALUSrc2 <= 0;
                ALUControl <= 4'b0011;
                end
            else if(funct == 6'b100101) begin
                ALUSrc2 <= 0;
                ALUControl <= 4'b0100;
                end
            else if(funct == 6'b100111) begin 
                ALUSrc2 <= 0;
                ALUControl <= 4'b0101;
                end
            else if(funct == 6'b100110) begin
                ALUSrc2 <= 0;
                ALUControl <= 4'b0110;
                end
            else if(funct == 6'b000000) begin 
                ALUSrc2 <= 1;
                ALUControl <= 4'b0111;
                end
            end                            
    end  
    
endmodule
