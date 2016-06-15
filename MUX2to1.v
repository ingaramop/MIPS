`timescale 1ns / 1ps

module mux2to1(	input [9:0]A, //Se activa cuando sel es 0
						input [9:0]B, //Se activa cuando sel es 1
						input sel,
						output [9:0]out
					);

assign out = (sel) ? B : A;

endmodule
