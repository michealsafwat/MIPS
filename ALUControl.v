 module ALUControl(
     output reg [2:0] ALU_Control,  
     input [1:0] ALUOp,  
     input [5:0] Function  );  
 
/* wire [7:0] ALUControlIn;  
 assign ALUControlIn = {ALUOp,Function};  
 always @(ALUControlIn)  
 casex (ALUControlIn)  
  8'b00xxxxxx: ALU_Control=3'b010;  
  8'b01xxxxxx: ALU_Control=3'b100;  
  8'b10100000: ALU_Control=3'b010;  
  8'b10100010: ALU_Control=3'b100;  
  8'b10101010: ALU_Control=3'b110;  
  8'b10011100: ALU_Control=3'b101;   
  default: ALU_Control=3'b010;  
  endcase  
 */

always @(*) begin
  case (ALUOp)
    2'b00: ALU_Control=3'b010; 
    2'b01: ALU_Control=3'b100;
    2'b10: begin
    case (Function)
    6'b100000: ALU_Control=3'b010;
    6'b100010: ALU_Control=3'b100; 
    6'b101010: ALU_Control=3'b110;
    6'b011100: ALU_Control=3'b101;  
    default:   ALU_Control=3'b010; 
    endcase 
    end
    default:   ALU_Control=3'b010;  
  endcase
  
end


endmodule