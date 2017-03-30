module BarrelShifter(
	input [15:0] in,
	input [3:0] offset,
	output [15:0] out);



	Mux16to1 m0(.in(in),
				.sel(offset),
				.out(out[0]));
	
	Mux16to1 m1(.in({in[0], in[15:1]}),
				.sel(offset),
				.out(out[1]));

	Mux16to1 m2(.in({in[1:0], in[15:2]}),
				.sel(offset),
				.out(out[2]));

	Mux16to1 m3(.in({in[2:0], in[15:3]}),
				.sel(offset),
				.out(out[3]));

	Mux16to1 m4(.in({in[3:0], in[15:4]}),
				.sel(offset),
				.out(out[4]));

	Mux16to1 m5(.in({in[4:0], in[15:5]}),
				.sel(offset),
				.out(out[5]));

	Mux16to1 m6(.in({in[5:0], in[15:6]}),
				.sel(offset),
				.out(out[6]));

	Mux16to1 m7(.in({in[6:0], in[15:7]}),
				.sel(offset),
				.out(out[7]));

	Mux16to1 m8(.in({in[7:0], in[15:8]}),
				.sel(offset),
				.out(out[8]));

	Mux16to1 m9(.in({in[8:0], in[15:9]}),
				.sel(offset),
				.out(out[9]));

	Mux16to1 m10(.in({in[9:0], in[15:10]}),
				.sel(offset),
				.out(out[10]));

	Mux16to1 m11(.in({in[10:0], in[15:11]}),
				.sel(offset),
				.out(out[11]));

	Mux16to1 m12(.in({in[11:0], in[15:12]}),
				.sel(offset),
				.out(out[12]));

	Mux16to1 m13(.in({in[12:0], in[15:13]}),
				.sel(offset),
				.out(out[13]));

	Mux16to1 m14(.in({in[13:0], in[15:14]}),
				.sel(offset),
				.out(out[14]));

	Mux16to1 m15(.in({in[14:0], in[15]}),
				.sel(offset),
				.out(out[15]));

endmodule
