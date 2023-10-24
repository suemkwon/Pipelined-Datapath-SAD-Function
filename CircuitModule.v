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


module CircuitModule(Clock, Reset, Instruction);
    input Clock, Reset;
    
    output [31:0] Instruction;
    
    // control signals declared as wire
    wire RegDst, RegWrite, ALUSrc, MemRead, MemWrite,MemtoReg, PCSrc, RegA, RegB;
    wire [3:0] ALUOp;
    wire Zero;
    
    // RegisterFile
    wire [4:0] WR, RR1;
    wire [31:0] RD1, RD2;
    
    // PC and PCAdder 
    wire [31:0] PCpl4Out, PCOut, PCSrcOut;
    
    // Sign Extension
    wire [31:0] PCSEADDOut, SL2Out, SESig;
    
    // ALU
    wire [31:0] ALUMainOut, ASrcOut, RBOut;
    wire ALUZero;
       
    // Data Memory   
    wire [31:0] DMRD, MtROut;
    
    // Instruction Memory  
    wire [31:0] AddrIns, InsMain;
    
    // Debug Register used to monitor values in Post-Synthesis Functional Simulations
    (* mark_debug = "true" *) wire [31:0] debug_Reg8, debug_Reg16, debug_Reg17, debug_Reg19, debug_Reg20;
   
   
    /* Module Instantiation */
   
   
    // InstructionMemory(Address, Instruction)
    InstructionMemory a(PCOut, InsMain);
        // Address - (output of PC)
        // Instruction - (Instruction [31:0])
         
         
    // Controller(op, func, RegDst, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemtoReg, PCSrc, RegA, RegB);
    Controller b(InsMain[31:26],InsMain[5:0], RegDst, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemtoReg, PCSrc, RegA, RegB);

    
    // Mux32Bit2To1 (out, rt, rs, RegA)
    Mux32Bit2To1 c(RR1, {27'b0,InsMain[20:16]}, {27'b0,InsMain[25:21]}, RegA);
        // inA - Instruction [20:16]
        // inB - Instruction [25:21]
        // sel - RegA
    
    
    // Mux32Bit2To1 (out, rd, rt, RegA)
    Mux32Bit2To1 d(WR, {27'b0,InsMain[15:11]}, {27'b0,InsMain[20:16]}, RegDst);
        // inA - Instruction [15:11]
        // inB - Instruction [20:16]
        // sel - RegDst
    
    
   // SignExtension(in, out);     
   SignExtension e(InsMain[15:0], SESig);
        // in - Instruction[15:0]
        // out - new 32 bit signal
        
   
   // ALU32Bit( ALUControl, A, B, ALUResult, Zero)    
   ALU32Bit f(4'b1000, SESig, 32'd2, SL2Out, Zero);
        // ALUControl - 1000
        // A - *** output from (PC+4) ***
        // B - 32'd2 (32 to stay consistent)
        // Zero - ??? ground???
        
        
   // ProgramCounter(Address, PCResult, Reset, Clk);
   ProgramCounter g(PCSrcOut, PCOut, Reset, Clock);
        // Address - out of MuxPCSrc "Instruction"         
        // PCResult - into InstructionMemory
        // Reset - ??
        // Clk - if we need an out from CLKDIV? 
        
        
   // PCAdder(PCResult, PCAddResult);
   PCAdder h(PCOut, PCpl4Out);
        // PCResult - output from PC
        // PCAddResult - output into mux PCSrc inB and PCSEADD 'B' 
        
        
   // ALU32Bit(ALUControl, A, B, ALUResult, Zero)    
   ALU32Bit i(4'b0000, PCpl4Out, SL2Out, PCSEADDOut, Zero);
      // ALUControl - 0000
      // A - *** output from (PCpl4) ***
      // B - new 32 bit signal of SE^^ that is <<2
      // ALUResult - [31:0] into next mux
      // Zero - ??? ground???


   // Mux32Bit2To1(out, inA, inB, sel)
   Mux32Bit2To1 j(PCSrcOut, PCSEADDOut, PCpl4Out, PCSrc);
        // inA - ALUResult of PCSEADD
        // inB - *** output from PC+4 ***
        // sel - PCSrc
              
  
  // RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2, Debug Regs); 
  RegisterFile k(RR1, InsMain[20:16], WR, Instruction, RegWrite, Clock, RD1, RD2, debug_Reg8, debug_Reg16, debug_Reg17, debug_Reg19, debug_Reg20);
       
  // Peviously used RegFile replaced with the debug capable RegFile above 
  // RegisterFile k(RR1, InsMain[20:16], WR, Instruction, RegWrite, Clock, RD1, RD2);
     // ReadRegister1 - output from mux RA
     // ReadRegister2 - Instruction [20:16]
     // WriteRegister - output from mux RD
     // WriteData - output from mux MtR
     // RegWrite - RegWrite
     // Clk - clock
     // ReadData1 - output to mother ALU input A
     // ReadData2 - out to inB of mux ASRC
     
  
  // Mux32Bit2To1(out, inA, inB, sel)   
  Mux32Bit2To1 l(ASrcOut, SESig, RD2, ALUSrc);
     // inA - new 32 bit signal of SE
     // inB - output of ReadData2 ^^
     // sel - ALUSrc
  
  
  // Mux32Bit2To1(out, inA, inB, sel)   
  Mux32Bit2To1 m(RBOut, {27'b0,InsMain[10:6]}, ASrcOut, RegB);
     // inA - Instruction [10:6]
     // inB - out from mux ASRC
     // sel - RegB
  
  
  // ALU32Bit(ALUControl, A, B, ALUResult, Zero)    
  ALU32Bit n(ALUOp, RD1, RBOut, ALUMainOut, ALUZero);
    // ALUControl - ALUOp
    // A - ReadData1
    // B - out of mux RB
    // ALUResult - [31:0] into Data Memory
    // Zero - into DataMemory
  
     
  // DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData);   
  DataMemory o(ALUMainOut, RD2, Clock, MemWrite, MemRead, DMRD);  
  
  
  // Mux32Bit2To1(Output, inA, inB, sel)  
  Mux32Bit2To1 p(Instruction, ALUMainOut, DMRD, MemtoReg); 
    // inA - ALUResult of ALU "Main"
    // inB - ReadData output of DataMemory
    // sel - MemtoReg
  
     
endmodule
