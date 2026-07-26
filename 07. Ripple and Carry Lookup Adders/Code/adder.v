module full_adder
	(
	input a, 
	input b, 
	input cin,
	output sum, 
	output cout
	);
		wire S1;
		wire carry1;
		wire carry2;

		half_adder first(
			.a(a),
			.b(b),
			.sum(S1),
			.cout(carry1));

		half_adder second(
			.a(S1),
			.b(cin),
			.sum(sum),
			.cout(carry2));
			
		assign cout=carry1|carry2;

endmodule
		