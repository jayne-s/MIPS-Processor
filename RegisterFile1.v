module register_file(
	input clock, 
  	input reg_write, 
  input [1:0] read_reg_1,
  input [1:0] read_reg_2,
  input [1:0] write_reg,
  input [23:0] write_data,
  output reg [23:0] read_data_1,
  output reg [23:0] read_data_2

);
  
  reg [23:0] registers [3:0];
  
  
  always @(negedge clock) begin
    
    if(reg_write)
      registers[write_reg] <= write_data;
    
  end

  
  always @(posedge clock) begin
    if ( read_reg_1 )
      read_data_1 <= registers[read_reg_1];
    else 
      read_data_1 <= 0 ;
    if( read_reg_2 )
      read_data_2 <= registers[read_reg_2];
    else
      read_data_2 <= 0 ;   
  end
  
endmodule
