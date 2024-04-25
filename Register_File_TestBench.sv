
module main;
  
  reg clock, regWrite;
  reg [23:0] writeData;
  reg [1:0] readReg1, readReg2, writeReg;
  wire [23:0] readData1, readData2;
    
  regFile reg0 (clock, readReg1, readReg2, writeReg, regWrite, writeData, readData1, readData2);
  
  initial clock = 0;
  
  always begin
      
   	 clock = ~clock;   #30;
      
  end

  initial begin
      
    $monitor("At clock = %d, readReg1 = %d, readReg2 = %d, writeReg = %d, regWrite = %d, writeData = %d, readData1 = %d, readData2 = %d,", clock, readReg1, readReg2, writeReg, regWrite, writeData, readData1, readData2);
    
    regWrite = 1; writeReg=2; writeData = 5; #45;
    regWrite = 1; writeReg=3; writeData = 4; #45;
    readReg1 = 2; #45;
    readReg2 = 3; #45;
    $finish;
      
	end

  
endmodule
