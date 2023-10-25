`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2023 03:06:12 PM
// Design Name: 
// Module Name: CircuitModule
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


module CircuitModule(Rst, Clk, PCAddResult, PCMux, WriteData, ALUResult);

    input Rst, Clk;
    output [31:0] PCAddResult, PCMux, WriteData, ALUResult;

    wire [31:0] Instin, Instruction, addOutIF_Reg, WriteData, ReadData1, ReadData2, signExtOut, BranchADDoutID_Reg, BranchAddout, MEMReadData, ReadData1outtomux, ReadData2outtomux, MEMReadDataout;
    wire [31:0] Jaddress, Jaddressout, ReadData1out, ReadData2out, extendInstruction15_0out, AddOut, ReadData2MEMout, ALUResultoutMEM_Reg, ALUResultOut;
    wire [5:0] ALUOp, ALUOpout;
    wire [4:0] WriteRegister, Instruction20_16out, Instruction15_11out,Instruction25_21out, writeRegout, WriteRegMEMout;
    wire [4:0] M, Mout;
    wire [1:0] WB, WBout, WBMEMout, AddControl, AddControlOut, MemWrite, MemRead, MuxA, MuxB;
    wire PCSrc, RegWrite, ALUSrc, RegDst, RegDstout, ALUSrcout, Zero, ZeroOut, MBranch, MEMtoReg;
    wire PCWrite, IF_ID_Write, controlMux;

    // IF(Rst, Clk, PCWrite, Instruction, PCSrc, JumpAddress, PCAddResult, PCResult)
    IF a(Rst, Clk, PCWrite, Instin, PCSrc, BranchAddout, PCAddResult, PCMux);
    
    // IFID(Clk, Rst, PCSrc, IFIDWrite, addIn, addOut, IMin, IMout)
    IFID b(Clk, Rst, PCSrc, IF_ID_Write, PCAddResult, addOutIF_Reg, Instin, Instruction);
    
    // ID(Clk, Rst, controlMux, Instruction, WriteRegister, WriteData, RegWrite, signExtOut, ReadData1, ReadData2, WB, M, ALUSrc, ALUOp, RegDst, AddControl, PCAddress)
    ID c(Clk, Rst, controlMux, Instruction, WriteRegister, WriteData, RegWrite, signExtOut, ReadData1, ReadData2, WB, M, ALUSrc, ALUOp, RegDst, AddControl, addOutIF_Reg);
    
    // IDEX(Clk, Rst, PCSrc, Instruction25to21, AddControl, Jaddress, WBin, Min, BranchADDin, 
    // ReadData1, ReadData2, extendInstruction15to0, Instruction20to16, Instruction15to11, 
    // RegDst, ALUOp, ALUSrc, WBout, Mout, BranchADDout, ReadData1out, ReadData2out, 
    // extendInstruction15to0out, Instruction20to16out, Instruction15to11out, RegDstout, ALUOpout, 
    // ALUSrcout, Jout, AddControlOut, Instruction25to21out)
    IDEX d(Clk, Rst, PCSrc, Instruction[25:21], AddControl, Jaddress, WB, M, addOutIF_Reg, 
    ReadData1, ReadData2, signExtOut, Instruction[20:16], Instruction[15:11], 
    RegDst, ALUOp, ALUSrc, WBout, Mout, BranchADDoutID_Reg, ReadData1outtomux, ReadData2outtomux, 
    extendInstruction15_0out, Instruction20_16out, Instruction15_11out, RegDstout, ALUOpout, 
    ALUSrcout, Jaddressout, AddControlOut, Instruction25_21out);    

    // Mux32Bit2To1(out, inA, inB, sel)
    Mux32Bit2To1 e(ReadData1out, ReadData1outtomux, ALUResultoutMEM_Reg, MuxA);
    
    // Mux32Bit2To1(out, inA, inB, sel)
    Mux32Bit2To1 f(ReadData2out, ReadData2outtomux, ALUResultoutMEM_Reg, MuxB);

    // EX(Clk, Rst, AddControl, Jin, ALUSrc, ALUOp, signExIn, ReadData1, ReadData2, inst20to16, inst15to11, RegDst, writeReg, addIn, addOut, ALUResult, instruction10_6, Zero)
    EX g(Clk, Rst, AddControlOut, Jaddressout, ALUSrcout, ALUOpout, extendInstruction15_0out, ReadData1out, ReadData2out, Instruction20_16out, Instruction15_11out, RegDstout, writeRegout, BranchADDoutID_Reg, AddOut, ALUResult, extendInstruction15_0out[10:6], Zero);
    
    // EXMEM(Rst, Clk, PCSrc, WBin, Min, BranchAdd, ALUResult, ALUZero, WriteReg, ReadData2, 
    // WBout, MBranch, MemWrite, MemRead, BranchAddout, ALUResultout, ALUZeroOut, WriteRegout, ReadData2out)
    EXMEM h(Rst, Clk, PCSrc, WBout, Mout, AddOut, ALUResult, Zero, writeRegout, ReadData2out, 
    WBMEMout, MBranch, MemWrite, MemRead, BranchAddout, ALUResultoutMEM_Reg, ZeroOut, WriteRegMEMout, ReadData2MEMout);
    
    // MEM(Rst, Clk, ALUResult, ReadData2, MemWrite, MemRead, ReadData1, branch, PCSrc, zero)
    MEM i(Rst, Clk, ALUResultoutMEM_Reg, ReadData2MEMout, MemWrite, MemRead, MEMReadData, MBranch, PCSrc, ZeroOut);
    
    // MEMWB(Rst, Clk, WBin, ReadData, ALUResult, WriteReg, MemtoReg, RegWrite, ReadDataOut, ALUResultOut, WriteRegOut)
    MEMWB j(Rst, Clk, WBMEMout, MEMReadData, ALUResultoutMEM_Reg, WriteRegMEMout, MEMtoReg, RegWrite, MEMReadDataout, ALUResultOut, WriteRegister);
    
    // WB(Clk, Rst, ReadData, ALUout, WriteData, MEMtoReg)
    WB k(Clk, Rst, MEMReadDataout, ALUResultOut, WriteData, MEMtoReg);
endmodule
