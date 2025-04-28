module tff(t,clk,qn,qnbar);
input t,clk;
output reg qn=0;
output qnbar;
always@(posedge clk) begin
case({t})
1'b0:qn<=qn;
1'b1:qn<=~qn;
endcase
end
assign qnbar=~qn;
endmodule


module prime(clk,qn,qnbar);
input clk;
output [4:1]qn;
output [4:1]qnbar;
assign qnbar=~qn;
wire t4,t3,t2,t1;
assign t4=(qn[2]&qn[1]&qnbar[4]&qn[3])|(qn[4]&qn[3]&qnbar[2]&qn[1]);
assign t3=(qnbar[4]&qn[2]&qn[1])|(qnbar[2]&qn[1]&qn[3]&qn[4])|(qn[2]&qn[1]&qn[4]&qnbar[3]);
assign t2=(qn[3]&qnbar[2]&qn[1])|(qn[4]&qnbar[3]&qn[2]&qn[1])|(qnbar[4]&qnbar[3]&qn[2]&qn[1]);
assign t1=(qnbar[4]&qnbar[3]&qn[2]&qnbar[1])|(qn[4]&qn[3]&qn[1]&qnbar[2]);
tff tff4(t4,clk,qn[4],qnbar[4]);
tff tff3(t3,clk,qn[3],qnbar[3]);
tff tff2(t2,clk,qn[2],qnbar[2]);
tff tff1(t1,clk,qn[1],qnbar[1]);

endmodule