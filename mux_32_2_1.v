module mux_32_2_1(
// define input  port
input  [31:0]in1,
input [31:0]in2, 
input select,
// define the output port
output  [31:0]out
);
// assign one of the inputs to the output based upon select line input
assign out = (select==1'b1) ? in2 : in1;
endmodule 