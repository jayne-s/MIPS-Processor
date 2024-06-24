module ALU(input[23:0] regA, input[23:0] regB, output reg[23:0] result, input[2:0] select, input carry_in, output[2:0] flags);
 
parameter C_FLAG = 2;
parameter Z_FLAG = 1;
parameter N_FLAG = 0;
parameter ADD = 0;
parameter SUB = 1;
parameter SUB_R = 2;
parameter INC = 3; 
parameter AND = 4;
parameter OR = 5;
parameter XOR = 6;
parameter EQ = 7;
reg C, Z, N, beq_result;
  
  always @(*) 
    begin
      case (select)
        ADD: {C, result} <= regA + regB;
        SUB: {C, result} <= regA - regB;
       	SUB_R: {C, result} <= regB - regA;
        INC: {C, result} <= regA + 1;
        AND: {C, result} <= regA & regB;
        OR: {C, result} <= regA | regB;
        XOR: {C, result} <= regA ^ regB;
        EQ: {C, result} <= (regA != regB) ? 1 : 0;
        default: {C, result} <= regA + regB;
      endcase

      if(result == 0) 
         Z <= 1;
      else 
         Z <= 0;
  	  
  
      if(result[23] == 1) 
        begin
        N <= 1;
        end
  	  else 
       N <= 0;
  	  
  end
  
  assign flags[2] = C;
  assign flags[1] = Z;
  assign flags[0] = N;
  
endmodule
