module datapath(
	
   input [1:0] i, 
   input clock,
   input reset,
   input [11:0] pc
   
);
  
  wire [4:0] opcode;
  wire [1:0] regD;
  wire [1:0] regS;
  wire [1:0] regT;
  wire [11:0] offset;
  
  reg [4:0] op;
  wire regDst;
  wire regWrite;
  wire ALUSrc;
  wire [2:0] ALUOp;
  wire PCSrc;
  wire memWrite;
  wire memRead;
  wire memToReg;
  
  reg reg_write;
  reg [1:0] read_reg_1;
  reg [1:0] read_reg_2;
  reg [1:0] write_reg;
  reg [23:0] write_data;
  wire [23:0] read_data_1;
  wire [23:0] read_data_2;
  
  reg[23:0] regA;
  reg[23:0] regB;
  wire[23:0] result;
  reg[2:0] select;
  reg carry_in;
  wire[2:0] flags;
  
 
  reg [23:0] address;
  wire [23:0] read_data_mem;
  reg [23:0] write_data_mem;
  
  
  wire [22:0] instruction;
  reg [11:0] pc_next;
  
  wire delayed_clock;
  
  assign #10 delayed_clock = clock;

  reg[22:0] rom[10:0];
  
  initial begin
    rom[0] = 23'b00000010000000000010000;
    rom[1] = 23'b00000100000000000100000;
    rom[2] = 23'b00010111001000000000000;
    rom[3] = 23'b00001000011000000110000;
  end
  
    
   assign instruction = rom[i];
    
  always @(posedge clock or posedge reset) begin
    
    if(reset)
      pc_next <= 0;
    else
      pc_next <= pc+pc_next+1;
    
  end
  
  instruction_memory i1(instruction, opcode, regD, regS, regT, offset);
  
  assign op = opcode;
  
  control c1(delayed_clock, reset, op, regDst, regWrite, ALUSrc, ALUOp, PCSrc, memWrite, memRead, memToReg);
  
  assign read_reg_1 = regS;
  assign read_reg_2 = regT;
  assign reg_write = regWrite;
  assign write_reg = (regDst == 0) ? regT : regD;
  
  register_file r1(delayed_clock, reg_write, read_reg_1, read_reg_2, write_reg, write_data, read_data_1, read_data_2);
  
  assign regB = (ALUSrc == 1) ? ({12'b0,offset}) : read_data_2;
assign regA = read_data_1;
assign select = ALUOp;  
 
  ALU a1(regA, regB, result, select, carry_in, flags);
  
assign address = result;
assign write_data_mem = read_data_2;
  
  data_memory m1(delayed_clock, memWrite, memRead, address, read_data_mem, write_data_mem);
  
  assign write_data = (memToReg == 1) ? read_data_mem : result;
  
 register_file r2(delayed_clock, reg_write, read_reg_1, read_reg_2, write_reg, write_data, read_data_1, read_data_2);
 
  
endmodule
