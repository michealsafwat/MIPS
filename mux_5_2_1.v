module mux_5_2_1(
// define input  port
input  [4:0]in1,
input [4:0]in2, 
input select,
// define the output port
output  [4:0]out
);
// assign one of the inputs to the output based upon select line input
assign out = (select==1'b1) ? in2 : in1;
endmodule 