module sh_left(input [25:0] x,
output reg [27:0] y);
 
       reg [27:0]im;
       always @(*)
       begin
	   im = {2'b00,x};
       y=im<<2;
       end
	
 
endmodule