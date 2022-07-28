module mips (input clk, reset,
input [31:0] instr,
input [31:0] readdata,
output [31:0] pc,
output  mem_write,
output  [31:0] aluout, writedata
);
wire memtoreg, branch,alusrc, regdst, regwrite, jump,zero;
wire [2:0] alucontrol;
wire pcsrc1;
///////////
controller c(.op(instr[31:26]),
             .funct(instr[5:0]),
             .zero(zero),
             .memtoreg(memtoreg),
             .memwrite(mem_write),
             .pcsrc(pcsrc1),
             .alusrc(alusrc),
             .regdst(regdst),
             .regwrite(regwrite),
             .jump(jump),
             .alucontrol(alucontrol));

datapath dp(.clk(clk),
            .reset(reset),
            .mem_to_reg(memtoreg),
            .pcsrc(pcsrc1),
            .alu_src(alusrc),
            .regDest(regdst),
            .reg_write(regwrite),
            .jump(jump),
            .ALU_Control(alucontrol),
            .zero(zero),
            .pc(pc),
            .instr(instr),
            .aluout(aluout),
            .writedata(writedata),
            .readdata(readdata));
endmodule