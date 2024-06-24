module control(

  input clock,
  input reset,
  input [4:0] op,
  output reg regDst,
  output reg regWrite,
  output reg ALUSrc,
  output reg [2:0] ALUOp,
  output reg PCSrc,
  output reg memWrite,
  output reg memRead,
  output reg memToReg

);
 
  parameter LW = 0;
  parameter SW = 1;
  parameter ADD = 2;
  parameter ADDI = 3;
  parameter BEQ = 4;
  parameter B = 5;
 
 
 
  always @(posedge clock) begin
   
    if(reset) begin
     
      regDst <= 0;
      regWrite <= 0;
      ALUSrc <= 0;
      ALUOp <= 0;
      PCSrc <= 0;
      memWrite <= 0;
      memRead <= 0;
      memToReg <= 0;
     
    end
   
    else begin
     
      case (op)
     
      LW:
       
        begin
       
        regDst <= 1;
        regWrite <= 1;
        ALUSrc <= 1;
        ALUOp <= 0;
        PCSrc <= 0;
        memWrite <= 0;
        memRead <= 1;
        memToReg <= 1;
       
      end
       
      SW:
       
        begin
           
        regDst <= 1;
        regWrite <= 0;
        ALUSrc <= 1;
        ALUOp <= 0;
        PCSrc <= 0;
        memWrite <= 1;
        memRead <= 0;
        memToReg <= 0;
         
        end
       
      ADD:
       
        begin
         
        regDst <= 1;
        regWrite <= 1;
        ALUSrc <= 0;
        ALUOp <= 0;
        PCSrc <= 0;
        memWrite <= 0;
        memRead <= 0;
        memToReg <= 0;
         
        end
       
      ADDI:
       
        begin
         
        regDst <= 1;
        regWrite <= 1;
        ALUSrc <= 1;
        ALUOp <= 0;
        PCSrc <= 0;
        memWrite <= 0;
        memRead <= 0;
        memToReg <= 0;
         
        end
       
      BEQ:
       
        begin
         
        regDst <= 0;
        regWrite <= 0;
        ALUSrc <= 0;
        ALUOp <= 7;
        PCSrc <= 1;
        memWrite <= 0;
        memRead <= 0;
        memToReg <= 0;
         
        end
       
      B:
       
        begin
         
        regDst <= 0;
        regWrite <= 0;
        ALUSrc <= 0;
        ALUOp <= 2;
        PCSrc <= 1;
        memWrite <= 0;
        memRead <= 0;
        memToReg <= 0;
         
        end  
        
        default: 
        
        begin
        
      regDst <= 0;
      regWrite <= 0;
      ALUSrc <= 0;
      ALUOp <= 0;
      PCSrc <= 0;
      memWrite <= 0;
      memRead <= 0;
      memToReg <= 0;
        
        
        end
     endcase
 
 end
 end
      
endmodule
