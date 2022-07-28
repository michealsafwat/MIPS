module datapath (input clk, reset,
input jump,alu_src,reg_write,mem_to_reg ,pcsrc,regDest,
input [2:0] ALU_Control,
input [31:0] instr,readdata,
output  zero,
output  [31:0] pc,aluout, writedata
);
wire [27:0]sh_left_out;
wire [4:0] writereg;
wire [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
wire [31:0] signimm, signimmsh;
wire [31:0] srca, srcb;
wire [31:0] result;
// next PC logic
PC pcreg(.clk(clk),
         .rst(reset),
         .PC_IN(pcnext),
         .PC_OUT(pc));

         
PC_ADDER pcadd1 (.PC_OUT(pc),
                 .PC_IN(pcplus4));


sh_left32 immsh(.in32(signimm),
              .out32(signimmsh));


adder pcadd2(.a(pcplus4),
             .b(signimmsh),
             .sum(pcbranch));


mux_32_2_1 pcbrmux(.in1(pcplus4),
                   .in2(pcbranch),
                   .select(pcsrc),
                   .out(pcnextbr));


sh_left sh_left_inst(.x(instr[25:0]),
                     .y(sh_left_out));


mux_32_2_1 pcmux(.in1(pcnextbr),
                 .in2({pcplus4[31:28],sh_left_out}),
                 .select(jump),
                 .out(pcnext));
// register file logic
reg_file rf(.clk(clk),
            .WE3(reg_write), 
            .A1(instr[25:21]),
            .A2(instr[20:16]),
            .A3(writereg),
            .WD3(result),
            .RD1(srca),
            .RD2(writedata),
            .rst(reset));


mux_5_2_1 wrmux(.in1(instr[20:16]),
                .in2(instr[15:11]),
                .select(regDest),
                .out(writereg));


mux_32_2_1 resmux(.in1(aluout),
                 .in2(readdata),
                 .select(mem_to_reg),
                 .out(result));


Sign_Extend se(.Inst(instr[15:0]),
               .SignImm(signimm));
             
// ALU logic
mux_32_2_1 srcbmux(.in1(writedata),
                   .in2(signimm),
                   .select(alu_src),
                   .out(srcb));

ALU alu(.SrcA(srca),
        .SrcB(srcb),
        .ALUControl(ALU_Control),
        .ALUResult(aluout),
        .ZERO(zero));
endmodule