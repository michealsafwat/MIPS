module PC_ADDER(

input [31:0] PC_OUT,
output [31:0] PC_IN
);


 assign PC_IN=32'd4 + PC_OUT;
    


endmodule