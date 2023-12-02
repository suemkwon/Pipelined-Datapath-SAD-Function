`timescale 1ns / 1ps

module HiLo(ALUOutput, enableHiLoUpdate, HiLowOutput, lowOut, highOut);
    
    input [63:0] ALUOutput;
    input enableHiLoUpdate;
    output reg [63:0] HiLowOutput;
    output reg [31:0] lowOut, highOut;
  
    initial begin
        HiLowOutput <= 0;
        lowOut <= 0;
        highOut <= 0;
    end    
    
    always @(ALUOutput or enableHiLoUpdate) begin
        #5;
        if(enableHiLoUpdate == 1) begin
            lowOut = ALUOutput[31:0];
            highOut = ALUOutput[63:32];
            // HiLowOutput = $signed(high_out + low_out);
            HiLowOutput[31:0] = lowOut;
            HiLowOutput[63:32] = highOut;
        end
    end
endmodule
