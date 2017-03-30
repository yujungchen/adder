module RightShifter(
	input [15:0] in,
	input [3:0] offset,
	output [15:0] out);



	Mux16to1 m0(.in(in),
				.sel(offset),
				.out(out[0]));
	
	Mux16to1 m1(.in({1'b0, in[15:1]}),
				.sel(offset),
				.out(out[1]));

	Mux16to1 m2(.in({2'b0, in[15:2]}),
				.sel(offset),
				.out(out[2]));

	Mux16to1 m3(.in({3'b0, in[15:3]}),
				.sel(offset),
				.out(out[3]));

	Mux16to1 m4(.in({4'b0, in[15:4]}),
				.sel(offset),
				.out(out[4]));

	Mux16to1 m5(.in({5'b0, in[15:5]}),
				.sel(offset),
				.out(out[5]));

	Mux16to1 m6(.in({6'b0, in[15:6]}),
				.sel(offset),
				.out(out[6]));

	Mux16to1 m7(.in({7'b0, in[15:7]}),
				.sel(offset),
				.out(out[7]));

	Mux16to1 m8(.in({8'b0, in[15:8]}),
				.sel(offset),
				.out(out[8]));

	Mux16to1 m9(.in({9'b0, in[15:9]}),
				.sel(offset),
				.out(out[9]));

	Mux16to1 m10(.in({10'b0, in[15:10]}),
				.sel(offset),
				.out(out[10]));

	Mux16to1 m11(.in({11'b0, in[15:11]}),
				.sel(offset),
				.out(out[11]));

	Mux16to1 m12(.in({12'b0, in[15:12]}),
				.sel(offset),
				.out(out[12]));

	Mux16to1 m13(.in({13'b0, in[15:13]}),
				.sel(offset),
				.out(out[13]));

	Mux16to1 m14(.in({14'b0, in[15:14]}),
				.sel(offset),
				.out(out[14]));

	Mux16to1 m15(.in({15'b0, in[15]}),
				.sel(offset),
				.out(out[15]));

endmodule
