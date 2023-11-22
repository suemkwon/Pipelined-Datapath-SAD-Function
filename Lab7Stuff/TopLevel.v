`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: TopLevel
//
// Percent Effort: Justyn Arnold (33%), George Collias (33%), Sue Kwon (33%)
// 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TopLevel(clk, rst, WriteData, ProgramCounter, aluResultEX,pcPlus4,pcresultPlus4EX,ALUOpID,readData1ID,readData2ID,instructionOut,readData1EX, instruction,functEX, ALUOpEX,aluControl,aluControlOut, writeRegEX,twentySevenOut, B,pcResultPlus4wb,pcresultPlus4MemOut, aluSrcEX,aluResultWB, readMemDataWB, aluSrcID,memToRegWB,readData2EX,opcode,JumpInstWB, immediateEX,shiftAmountEX,JumpInstC,PCWrite,hazardOutIFID, controlMuxControl,readRegRs,readRegRt,regRtEX,memReadEX,bottomMuxOut,topMuxOut,writeRegMEM,writeRegWB,regWriteMEM,regWriteWB,regRsEX,readMemDataMEM,aluResultMEM, readData2MEM, memWriteMEM, memReadMEM,v0out,v1out);
    

    input clk, rst;
    output wire [31:0] WriteData, ProgramCounter;
    //wire ClkOut;
     output wire[31:0] aluResultEX,pcPlus4,pcresultPlus4EX,readData1ID,readData2ID, instructionOut, instruction; 
    output wire[4:0] ALUOpID, aluControl,aluControlOut,writeRegEX;
    output wire[31:0]B,pcResultPlus4wb,readData1EX;
    output wire aluSrcEX;
    output wire[31:0]aluResultWB, readMemDataWB, readData2EX, immediateEX,shiftAmountEX,pcresultPlus4MemOut,twentySevenOut;
    output wire[5:0] functEX, opcode;
    output wire [4:0] ALUOpEX;
    output wire aluSrcID;
    output wire [2:0] JumpInstC,memToRegWB,JumpInstWB;//test
    output wire [31:0] v0out,v1out;
    
    output wire PCWrite, hazardOutIFID, controlMuxControl;
    output wire [4:0] readRegRs,readRegRt,regRtEX;
    output wire memReadEX;
    output wire [2:0] bottomMuxOut,topMuxOut;
    output wire [4:0] writeRegMEM,writeRegWB,regRsEX;
    output wire regWriteMEM,regWriteWB;
    output wire [31:0] readMemDataMEM;
    output wire [31:0]aluResultMEM, readData2MEM;
    output wire memWriteMEM, memReadMEM;
// Instruction Fetch 

        wire [31:0] instrAaddress, instruction; 
        // Pipeline Register Outputs
        wire [31:0] instructionOut, pcresultPlus4ID, pcresultPlus4EX, pcresultPlus4MEM, pcresultPlus4MemOut,
            pcresultPlus4Out, pcresultPlus4Out2, A, B, signExtendedShift, datatowrite, addressAdded,
            addressAddedOut, aluResultEX, aluResultMEM, aluResultWB, immediateID, immediateEX, 
            shiftAmountID, shiftAmountEX, readData1ID, readData2ID, pcPlus4, nextPc, readData1EX, 
            readData2EX, readMemDataMEM, readMemDataWB, pcresult, readData2MEM, muxOut, addr;
        wire [15:0] immediate;
        wire [5:0] funct, opcode, functEX;  
        wire [4:0] readRegRs, readRegRt, regRd, writeRegEX, writeRegMEM, writeRegWB, 
            destinationRegEX, regRtEX, aluControl, ALUOpID;
        wire [4:0] ALUOpEX, aluControlOut;
        wire pcSrcID, regWriteID, aluSrcID, branchID, memWriteID, memReadID, 
            zeroExtID, pcSrcEX, regWriteEX, aluSrcEX, branchEX, memWriteEX, memReadEX, 
            zeroExtEX, regWriteMEM, memWriteMEM, memReadMEM, branchMEM, 
            pcSrcMEM, zeroEX, zeroMEM, bit6_EX, bit21EX, aluSrc2, regWriteWB, 
            branch, zero, PCSrc, branchOUT;  
         wire [27:0]signExtendedJumpID,signExtendedJumpEX,signExtendedJumpMEM,signExtendedJumpWB; 
         wire [25:0]jumpInstructions; 
         wire [31:0] twentySevenOut,pcresultPlus4Mem, pcResultPlus4wb;
         wire [2:0] memToRegWB, regDstID,regDstEX,memToRegEX,memToRegMEM,memToRegID,JumpInstC,JumpInstEX,JumpInstMEM,JumpInstWB;
        // Mux32Bit2To1(out, inA, inB, sel)
        
        
        wire [4:0] regRsEX;
        
        wire PCWrite,hazardOutIFID,controlMuxControl;
        wire regWriteID2, aluSrcID2, branchID2, memWriteID2, memReadID2, 
                pcSrcID2, readData1ID2, readData2ID2, 
                shiftAmountID2, immediateID2;
        wire [4:0] ALUOpID2; 
        wire [2:0]regDstID2,memToRegID2,JumpInstC2;
        wire [31:0] readData1EX2;
        
        wire [2:0] bottomMuxOut,topMuxOut;
        wire [31:0] B22;
        wire [31:0] v0out,v1out;
        wire hazardJump;
        wire flushIfId, flushIdEx, flushExMem;
        wire branchoutout;
        
        Mux32Bit2To1 v(muxOut, pcresultPlus4MEM, pcPlus4, branchOUT);
        // Mux27Bit2To1(out, inA, inB, sel, pcplus4, jumpReturn);
        //Mux27Bit2To1 w(twentySevenOut, signExtendedJump, muxOut, JumpInstC,pcPlus4,aluResultMEM); //inA = 1, inB = 0
        //Mux27Bit2To1 w(twentySevenOut, signExtendedJump, muxOut,JumpInstWB ,pcPlus4,readData1EX);
          Mux27Bit2To1 w(twentySevenOut, signExtendedJumpWB, muxOut,JumpInstWB ,pcResultPlus4wb,aluResultWB, hazardJump);

        // PCAdder(PCResult, PCAddResult, clk, rst)
        PCAdder a(ProgramCounter, pcPlus4, clk, rst);
        // ProgramCounter(Address, PCResult, rst, clk)
        ProgramCounter b(twentySevenOut, PCWrite,ProgramCounter, rst, clk);
        // InstructionMemory(PCResult, Instruction)
        InstructionMemory c(ProgramCounter, instruction);
        // IF_ID_REG(instructionIn, PCPlus4In, instructionOut, PCPlus4Out, clk)
        IF_ID_REG d(instruction, pcPlus4, instructionOut, pcresultPlus4Out, clk,hazardOutIFID,flushIfId);
    
// Instruction Decode

        assign readRegRs = instructionOut[25:21];
        assign readRegRt = instructionOut[20:16];
        assign opcode = instructionOut[31:26];
        assign regRd = instructionOut[15:11];
        assign immediate = instructionOut[15:0];
        assign funct = instructionOut[5:0];
        assign jumpInstructions = instructionOut[25:0];
    
        // Controller(opCode, PCSrc, RegWrite, RegDst, ALUSrc, Branch, 
                // MemWrite, MemRead, MemToReg, zeroExt, JumpInstCont, ALUOp)
        Controller e(opcode, pcSrcID, regWriteID, regDstID, aluSrcID, branchID, 
                 memWriteID, memReadID, memToRegID, zeroExtID, JumpInstC, ALUOpID,funct,hazardJump,clk);
        // SignExtension(in, out, zeroExt)
        SignExtension f(immediate, immediateID, zeroExtID2);
        // SignExtend(in, out)
        SignExtend g(instructionOut[10:6], shiftAmountID);
        // RegisterFile(clk, ReadRegister1, ReadRegister2, ReadData1, ReadData2, WriteRegister, 
                   // WriteData, RegWrite)
         RegisterFile h(clk, readRegRs, readRegRt, readData1ID, readData2ID, writeRegWB, 
                   WriteData, regWriteWB,v0out,v1out); 
        // ID_EX_REG(clk, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, 
                // MemToReg, ALUOp, PCSrc, Data1, Data2, 
                // ShiftAmount, Immediate, pc_plus_4, Bit6, 
                // Funct, Bit21, RegRt, RegRd, RegWrite_out, 
                // RegDst_out, ALUSrc_out, Branch_out, MemWrite_out, MemRead_out, MemToReg_out, 
                // ALUOp_out, PCSrc_out, Data1_out, Data2_out, ShiftAmount_out, Immediate_out, 
                // pc_plus_4_out, Bit6_out, Funct_out, Bit21_out, RegRt_out, RegRd_out)               
       ID_EX_REG i(clk, regWriteID2, regDstID2, aluSrcID2, branchID2, memWriteID2, memReadID2, 
                memToRegID2, ALUOpID2, pcSrcID2, readData1ID, readData2ID, 
                shiftAmountID, immediateID, pcresultPlus4Out, instructionOut[6], 
                funct, instructionOut[21], readRegRt, regRd, regWriteEX, 
                regDstEX, aluSrcEX, branchEX, memWriteEX, memReadEX, memToRegEX, 
                ALUOpEX, pcSrcEX, readData1EX, readData2EX, shiftAmountEX, immediateEX, 
                pcresultPlus4ID, bit6EX, functEX, bit21EX, regRtEX, destinationRegEX,JumpInstC2,JumpInstEX,
                signExtendedJumpID,signExtendedJumpEX,readRegRs, regRsEX,flushIdEx);
             // ShiftLeft(in, out)
             ShiftLeft25bit m(jumpInstructions, signExtendedJumpID); 
             
             ControlMux ok(controlMuxControl,pcSrcID, regWriteID, regDstID, aluSrcID, branchID, 
                 memWriteID, memReadID, memToRegID, zeroExtID, JumpInstC, ALUOpID, pcSrcID2, regWriteID2, aluSrcID2, branchID2,   
               memWriteID2, memReadID2, zeroExtID2, JumpInstC2, memToRegID2,regDstID2, ALUOpID2); 
               
                  //Hazard(clk, regRs, regRt, memReadMEM, RegRtEX, RegRdMEM,PCWrite, WriteIFID, controlMux);
             //Hazard(clk, registerRS, registerRT, memReadEX, memReadMEM, RegRtEX, RegRdMEM, PCWrite, WriteIFID, controlMux);
              //module Hazard(clk, registerRS, registerRT, memReadEX, RegRtEX, PCWrite, WriteIFID, controlMux,memRead,RTmem);
             Hazard a1(clk,readRegRs,readRegRt,memReadEX,regRtEX,PCWrite,hazardOutIFID, controlMuxControl,memReadMEM,writeRegMEM,regWriteEX,regWriteMEM,
             JumpInstC,JumpInstEX,JumpInstMEM,JumpInstWB,branchID,branchEX,branchMEM,branchOUT,flushIfId, flushIdEx, flushExMem,memReadID);
             
               
               
// Execute  
         
        // Mux5Bit2To1(out, inA, inB, sel)      
        Mux5Bit2To1 j(writeRegEX, regRtEX, destinationRegEX, regDstEX);
        // Mux32Bit2To1(out, inA, inB, sel)
        //Mux32Bit2To1 k(B, immediateEX, readData2EX, aluSrcEX);
        
        // ALUControl(funct, ALUOp, rBit6, rBit21, ALUControl, ALUSrc2,readData2EX)
        ALUControl l(functEX, ALUOpEX, bit6EX, bit21EX, aluControl, aluSrc2,readData2EX);
        // Mux32Bit2To1(out, inA, inB, sel)
        // Mux32Bit2To1 m(A, readData1EX, shiftAmountEX, aluSrcEX);
        // ALU32Bit(ALUControl, A, B, ALUResult, Zero, clk,shiftAmountEX)
        ALU32Bit n(aluControl, readData1EX2, B22, aluResultEX, zeroEX, clk,shiftAmountEX); 
        // ShiftLeft(in, out)
        ShiftLeft o(immediateEX, signExtendedShift);
        // Adder(pc_plus4, shiftleft, out)
        Adder p(pcresultPlus4ID, signExtendedShift, pcresultPlus4EX);
        // EX_MEM_REG(clk, RegWrite, Branch, MemWrite, MemRead, 
                 // MemToReg, PCSrc, Zero, ALUResult, WriteMemData, 
                 // pc_plus_4, WriteReg, RegWrite_out, Branch_out, 
                 // MemWrite_out, MemRead_out, MemToReg_out, PCSrc_out, Zero_out, 
                 // ALUResult_out, WriteMemData_out, pc_plus_4_out, WriteReg_out,aluControl)
        EX_MEM_REG q(clk, regWriteEX, branchEX, memWriteEX, memReadEX, 
                 memToRegEX, pcSrcEX, zeroEX, aluResultEX, readData2EX, 
                 pcresultPlus4EX, writeRegEX, regWriteMEM, branchMEM, 
                 memWriteMEM, memReadMEM, memToRegMEM, pcSrcMEM, zeroMEM, 
                 aluResultMEM, readData2MEM, pcresultPlus4MEM, writeRegMEM,aluControl,aluControlOut,pcresultPlus4ID,pcresultPlus4MemOut,
                 JumpInstEX,JumpInstMEM,signExtendedJumpEX,signExtendedJumpMEM,flushExMem);
    
    //ForwardingUnit(clk,regRTEX,regRSEX,writeMEM,writeWB,regwriteMEM,regwriteWB,bottomMuxOut,topMuxOut);
        ForwardingUnit a2(clk,regRtEX,regRsEX,writeRegMEM,writeRegWB,regWriteMEM,regWriteWB,bottomMuxOut,topMuxOut,branchEX);
    
    //module TopMuxBeforeAlu(out, inA, inB, inC, sel );
    TopMuxBeforeAlu a4(readData1EX2,readData1EX, WriteData, aluResultMEM,topMuxOut);
    
    //BottomMuxBeforeALU a5(out, inA, inB, inC, sel );
    BottomMuxBeforeALU a5(B22, B, WriteData, aluResultMEM, bottomMuxOut);
    //MuxBeforeAlu 
    muxBeforeAlu k(B, immediateEX, readData2EX, aluSrcEX);
    
    
// Memory 
    
        // Branch(branch, zero, PCSrc)
        Branch r(branchMEM, zeroMEM, branchOUT);
        // DataMemory(clk, Address, WriteData, MemWrite, MemRead, ReadData,alucontrol)
        DataMemory s(clk, aluResultMEM, readData2MEM, memWriteMEM, memReadMEM, readMemDataMEM,aluControlOut);
        // MEM_WB_REG(clk, RegWrite, MemToReg, MemData, ALUResult, WriteReg, 
                  // RegWrite_out, MemToReg_out, MemData_out, ALUResult_out, WriteReg_out)
        MEM_WB_REG t(clk, regWriteMEM, memToRegMEM, readMemDataMEM, aluResultMEM, writeRegMEM, 
                 regWriteWB, memToRegWB, readMemDataWB, aluResultWB, writeRegWB,pcresultPlus4MemOut,pcResultPlus4wb,
                 JumpInstMEM,JumpInstWB,signExtendedJumpMEM,signExtendedJumpWB);
    
// Write Back

        // Mux32Bit2To1(out, inA, inB, sel)
        //Mux32Bit2To1 u(WriteData,  aluResultWB, readMemDataWB, memToRegWB);
        // mux32Bit3To1(out, inA, inB, inC, sel);
        mux32Bit3To1 u(WriteData, aluResultWB,readMemDataWB, pcResultPlus4wb, memToRegWB);
        // ClkDiv(Clk, Rst, ClkOut)
        // ClkDiv v(clk, 1'b0, ClkOut);
        
        // Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out)
        // Two4DigitDisplay w(clk, WriteData[15:0], ProgramCounter[15:0], out7, en_out);

endmodule
