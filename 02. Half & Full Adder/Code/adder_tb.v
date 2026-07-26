`timescale 1ps/1ps
module tb;
reg a;
reg b;
reg c;

wire sum;
wire cout;

full_adder test(
	.a(a),
	.b(b),
	.cin(c),
	.sum(sum),
	.cout(cout));

initial begin
	$display("Time|a|b|cin|sum|cout");
	$monitor("%4t|%b|%b|%b|%b|%b",$time,a,b,c,sum,cout);
a=0;b=0;c=0;#10;
a=0;b=0;c=1;#10;
a=0;b=1;c=0;#10;
a=0;b=1;c=1;#10;
a=1;b=0;c=0;#10;
a=1;b=0;c=1;#10;
a=1;b=1;c=0;#10;
a=1;b=1;c=1;#10;

$finish;
end
endmodule
