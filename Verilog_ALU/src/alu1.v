`timescale 1ns / 1ps
module Full_adder(a,b,cin,s,c);
input a,b,cin; 
output s,c; 
xor(s,a,b,cin);
assign c=((a&b)|(b&cin)|(cin&a));
endmodule

module full_adder_ins(i,j,o);
input [3:0]i,j;
wire [3:0]s,c;
output [4:0]o;
Full_adder fa0(.a(i[0]),.b(j[0]),.cin(1'b0),.s(s[0]),.c(c[0]));
Full_adder fa1(.a(i[1]),.b(j[1]),.cin(c[0]),.s(s[1]),.c(c[1]));
Full_adder fa2(.a(i[2]),.b(j[2]),.cin(c[1]),.s(s[2]),.c(c[2]));
Full_adder fa3(.a(i[3]),.b(j[3]),.cin(c[2]),.s(s[3]),.c(c[3]));
assign o={c[3],s};
endmodule

module full_subtractor(a,b,cin,d,bo);
input a,b,cin;
output bo,d;
xor(d,a,b,cin);
assign bo=((~a&b)|(~a&cin)|(cin&b));
endmodule

module fs1(i,j,d,b);
input [3:0]i,j;
output [3:0]b,d;
full_subtractor gf0(.a(i[0]),.b(j[0]),.cin(1'b0),.d(d[0]),.bo(b[0]));
full_subtractor gf1(.a(i[1]),.b(j[1]),.cin(b[0]),.d(d[1]),.bo(b[1]));
full_subtractor gf2(.a(i[2]),.b(j[2]),.cin(b[1]),.d(d[2]),.bo(b[2]));
full_subtractor gf3(.a(i[3]),.b(j[3]),.cin(b[2]),.d(d[3]),.bo(b[3]));
endmodule

module and_gate(a,b,c);
input a,b;
output c;
assign c=a&b;
endmodule

module afe(i,j,o);
input [3:0]i,j;
output [3:0]o;
and_gate af1(.a(i[0]),.b(j[0]),.c(o[0]));
and_gate af2(.a(i[1]),.b(j[1]),.c(o[1]));
and_gate af3(.a(i[2]),.b(j[2]),.c(o[2]));
and_gate af4(.a(i[3]),.b(j[3]),.c(o[3]));
endmodule

module or_gate(a,b,c);
input a,b;
output c;
assign c =a|b;
endmodule

module afo(i,j,o);
input [3:0]i,j;
output [3:0]o;
or_gate ao0(.a(i[0]),.b(j[0]),.c(o[0]));
or_gate ao1(.a(i[1]),.b(j[1]),.c(o[1]));
or_gate ao2(.a(i[2]),.b(j[2]),.c(o[2]));
or_gate ao3(.a(i[3]),.b(j[3]),.c(o[3]));
endmodule

module not_gate(a,b);
input a;
output b;
assign b=~a;
endmodule 

module an(i,o);
input [3:0]i;
output [3:0]o;
not_gate n0(.a(i[0]),.b(o[0]));
not_gate n1(.a(i[1]),.b(o[1]));
not_gate n2(.a(i[2]),.b(o[2]));
not_gate n3(.a(i[3]),.b(o[3]));
endmodule
module mul(i,j,sel,out);
input[3:0]i,j;
input [2:0]sel;
output reg[4:0]out;
wire [4:0]s;
wire [3:0]di,bo;
wire[3:0]and_out,or_out,not_out;
full_adder_ins adder(i,j,s);
fs1 sub(i,j,di,bo);
afe and_op(i,j,and_out);
afo or_op(i,j,or_out);
an not_op(i,not_out);
always@(*)
begin
case(sel)
    3'b000: out=s;
    3'b001: out={bo[3],di};
    3'b010: out={1'b0,and_out};
    3'b011: out={1'b0,or_out};
    3'b100: out={1'b0,not_out};
    default: out=5'b00000;
    endcase
    end
    endmodule