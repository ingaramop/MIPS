`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:16:15 10/30/2013
// Design Name:   Top
// Module Name:   C:/Users/Marta/Documents/Facultad Mauro/Arquitectura/Practico/Lab/UART/Prueba.v
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

module Prueba;

	// Inputs
	reg clock;
	reg reset;
	reg rx;

	// Outputs
	reg tx;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.clock(clock), 
		.reset(reset), 
		.rx(rx), 
		.tx(tx)
	);
	
	always
	#10 clock=~clock;
	
	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		rx = 0;
		tx=0;
		// Wait 100 ns for global reset to finish
		#1000;
      
		rx=1;
		
		#1000;
		
		rx=0;
		#1000;
		rx=1;
		
		#1000;
		rx=1;
		#1000;
		rx=1;
		#1000;
		rx=1;
		#1000;
		rx=1;
		#1000;
		rx=1;
		#1000;
		rx=0;
		#1000;
		rx=1;
		#1000;
		rx=1;
		
		// Add stimulus here

	end
      
endmodule

