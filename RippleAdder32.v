module Ripple32Adder(
	input [31:0] a,
	input [31:0] b, 
	input carry_i,
	output [31:0] sum,
	output carry_o);

	wire [32:0] TmpCarry;
	assign TmpCarry[0] = carry_i;


generate
	genvar i; 
		for(i = 0 ; i < 32 ; i = i + 1) begin:RA32
			FA AddBit(.a(a[i]), 
					  .b(b[i]), 
					  .carry_i(TmpCarry[i]), 
					  .sum(sum[i]),
					  .carry_o(TmpCarry[i + 1])
                      );
		end
endgenerate

	assign carry_o = TmpCarry[32];


endmodule