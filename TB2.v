
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
    $monitor("time:%d At clock = %d, i = %d, r1 = %d r2 = %d, r3 = %d", $time, clock, d1.i, d1.r2.registers[1], d1.r2.registers[2], d1.r2.registers[3]);
   	
    reset = 1; i = 0; pc = 0; #90;
    reset = 0; i = 0; #90;
    i = 1; #90;
    
    while (d1.r2.registers[1] < d1.r2.registers[2]) begin
      
     i = 2; #90;
     i = 3; #90;
      
    end
    

    $finish;
    
  end
endmodule
