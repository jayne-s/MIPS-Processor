

module control(clock, reset, op, state, alu_src_a, imem_read,reg_write, iord, ir_write, mem_write, alu_src_b, alu_op, reg_dst, pc_write, pc_source, mem_read, mem_to_reg, pc_write_cond, next_state);
  
`include "parameters.v"
  
  
  input clock; input reset; input[4:0] op; 
  input [3:0] state; output reg alu_src_a; 
  output reg imem_read; output reg reg_write;    output reg iord; output reg [3:0] next_state;
  output reg ir_write; output reg mem_write; 
  output reg [1:0] alu_src_b; output reg alu_op; 
  output reg reg_dst; output reg pc_write; 
  output reg pc_source; output reg mem_read; 
  output reg mem_to_reg; output reg pc_write_cond; 
  
  always @(posedge clock)
    
    begin
      
      if(reset)
        
        next_state <= INSTR_FETCH;
      
      else 
    
       next_state <= state;
      
    end
  
  
  always @(state)  
    
    begin
      
      case (state)
        
        INSTR_FETCH:
        
        begin
        	alu_src_a <= 0;
        	imem_read <= 1;
        	iord <= 0;
        	ir_write <= 1;
        	alu_src_b <= 1;
        	alu_op <= 0;
        	pc_write <= 1;
        	pc_source <= 0;
        	next_state <= INSTR_DECODE;
        end
        
        
        INSTR_DECODE:
          
        begin
        	alu_src_a <= 0;
        	alu_src_b <= 3;
        	alu_op <= 0;
        	if(op == LW || op == SW || op == ADDI)
				next_state <= MEM_ADDR_COMPUTE;
        	else if(op == ADD)
        		next_state <= EXECUTION;
        	else if(op == BEQ)
          		next_state <= BRANCH_COMP;
       		else if (op == B)
          		next_state <= JUMP_COMP;
        end
        
        MEM_ADDR_COMPUTE:
          
        begin
        	alu_src_a <= 1;
        	alu_src_b <= 2;
          	alu_op <= 0;
          	if(op == LW)
            	next_state <= MEM_ACCESS_LW;
         	else if (op == SW)
           	 	next_state <= MEM_ACCESS_SW;
          	else if (op == ADDI)
            	next_state <= MEM_ACCESS_ADDI;
        end
        
        MEM_ACCESS_LW:
          
        begin
          	mem_read <= 1;
          	iord <= 1;
            next_state <= WRITE_BACK;
        end
        
        MEM_ACCESS_SW: 
          
        begin
            mem_write <= 1;
            iord <= 1;
            next_state <= INSTR_FETCH;
        end
        
        MEM_ACCESS_ADDI:
        
        begin
            reg_dst <= 0;
          	reg_write <= 1;
          	mem_to_reg <= 0;
            next_state <= INSTR_FETCH; 
        end
        
        EXECUTION:
          
        begin
            alu_src_a <= 1;
            alu_src_b <= 0;
            alu_op <= 0;
            next_state <= R_TYPE_COMP;
        end
        
        R_TYPE_COMP:
          
        begin
          	reg_dst <= 1;
          	reg_write <= 1;
            mem_to_reg <= 0;
          	next_state <= INSTR_FETCH;
        end
        
        BRANCH_COMP:
          
        begin
            alu_src_a <= 1;
          	alu_src_b <= 0;
          	alu_op <= 1;
            pc_write_cond <= 1;
            next_state <= INSTR_FETCH;	
        end
        
        JUMP_COMP:
          
        begin
            pc_write <= 1;
          	pc_source <= 2;
            next_state <= INSTR_FETCH;
        end
          
        WRITE_BACK:
          
        begin
            reg_dst <= 0;
            reg_write <= 1;
            mem_to_reg <= 1;
            next_state <= INSTR_FETCH;
        end
          
        default: 
            next_state <= INSTR_FETCH;
      
      endcase
      
   end  
 
endmodule
