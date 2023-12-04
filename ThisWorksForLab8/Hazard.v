`timescale 1ns / 1ps


      module Hazard(clk, registerRS, registerRT, memReadEX, RegRtEX, PCWrite, WriteIFID, controlMux, memReadMEM, RegRtMEM,regwriteex,regwritemem,
      JumpInstC,JumpInstEX,JumpInstMEM,JumpInstWB,branchid,branchex,branchmem,branchout,flushifid, flushidex, flushexmem,memreadid,regRsEX, writeRegMEM,writeRegWB,regwritewb,memtoregwb,memToRegEX,memToRegMEM,memToRegID);
      
input branchid,branchex,branchmem,branchout;
    input [4:0] RegRtEX,RegRtMEM;
    input memReadEX, memReadMEM,regwriteex,regwritemem;
    input clk;
    input [4:0] registerRS, registerRT;
    input [2:0] JumpInstC,JumpInstEX,JumpInstMEM,JumpInstWB,memtoregwb,memToRegEX,memToRegMEM,memToRegID;
    input memreadid;
    input [4:0]regRsEX, writeRegMEM,writeRegWB;
    input regwritewb; 
    //instruction[25:21] = RS
   //assign registerRS = instruction[25:21];
    //instruction[20:16] = RT
    //assign registerRT = instruction[20:16];
    

 
 
    output reg PCWrite, WriteIFID, controlMux, flushifid, flushidex, flushexmem;
 initial begin 
 PCWrite = 0;
 WriteIFID = 0;
 controlMux = 0;
 flushifid = 0;
              flushidex = 0;
              flushexmem = 0;

              
 end
 
 
  always @ (*) begin
  
             PCWrite <= 0;
             WriteIFID <= 0;
             controlMux <= 0;
                     
              flushifid  <= 0;
              flushidex <= 0;
              flushexmem <= 0;
             
    if((memReadEX > 0) && ((RegRtEX == registerRS) || (RegRtEX == registerRT))) begin
            PCWrite <= 1;
            WriteIFID <= 1;
            controlMux <= 1;
        end
        
    else if((memReadMEM > 0) && ((RegRtMEM == registerRS) || (RegRtMEM == registerRT))) begin
              PCWrite <= 1;
              WriteIFID <= 1;
              controlMux <= 1;
         end


         
             else if((regwriteex > 0) && ((RegRtMEM == registerRS) || (RegRtMEM == registerRT)) && (registerRS != 0) && (registerRT!=0)) begin
              PCWrite <= 1;
              WriteIFID <= 1;
              controlMux <= 1;
         end
      
             else if((regwritemem > 0) && ((RegRtMEM == registerRS) || (RegRtMEM == registerRT)) && (registerRS != 0) && (registerRT!=0)) begin
              PCWrite <= 1;
              WriteIFID <= 1;
              controlMux <= 1;
         end


      
         else if ((branchex == 1) || (branchmem == 1)) begin
            PCWrite <= 1;
              WriteIFID <= 1;
              controlMux <= 1;
              end

        else if ((branchid == 1) && ((memReadEX == 1) || (memReadMEM == 1))) begin
            PCWrite <= 1;
              WriteIFID <= 1;
              controlMux <= 1;
              end

              
              //use this to remove forwarding
//              else if ((memToRegMEM > 0)|| (memToRegEX> 0)) begin
//              PCWrite <= 1;
//              WriteIFID <= 1;
//              controlMux <= 1;
//              end//end this for forwarding
              
              else if ((memreadid > 0) && (memReadEX > 0)) begin
              PCWrite <= 1;
              WriteIFID <= 1;
              controlMux <= 1;
              end

              
              
        
              if (JumpInstC == (1)) begin
              PCWrite <= 0;
              WriteIFID <= 1;
              controlMux <= 0;
              end
              
              if (JumpInstC == (2)) begin
              PCWrite <= 1;
              WriteIFID <= 1;
              controlMux <= 0;
              end
              
              
 if  (branchout == 1) begin
              PCWrite <= 0;
              WriteIFID <= 1;
              controlMux <= 1;
              flushifid  <= 1;
              flushidex <= 0;
              flushexmem <= 0;          
          end          
    end
 
 
         
endmodule