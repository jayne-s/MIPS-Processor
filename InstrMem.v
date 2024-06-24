module instruction_memory(
  input wire [22:0] instruction,
  output wire [4:0] opcode,
  output wire [1:0] regD,
  output wire [1:0] regS,
  output wire [1:0] regT,
  output wire [11:0] offset

);
  
  assign opcode = instruction[22:18];
  assign regD = instruction[17:16];
  assign regS = instruction[15:14];
  assign regT = instruction[13:12];
  assign offset = instruction[11:0];
  
endmodule
