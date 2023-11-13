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


module ALUControl(funct, ALUOp, rBit6, rBit21, ALUControl, ALUSrc2,readData2Ex);

    input [31:0] readData2Ex;
    input [5:0] funct;
    input [4:0] ALUOp;
    input rBit6, rBit21;
    output reg [4:0] ALUControl;
    output reg ALUSrc2;
    
    wire [4:0] specificBits;
    assign specificBits = readData2Ex[20:16];
    
    initial begin
        ALUControl <= 0;
    end    
    
    always @* begin
        
        ALUSrc2 <= 0;
        //addi
        if(ALUOp == 5'b00001)  begin
                ALUControl <= 5'b00001;
        end
        //xori
        else if(ALUOp == 5'b11001)  begin
                ALUControl <= 5'b11001;
        end
        //slti
        else if(ALUOp == 5'b11101)  begin
                ALUControl <= 5'b11101;
        end
        //ori
        else if(ALUOp == 5'b11000)  begin
                ALUControl <= 5'b11000;
        end
        //andi
        else if(ALUOp == 5'b10100)  begin
                ALUControl <= 5'b10100;
        end
        //bgez and bltz
        else if(ALUOp == 5'b01010)  begin
            if (readData2Ex == 1) begin //bgez
                ALUControl <= 5'b01010;
                end
            else  //bltz
            ALUControl <= 5'b01111;
            
         end //end bgez and bltz
        // beq
        else if(ALUOp == 5'b01011)  begin
                ALUControl <= 5'b01011;
         end
         //bgtz 
          else if(ALUOp == 5'b01101)  begin
                ALUControl <= 5'b01101;
         end
         //blez 
         else if(ALUOp == 5'b01110)  begin
                ALUControl <= 5'b01110;
         end
         //bne
         else if(ALUOp == 5'b01100)  begin
                ALUControl <= 5'b01100;
         end
         //bltz
         else if(ALUOp == 5'b01111)  begin
                ALUControl <= 5'b01111;
                end
         //jr 
         else if(ALUOp == 5'b10001) begin 
                ALUControl <= 5'b10001;
         end
         //sb
         else if(ALUOp == 5'b00110)  begin
                ALUControl <= 5'b00110;
         end
         //lh
         else if(ALUOp == 5'b00111)  begin
                ALUControl <= 5'b00111;
         end
         //lb
         else if(ALUOp == 5'b01000)  begin
                ALUControl <= 5'b01000;
         end
         //sh
         else if(ALUOp == 5'b01001)  begin
                ALUControl <= 5'b01001;
         end
        
        else if(ALUOp == 5'b00011)  begin
        // mult 
                ALUControl <= 5'b00011;
         end
                //r-type
         else if(ALUOp == 5'b00000)  begin
            // add
          if(funct == 6'b100000)  begin
                ALUControl <= 5'b00000;
                end
            // sub
            else if(funct == 6'b100010) begin 
                ALUControl <= 5'b00010;
                end

            // srl
            else if(funct == 6'b000010) begin
                ALUControl <= 5'b11011;
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
            // slt
            else if(funct == 6'b101010) begin
                ALUControl <= 5'b11100;
                end    
            //sll
            else if(funct == 6'b000000) begin 
                ALUControl <= 5'b11010;
                end 
            end    
         end                     
endmodule
