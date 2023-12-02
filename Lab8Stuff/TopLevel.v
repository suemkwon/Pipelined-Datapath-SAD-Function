`timescale 1ns / 1ps

module TopLevel(clk, rst, finalData, lowRegister, highRegister, ProgramCounter);
    
    input clk, rst;
    output wire [31:0] finalData, lowRegister, highRegister, ProgramCounter;
    //output reg [31:0] writeRegData_final, address_added_final;
    //output reg [31:0] regLow_final, regHigh_final;
    //output wire regWrite_WB;
    wire [63:0] regHighLow, datatowrite, aluResultEX, aluResultMEM, aluResultWB; 
    wire [31:0] instructionOut, pcresultPlus4ID, pcresultPlus4EX, pcresultPlus4MEM, pcresultPlus4Out, pcresultPlus4Out2, instrAddress, instruction; 
    wire [31:0] immediateID, immediateEX, shiftAmountID, shiftAmountEX, readData1ID, readData2ID, pcPlus4, nextPc;
    wire [31:0] readData1EX, readData2EX, readData2MEM, readMemDataMEM, readMemDataWB, pcresult;
    wire [31:0] A, B, signExtendedShift, regLow, regHigh, addressAdded, addressAddedOut;
    wire [15:0] immediate;
    wire [5:0] opCode, funct, functEX;
    wire [4:0] readRegRs, readRegRt, regRd, writeRegEX, writeRegMEM, writeRegWB, destinationRegEX, regRtEX;
    wire [3:0] aluControl, ALUOpID, ALUOpEX;
    wire pcSrcID, regWriteID, regDstID, aluSrcID, branchID, memWriteID, memReadID, memToRegID, zeroExtID;
    wire pcSrcEX, regWriteEX, regDstEX, aluSrcEX, branchEX, memWriteEX, memReadEX, memToRegEX, zeroExtEX;
    wire regWriteMEM, memToRegMEM, memWriteMEM, memReadMEM, branchMEM, pcSrcMEM;  
    wire memToRegWB, zeroEX, zeroMEM, bit6EX, bit21EX, aluSrc2, highLowUpdate, regWrite_WB; 
    
    // Instruction Fetch     
    PCAdder pc_adder(ProgramCounter, pcPlus4, clk, rst);
    ProgramCounter program_count(pcPlus4, ProgramCounter, rst, clk);
    InstructionMemory inst_mem(ProgramCounter, instruction);
    IF_ID_REG if_id(clk, instruction, pcPlus4, instructionOut, pcresultPlus4Out);
    
    // Instruction Decode
    assign readRegRs = instructionOut[25:21];
    assign readRegRt = instructionOut[20:16];
    assign opCode = instructionOut[31:26];
    assign regRd = instructionOut[15:11];
    assign immediate = instructionOut[15:0];
    assign funct = instructionOut[5:0];
    
    Controller control(opCode, pcSrcID, regWriteID, regDstID, aluSrcID, branchID, memWriteID, memReadID, memToRegID, zeroExtID, ALUOpID);
    SignExtension sign_ex(immediate, immediateID, zeroExtID);
    SignExtend5_32 extend(instructionOut[10:6], shiftAmountID);
    RegisterFile reg_file(clk, readRegRs, readRegRt, readData1ID, readData2ID, writeRegWB, finalData, regWriteWB); 
    ID_EX_REG id_ex(clk, regWriteID, regDstID, aluSrcID, branchID, memWriteID, memReadID, memToRegID, ALUOpID, pcSrcID, 
        readData1ID, readData2ID, shiftAmountID, immediateID, pcresultPlus4Out, instructionOut[6], funct, instructionOut[21], 
        readRegRt, regRd, regWriteEX, regDstEX, aluSrcEX, branchEX, memWriteEX, memReadEX, memToRegEX, ALUOpEX, pcSrcEX,
        readData1EX, readData2EX, shiftAmountEX, immediateEX, pcresultPlus4ID, bit6EX, functEX, bit21EX, regRtEX, destinationRegEX);
                    
    // Execute          
    Mux5Bit2To1 dest_reg(writeRegEX, regRtEX, destinationRegEX, regDstEX);
    Mux32Bit2To1 alu_input_B(B, readData2EX, immediateEX, aluSrcEX); 
    ALUControl alu_control(functEX, ALUOpEX, bit6EX, bit21EX, aluControl, highLowUpdate, aluSrc2);
    Mux32Bit2To1 alu_input_A(A, readData1EX, shiftAmountEX, aluSrc2);
    ALU64Bit alu64(aluControl, A, B, regHighLow, aluResultEX, zeroEX, clk); 
    HiLo highlow(aluResultEX, highLowUpdate, regHighLow, lowRegister, highRegister);
    ShiftLeft shift(immediateEX, signExtendedShift);
    Adder add(pcresultPlus4ID, signExtendedShift, pcresultPlus4EX);
    EX_MEM_REG ex_mem(clk, regWriteEX, branchEX, memWriteEX, memReadEX, memToRegEX, pcSrcEX, zeroEX, aluResultEX, readData2EX, 
        pcresultPlus4EX, writeRegEX, regWriteMEM, branchMEM, memWriteMEM, memReadMEM, memToRegMEM, pcSrcMEM, zeroMEM, 
        aluResultMEM, readData2MEM, pcresultPlus4MEM, writeRegMEM);
    
    // Memory
    DataMemory data_mem(clk, aluResultMEM, readData2MEM, memWriteMEM, memReadMEM, readMemDataMEM);
    MEM_WB_REG mem_wb(clk, regWriteMEM, memToRegMEM, readMemDataMEM, aluResultMEM, writeRegMEM, regWriteWB, memToRegWB, 
        readMemDataWB, aluResultWB, writeRegWB);
    
    // Write Back
    Mux64_32Bit mux64(finalData, readMemDataWB, aluResultWB, memToRegWB);

endmodule