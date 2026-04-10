`timescale 1ns / 1ps
module tb1;
reg [3:0]i,j;
reg[2:0]sel;
wire [4:0]out;
mul DUT1(i,j,sel,out);
initial 
begin
$monitor($time,"i=%b,j=%b,sel=%b out=%b,",i,j,sel,out);
 i=4'b1111;j=4'b1001;
sel=3'b000;
#5 sel=3'b001;
#5 sel=3'b010;
#5 sel=3'b011;
#5 sel=3'b100;
#5 sel=3'b000;
 i=4'b0111;j=4'b0001;
#5 sel=3'b001;
#5 sel=3'b010;
#5 sel=3'b011;
#5 sel=3'b100;
#5 sel=3'b000;
 i=4'b1000;j=4'b0011;
#5 sel=3'b001;
#5 sel=3'b010;
#5 sel=3'b011;
#5 sel=3'b100;
#5 sel=3'b000;
i=4'b1111;j=4'b1111;
#5 sel=3'b001;
#5 sel=3'b010;
#5 sel=3'b011;
#5 sel=3'b100;
#5 sel=3'b000;
i=4'b0110;j=4'b1111;
#5 sel=3'b001;
#5 sel=3'b010;
#5 sel=3'b011;
#5 sel=3'b100;
#5 $finish;
#5 $finish;
end
endmodule
