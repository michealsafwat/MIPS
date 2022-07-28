module inst_mem(

input [31:0] PC_OUT,
output [31:0] Instr
);

reg [31:0] mem[0:99];

initial begin
$readmemh("Program 3_Machine Code.txt",mem);
end

assign Instr = mem[PC_OUT>>2];

endmodule