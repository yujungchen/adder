`timescale 1ns/1ns
`define CYCLE 10

module TopModule();

	// System Signal
	reg m_rst;
	reg m_clk;

	// Create Clock
	always begin 
		#(`CYCLE/2) m_clk <= ~m_clk; 
	end

	// Test 1 bit full adder
	reg m_a;
	reg m_b;
	reg m_cin;
	wire m_sum;
	wire m_cout;
	FA BitAdder(.a(m_a), .b(m_b), .carry_i(m_cin), .sum(m_sum), .carry_o(m_cout));

	// Test 32 bit ripple carry adder
	reg [31:0] m_a32;
	reg [31:0] m_b32;
	reg m_cin32;
	wire [31:0] m_sum32;
	wire m_cout32;
	Ripple32Adder Rip32(.a(m_a32), .b(m_b32), .carry_i(m_cin32), .sum(m_sum32), .carry_o(m_cout32));	


	// Test 3:2 CSA
	reg [31:0] m_i;
	reg [31:0] m_j;
	reg [31:0] m_k;
	
	wire [32:0] m_sum32csa;
	
	Adder32 CSA32(.a(m_i), .b(m_j), .c(m_k), .sum(m_sum32csa));

	// Test Booth
	reg [15:0] mul_i;
	reg [15:0] mul_j;
	wire [31:0] mul_res;
	reg mul_en;
	wire mul_ack;
	Booth booth_mul(
		.a(mul_i),
		.b(mul_j),
		.en(mul_en),
		.clk(m_clk),
		.rst(m_rst),
		.res(mul_res),
		.ack(mul_ack));




	// Fire
	initial begin
		$dumpfile("signal.vcd");
		$dumpvars(0, TopModule);

		m_clk = 1'b0;
		m_rst = 1'b1;
		m_a = 1'b0;
		m_b = 1'b0;
		m_cin = 1'b0;

		// RippleAdder Input
		m_a32 = 32'b0;
		m_b32 = 32'b0;
		m_cin32 = 1'b0;

		// CSA32 Input
		m_i = 32'b0;
		m_j = 32'b0;
		m_k = 32'b0;

		// Booth Input
		mul_i = 16'd0;
		mul_j = 16'd0;
		mul_en = 1'b0;
		



		#(`CYCLE)	m_rst = 1'b0;

		#(`CYCLE) m_a = 1'b1;
		#(`CYCLE) m_b = 1'b1;

		#(`CYCLE) m_a32 = 32'd100;
		#(`CYCLE) m_b32 = 32'd59;
		#(`CYCLE) m_cin32 = 1'b1;

		#(`CYCLE) m_i = 32'd10;
		#(`CYCLE) m_j = 32'd123;
		#(`CYCLE) m_k = 32'd5555;

		#(`CYCLE) mul_i = 16'd2;
				  mul_j = -16'd5;
				  mul_en = 1'b1;
		#(`CYCLE) mul_en = 1'b0;

		
		#500 $finish;
	end



endmodule
