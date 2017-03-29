module Booth(
	input [15:0] a,
	input [15:0] b,
	input en,
	input clk,
	input rst,
	output [31:0] res,
	output ack);

	parameter IDLE = 2'b00;
	parameter COMPUTE = 2'b01;
	parameter DONE = 2'b10;

	reg [1:0] cur_state;
	reg [1:0] nxt_state;

	reg [31:0] res_r, res_w;

	reg [32:0] tmp_res_r, tmp_res_w;
	reg [15:0] a_r, b_r;
	reg [15:0] a_w, b_w;

	reg [4:0] cnt_r, cnt_w;


	always@(posedge clk or posedge rst) begin
		if(rst) begin
			cur_state <= 2'd0;
			a_r <= 16'd0;
			b_r <= 16'd0;
			res_r <= 32'd0;
			cnt_r <= 5'd0;
			tmp_res_r <= 33'd0;
		end
		else begin
			cur_state <= nxt_state;
			a_r <= a_w;
			b_r <= b_w;
			res_r <= res_w;
			cnt_r <= cnt_w;
			tmp_res_r <= tmp_res_w;
		end
	end

	always@(*)begin
		if(en) begin
			a_w = a;
			b_w = b;
		end
		else begin
			a_w = a_r;
			b_w = b_r;
		end
	end

	reg compute_done;

	always@(*)begin
		if(cur_state == COMPUTE) begin
			if(cnt_r < 5'd16) begin
				cnt_w = cnt_r + 5'd1;
				compute_done = 1'b0;
			end
			else begin
				cnt_w = 5'd0;
				compute_done = 1'b1;
			end
		end
		else begin
			cnt_w = cnt_r;
			compute_done = 1'b0;
		end
	end

	wire [1:0] cond;
	assign cond = {tmp_res_r[1:0]};

	wire [15:0] b_2comp;
	assign b_2comp = ~b_r + 16'd1;
	reg [15:0] temp_sum;

	always@(*)begin
		if(cur_state == COMPUTE) begin
		 	if(cnt_r == 5'd0) begin
				tmp_res_w = {16'd0, a, 1'b0};
			end
			else begin
				case (cond) 
					2'b00: begin
						tmp_res_w = {tmp_res_r[32], tmp_res_r[32:1]};
					end
					2'b01: begin
						temp_sum = tmp_res_r[32:17] + b_r;
						tmp_res_w = {temp_sum[15], temp_sum, tmp_res_r[16:1]};
					end
					2'b10: begin
						temp_sum = tmp_res_r[32:17] + b_2comp;
						tmp_res_w = {temp_sum[15], temp_sum, tmp_res_r[16:1]};
					end
					2'b11: begin
						tmp_res_w = {tmp_res_r[32], tmp_res_r[32:1]};
					end
				endcase
			end
			res_w = tmp_res_w[32:1];
		end
		else begin
			tmp_res_w = tmp_res_r;
			res_w = res_r;
		end
	end

	assign ack = (cur_state == DONE) ? 1'b1 : 1'b0;

	always@(*)begin
		case (cur_state)
			IDLE: begin
				if(en) begin
					nxt_state = COMPUTE;
				end
				else begin
					nxt_state = IDLE;
				end
			end
			COMPUTE:begin
				if(compute_done) begin
					nxt_state = DONE;
				end
				else begin
					nxt_state = COMPUTE;
				end
			end
			DONE:begin
				nxt_state = IDLE;
			end
			default:begin
				nxt_state = IDLE;
			end
		endcase
	end





endmodule

