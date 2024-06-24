
module main;
  reg clock, reset;
  reg[1:0] i;
  
  reg [11:0] pc;
  
  datapath d1(i, clock, reset, pc);
 
  initial clock = 0;
  
  always begin
    clock = ~clock; #45;
  end
  
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $monitor("time:%d At clock = %d, i = %d, r1 = %d r2 = %d, r3 = %d, write_data = %d, reg_write = %d, write_reg = %d, read_reg_1 = %d, read_reg_2 = %d, mem = %d", $time, clock, d1.i, d1.r2.registers[1], d1.r2.registers[2], d1.r2.registers[3], d1.r2.write_data, d1.r2.reg_write, d1.r2.write_reg, d1.r2.read_reg_1, d1.r2.read_reg_2, d1.m1.ram[48]);
   	
    reset = 1; i = 0; pc = 0; #90;
    reset = 0; i = 0; #90;
    
 
    reset = 0; i = 1; #90;
    

    reset = 0; i = 2; #90;
    

    reset = 0; i = 3; #90;
    
  
    
    #810;
    $finish;
    
  end
endmodule
