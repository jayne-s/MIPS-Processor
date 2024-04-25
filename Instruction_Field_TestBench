
module main;
  
  reg[22:0] instruction;
  wire[4:0] opcode;
  wire[1:0] regD, regS, regT;
  wire[11:0] offset;
  
  instruction_field instr1(instruction, opcode, regD, regS, regT, offset);
  
  
  initial begin
    $monitor("instr=%d, opcode=%d, regD=%d, regS=%d, regT=%d, offset=%d", instruction, opcode, regD, regS, regT, offset);
    
    instruction='b00010111001000000000000; #45;
    instruction='b00001001100000001010000; #45;
    
  end 
  
  
endmodule
