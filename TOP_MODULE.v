module TOP_MODULE (input clk, reset,
output [15:0] test);
wire [31:0] pc, instr, readdata;
wire [31:0]writedata,dataadr;
wire memwrite;
// instantiate processor and memories
mips mips (.clk(clk),
           .reset(reset),
           .pc(pc),
           .instr(instr),
           .mem_write(memwrite),
           .aluout(dataadr),
           .writedata(writedata),
           .readdata(readdata));
inst_mem imem (.PC_OUT(pc),
               .Instr(instr));
data_mem dmem (.clk(clk),
               .WE(memwrite),
               .A(dataadr),
               .WD(writedata),
               .RD(readdata),
               .test(test));
endmodule               