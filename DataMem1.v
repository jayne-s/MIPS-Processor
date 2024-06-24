module data_memory(

  input clock,
  input memWrite,
  input memRead,
  input [23:0] address,
  output reg [23:0] read_data,
  input [23:0] write_data

);
  
  
  integer i;
  reg [23:0] ram [0:2047];
  wire [11:0] ram_addr = address[11:0];
  
  
  initial begin  
      
        ram[16] = 20;
   
        ram[32] = 22;
	  
  end  
  
