`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// ECE369A
//
//Student(s) Name and Last Name: Justyn Arnold (33%), George Collias (33%), Sue Kwon (33%)
// 
// Create Date: 10/21/2023 03:06:12 PM
// Design Name: 
// Module Name: TopLevel
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


module TopLevel(clk, rst, finalData, ProgramCounter);
    
    input clk, rst;
    output wire [31:0] finalData;
    output wire [31:0] ProgramCounter;
    
    // Instruction Fetch 
    wire [31:0] instr_address, instruction; 
    // Pipeline Register Outputs
    wire [31:0] instruction_out, pcresult_plus4_ID, pcresult_plus4_EX, pcresult_plus4_MEM, pcresult_plus4_out, pcresult_plus4_out2; 
    wire [5:0] funct;
    wire [31:0] A, B, signExtended_shift; 
    wire [31:0] datatowrite; 
    wire [3:0] aluControl, ALUOp_ID, ALUOp_EX;
    wire aluSrc2, regWrite_WB; 
    wire [4:0] readRegRs, readRegRt, regRd;
    wire [5:0] opCode;
    wire [15:0] immediate;
    wire [31:0] address_added, address_added_out;
    wire pcSrc_ID, regWrite_ID, regDst_ID, aluSrc_ID, branch_ID, memWrite_ID, memRead_ID, memToReg_ID, zeroExt_ID;
    wire pcSrc_EX, regWrite_EX, regDst_EX, aluSrc_EX, branch_EX, memWrite_EX, memRead_EX, memToReg_EX, zeroExt_EX;
    wire regWrite_MEM, memToReg_MEM, memWrite_MEM, memRead_MEM, branch_MEM, pcSrc_MEM;  
    wire memToReg_WB, zero_EX, zero_MEM;
    wire [4:0] writeReg_EX, writeReg_MEM, writeReg_WB, destinationReg_EX, regRt_EX;
    wire [31:0] aluResult_EX, aluResult_MEM, aluResult_WB;
    wire [31:0] immediate_ID, immediate_EX, shiftAmount_ID, shiftAmount_EX, readData1_ID, readData2_ID, pc_plus4, nextPc;
    wire [31:0] readData1_EX, readData2_EX,readData2_MEM, readMemData_MEM, readMemData_WB, pcresult;
    wire [5:0] funct_EX;
    wire bit6_EX, bit21_EX;     
     
    PCAdder a(ProgramCounter, pc_plus4, clk, rst);
    ProgramCounter b(pc_plus4, ProgramCounter, rst, clk);
    InstructionMemory c(ProgramCounter, instruction);
    IF_ID_REG d(clk, instruction, pc_plus4, instruction_out, pcresult_plus4_out);
    
    // Instruction Decode
    assign readRegRs = instruction_out[25:21];
    assign readRegRt = instruction_out[20:16];
    assign opCode = instruction_out[31:26];
    assign regRd = instruction_out[15:11];
    assign immediate = instruction_out[15:0];
    assign funct = instruction_out[5:0];
    
    Controller e(opCode, pcSrc_ID, regWrite_ID, regDst_ID, aluSrc_ID, branch_ID, memWrite_ID, memRead_ID, memToReg_ID, zeroExt_ID, ALUOp_ID);
    SignExtension f(immediate, immediate_ID, zeroExt_ID);
    SignExtend g(instruction_out[10:6], shiftAmount_ID);
    RegisterFile h(clk, readRegRs, readRegRt, readData1_ID, readData2_ID, writeReg_WB, finalData, regWrite_WB); 
    ID_EX_REG i(clk, regWrite_ID, regDst_ID, aluSrc_ID, branch_ID, memWrite_ID, memRead_ID, memToReg_ID, ALUOp_ID, pcSrc_ID, readData1_ID, readData2_ID, 
                shiftAmount_ID, immediate_ID, pcresult_plus4_out, instruction_out[6], funct, instruction_out[21], readRegRt, regRd,regWrite_EX, 
                regDst_EX, aluSrc_EX, branch_EX, memWrite_EX, memRead_EX, memToReg_EX, ALUOp_EX, pcSrc_EX, readData1_EX, readData2_EX, 
                shiftAmount_EX, immediate_EX, pcresult_plus4_ID, bit6_EX, funct_EX, bit21_EX, regRt_EX, destinationReg_EX);
                    
    // Execute             
    Mux5Bit2To1 j(writeReg_EX, regRt_EX, destinationReg_EX, regDst_EX);
    Mux32Bit2To1 k(B, readData2_EX, immediate_EX, aluSrc_EX); 
    ALUControl l(funct_EX, ALUOp_EX, bit6_EX, bit21_EX, aluControl, aluSrc2);
    Mux32Bit2To1 m(A, readData1_EX, shiftAmount_EX, aluSrc2);
    ALU32Bit n(aluControl, A, B, aluResult_EX, zero_EX, clk); 
    ShiftLeft o(immediate_EX, signExtended_shift);
    Adder p(pcresult_plus4_ID, signExtended_shift, pcresult_plus4_EX);
    EX_MEM_REG q(clk, regWrite_EX, branch_EX, memWrite_EX, memRead_EX, memToReg_EX, pcSrc_EX, zero_EX, aluResult_EX, readData2_EX, pcresult_plus4_EX, writeReg_EX,regWrite_MEM, 
                 branch_MEM, memWrite_MEM, memRead_MEM, memToReg_MEM, pcSrc_MEM, zero_MEM, aluResult_MEM, readData2_MEM, pcresult_plus4_MEM, writeReg_MEM);
    
    // Memory 
    DataMemory r(clk, aluResult_MEM, readData2_MEM, memWrite_MEM, memRead_MEM, readMemData_MEM);
    MEM_WB_REG s(clk, regWrite_MEM, memToReg_MEM, readMemData_MEM, aluResult_MEM, writeReg_MEM, regWrite_WB, memToReg_WB, readMemData_WB, aluResult_WB, writeReg_WB);
    
    // Write Back
    Mux32Bit2To1 t(finalData, readMemData_WB, aluResult_WB, memToReg_WB);

    
endmodule
