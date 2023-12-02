`timescale 1ns / 1ps

module IF_ID_REG(clk, instructionIn, PCPlus4In, instructionOut, PCPlus4Out);

    input [31:0] instructionIn, PCPlus4In;
    input clk;
    output reg [31:0] instructionOut, PCPlus4Out;
    
    initial begin
        instructionOut = 0;
        PCPlus4Out = 0;
    end    
    
    always @(posedge clk) begin
        instructionOut <= instructionIn;
        PCPlus4Out <= PCPlus4In;
    end
    
endmodule
