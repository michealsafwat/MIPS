module controller (input [5:0] op, funct,
                   input zero,
                   output memtoreg, memwrite,pcsrc, alusrc, regdst, regwrite,jump, 
                   output [2:0] alucontrol);
////////
wire [1:0] aluop;
wire branch;
////////////
control main_decoder (.opcode(op),
                      .mem_to_reg(memtoreg),
                      .mem_write(memwrite),
                      .branch(branch),
                      .alu_src(alusrc),
                      .regDest(regdst),
                      .reg_write(regwrite),
                      .jump(jump),
                      .alu_op(aluop));

////////////                      
ALUControl alu_decoder (.Function(funct),
                        .ALUOp(aluop),
                        .ALU_Control(alucontrol));
assign pcsrc = branch & zero;
endmodule