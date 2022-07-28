module PC(

input  [31:0] PC_IN,
input clk,
input rst,
output reg [31:0] PC_OUT

);

always @(posedge clk , negedge rst) begin
    
    if (rst==0)
        PC_OUT<=32'b0;
    else
        PC_OUT<=PC_IN;
end

endmodule