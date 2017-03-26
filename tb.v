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


	// Fire
	initial begin
		$dumpfile("signal.vcd");
		$dumpvars(0, TopModule);

		m_clk = 1'b0;
		m_rst = 1'b1;
		m_a = 1'b0;
		m_b = 1'b0;
		m_cin = 1'b0;
		
		#(`CYCLE)	m_rst = 1'b0;

		#(`CYCLE) m_a = 1'b1;
		#(`CYCLE) m_b = 1'b1;

		
		#500 $finish;
	end



endmodule