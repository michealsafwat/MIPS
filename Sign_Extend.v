module Sign_Extend(

input [15:0] Inst,
output reg [31:0] SignImm
    
);

always @(Inst) begin

    if(Inst[15]==1)
         SignImm<= {16'hFFFF,Inst};
    else
         SignImm<= {16'h0000,Inst};
    
end

endmodule