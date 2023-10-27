`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Module Name: IF_ID_REG
// 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IF_ID_REG(clk, instruction_in, PC_Plus4_In, instruction_out, PC_Plus4_Out);

    input clk;
    input [31:0] instruction_in, PC_Plus4_In;
    output reg [31:0] instruction_out, PC_Plus4_Out;
    
    initial begin
        instruction_out = 0;
        PC_Plus4_Out = 0;
    end    
    
    always @(posedge clk)   begin
        instruction_out <= instruction_in;
        PC_Plus4_Out <= PC_Plus4_In;
    end
endmodule

