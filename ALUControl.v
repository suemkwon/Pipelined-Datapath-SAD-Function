`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 05:05:51 AM
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(ALUOp, SignEx, out);
    input [5:0] SignEx;
    input [5:0] ALUOp;
    
    output reg [5:0] out;
    
    always @ (*) begin
       
        if(ALUOp == 0) begin
            if (SignEx == 6'b100000) begin // add
                out <= 0;
            end
            else if(SignEx == 6'b100010) begin // sub
                out <= 2;
            end
            else if(SignEx == 6'b011000) begin // mul
                out <= 3;
            end
            else if (SignEx == 6'b001000) begin // jr
                out <= 17;
            end
            else if(SignEx == 6'b100100) begin // and
                out <= 19;
            end
            else if(SignEx == 6'b100101) begin // or
                out <= 21;
            end
            else if(SignEx == 6'b100111) begin // nor
                out <= 22;
            end
            else if(SignEx == 6'b100110) begin // xor
                out <= 23;
            end
            else if(SignEx == 6'b000000) begin // sll
                out <= 26;
            end
            else if(SignEx == 6'b000010) begin // srl
                out <= 27;
            end
            else if(SignEx == 6'b101010) begin // slt
                out <= 28;
            end
            else begin
                out <= 0;
            end
        end
        else begin
            out <= ALUOp;
        end
    end    
endmodule
