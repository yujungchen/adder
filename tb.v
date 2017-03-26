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


	// Fire
	initial begin
		$dumpfile("signal.vcd");
		$dumpvars(0, TopModule);

		m_clk = 1'b0;
		m_rst = 1'b1;
		
		#(`CYCLE)	m_rst = 1'b0;
		
		#150 $finish;
	end



endmodule