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


  always @(posedge clock) begin
    
    if (memWrite) begin
      
      ram[ram_addr] <= write_data;
      
    end
  
  end
  

   
  	assign read_data = ram[ram_addr];
     
  
endmodule

