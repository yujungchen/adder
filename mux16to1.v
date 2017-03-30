module Mux16to1(
	input [15:0] in,
	input [3:0] sel,
	output out);

	reg sel_o;
	assign out = sel_o;

	always@(*) begin
		case (sel)
			5'd0:begin
				sel_o = in[0];
				end
			5'd1:begin
				sel_o = in[1];
				end
			5'd2:begin
				sel_o = in[2];
				end
			5'd3:begin
				sel_o = in[3];
				end
			5'd4:begin
				sel_o = in[4];
				end
			5'd5:begin
				sel_o = in[5];
				end
			5'd6:begin
				sel_o = in[6];
				end
			5'd7:begin
				sel_o = in[7];
				end
			5'd8:begin
				sel_o = in[8];
				end
			5'd9:begin
				sel_o = in[9];
				end
			5'd10:begin
				sel_o = in[10];
				end
			5'd11:begin
				sel_o = in[11];
				end
			5'd12:begin
				sel_o = in[12];
				end
			5'd13:begin
				sel_o = in[13];
				end
			5'd14:begin
				sel_o = in[14];
				end
			5'd15:begin
				sel_o = in[15];
				end
		endcase
	end

endmodule