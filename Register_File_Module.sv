
module regFile(
		
  		clock,
		  read_reg_1,	// reg to read from
  		read_reg_2,	// reg to read from
  		write_reg,	// reg to write at
  		reg_write, 	// decides whether to write
  		write_data,	// data to write
  		read_data_1,// data that has been read
  		read_data_2 // data that has been read

);
  
  input [1:0] read_reg_1, read_reg_2, write_reg;
  input [23:0] write_data;
  input clock, reg_write;
  output reg [23:0] read_data_1, read_data_2;
  
  reg [3:0] registers [23:0];
  
  initial begin
      
    registers[0] <= 0;
    registers[1] <= 0;
    registers[2] <= 0;
    registers[3] <= 0;
      
      
  end
  

  always @(posedge clock) begin
    
    if(reg_write == 1)
      
      begin
        
        registers[write_reg] <= write_data;
        
      end
    
  end
  
  always @(negedge clock) begin
    
    read_data_1 <= registers[read_reg_1];
    read_data_2 <= registers[read_reg_2];
    
  end
  
  
  
  
endmodule
