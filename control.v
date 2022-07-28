
 module control( input[5:0] opcode,
                  output reg[1:0] alu_op,  
                  output reg  jump,branch,mem_write,alu_src,reg_write,mem_to_reg ,regDest  );  
 always @(*)  
 begin  
     
      case(opcode)   
      6'b100011: begin // LW
                regDest = 1'b0;  
                mem_to_reg = 1'b1;  
                alu_op = 2'b00;  
                jump = 1'b0;  
                branch = 1'b0;   
                mem_write = 1'b0;  
                alu_src = 1'b1;  
                reg_write = 1'b1;  
                
                end  
        6'b101011: begin // Sw  
                regDest = 1'b0;  
                mem_to_reg = 1'b1;  
                alu_op = 2'b00;  
                jump = 1'b0;  
                branch = 1'b0;   
                mem_write = 1'b1;  
                alu_src = 1'b1;  
                reg_write = 1'b0;  
                
                end  
        6'b000000: begin // R_Type
                regDest = 1'b1;  
                mem_to_reg = 1'b0;  
                alu_op = 2'b10;  
                jump = 1'b0;  
                branch = 1'b0;   
                mem_write = 1'b0;  
                alu_src = 1'b0;  
                reg_write = 1'b1;  
                
                end  
         6'b001000: begin // ADDImm
                regDest = 1'b0;  
                mem_to_reg = 1'b0;  
                alu_op = 2'b00;  
                jump = 1'b0;  
                branch = 1'b0;   
                mem_write = 1'b0;  
                alu_src = 1'b1;  
                reg_write = 1'b1;  
                
                end  
        6'b000100: begin // BEQ
                regDest = 1'b0;  
                mem_to_reg = 1'b0;  
                alu_op = 2'b01;  
                jump = 1'b0;  
                branch = 1'b1;   
                mem_write = 1'b0;  
                alu_src = 1'b0;  
                reg_write = 1'b0;  
                
                end  
        6'b000010: begin // JUMPINST
                regDest = 1'b0;  
                mem_to_reg = 1'b0;  
                alu_op = 2'b00;  
                jump = 1'b1;  
                branch = 1'b0;   
                mem_write = 1'b0;  
                alu_src = 1'b0;  
                reg_write = 1'b0;  
                
                end  
   
      default:   begin 
                regDest = 1'b0;  
                mem_to_reg = 1'b0;  
                alu_op = 2'b00;  
                jump = 1'b0;  
                branch = 1'b0;   
                mem_write = 1'b0;  
                alu_src = 1'b0;  
                reg_write = 1'b0;  
                
                end  
      endcase  
      end  
 endmodule  