module ALU (

input [31:0] SrcA,          // Source A
input [31:0] SrcB,          // Source B
input [2:0] ALUControl,     // function select
output reg [31:0] ALUResult,    // ALU output result
output reg ZERO                 // signal that gives 1 if the output result is zero
);

always @(*) begin
    case (ALUControl)
    0:  //AND
        ALUResult<=SrcA & SrcB;
    1:  //OR
        ALUResult<=SrcA | SrcB;
    2:  // ADD
        ALUResult<=SrcA + SrcB;
    4:  // SUBTRACT
        ALUResult<=SrcA - SrcB;
    5:  // MULTIPLY
        ALUResult<=SrcA * SrcB;
    6:  // SET LESS THAN (SLT)
        
        ALUResult<=SrcA < SrcB ? 1:0;

    default:
         ALUResult<=32'd0;
    endcase
 end

always @(*) begin
    if(ALUResult==0)
        ZERO=1;
    else
        ZERO=0;
    
end

endmodule

