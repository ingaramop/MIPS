`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:04:38 06/01/2016
// Design Name:   Top
// Module Name:   C:/Users/Tincho/Xilinx/UART/Testbench_1.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Testbench_1;

	// Inputs
	reg clock;
	reg reset;
	reg rx;

	// Outputs
	wire tx;
	wire [7:0] led;
	wire dataSent;
	wire analiza;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.clock(clock), 
		.reset(reset), 
		.rx(rx), 
		.tx(tx), 
		.led(led), 
		.dataSent(dataSent), 
		.analiza(analiza)
	);
	
	localparam T = 100;

	initial begin
		// Initialize Inputs
		reset = 1;
		rx = 1;
		// Wait 100 ns for global reset to finish
		#(T*5);
		reset = 0;
		
//		rx = 0; //Bit de start
//		#(T*15);
//		rx = 1; //Primer bit
//		#(T*15);
//		rx = 0;
//		#(T*15);
//		rx = 0;
//		#(T*15);
//		rx = 1;
//		#(T*15);
//		rx = 0;
//		#(T*15);
//		rx = 0;
//		#(T*15);
//		rx = 1; //Ultimo bit
//		#(T*15);
//		rx = 1; //Pongo Rx a 1 para que no siga recibiendo
//		#(T*15);

	end
	
	initial begin
		clock = 0;
		forever #(T) clock = !clock;
	end
	
	initial begin
		rx = 0;
		forever #(T*15) rx = !rx;
	end
      
endmodule

