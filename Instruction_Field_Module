
module instruction_field(

  input[22:0] instr,
  output reg[4:0] opcode,
  output reg[1:0] regD,
  output reg[1:0] regS,
  output reg[1:0] regT,
  output reg[11:0] offset

);

  
  assign opcode = instr[22:18];
  assign regD = instr[17:16];
  assign regS = instr[15:14];
  assign regT = instr[13:12];
  assign offset = instr[11:0];


endmodule

