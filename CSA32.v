module Adder32(
	input [31:0] a,
	input [31:0] b, 
	input [31:0] c, 
	output [32:0] sum);


	wire [31:0] TmpSum;
	wire [31:0] TmpCarry;

	
generate
	genvar i; 
		for(i = 0 ; i < 32 ; i = i + 1) begin:CSA32
			FA AddBit(.a(a[i]), 
					  .b(b[i]), 
					  .carry_i(c[i]), 
					  .sum(TmpSum[i]),
					  .carry_o(TmpCarry[i])
                      );
		end
endgenerate


	wire [32:0] p2_Carry;
	wire [32:0] p2_Sum;
	wire [33:0] p2_Carry_w;

	assign p2_Sum = {1'b0, TmpSum};
	assign p2_Carry = {TmpCarry, 1'b0};
	assign p2_Carry_w[0] = 1'b0;

generate
	genvar j; 
		for(j = 0 ; j < 33 ; j = j + 1) begin:RA33
			FA AddBit(.a(p2_Sum[j]), 
					  .b(p2_Carry[j]), 
					  .carry_i(p2_Carry_w[j]), 
					  .sum(sum[j]),
					  .carry_o(p2_Carry_w[j + 1])
                      );
		end
endgenerate






endmodule