`timescale 1ns / 1ps


      module Hazard(clk, registerRS, registerRT, memReadEX, RegRtEX, PCWrite, WriteIFID, controlMux, memReadMEM, RegRtMEM,regwriteex,regwritemem);
      

    input [4:0] RegRtEX,RegRtMEM;
    input memReadEX, memReadMEM,regwriteex,regwritemem;
    input clk;
    input [4:0] registerRS, registerRT;
    //instruction[25:21] = RS
   //assign registerRS = instruction[25:21];
    //instruction[20:16] = RT
    //assign registerRT = instruction[20:16];
    
    output reg PCWrite, WriteIFID, controlMux;
    
 initial begin 
 PCWrite = 0;
 WriteIFID = 0;
 controlMux = 0;
 end
 
 
  always @ (*) begin
  
             PCWrite <= 0;
             WriteIFID <= 0;
             controlMux <= 0;
             
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
            
      
    end
endmodule