`timescale 1ns / 1ps

module muxUCHazard(input A, //Se activa cuando sel es 0
						 input B, //Se activa cuando sel es 1
						 input C,
						 input D,
						 input E,
						 input F,
						 input G,
						 input H,
						 input I,
						 input sel,
						 output outA,
						 output outB,
						 output outC,
						 output outD,
						 output outE,
						 output outF,
						 output outG,
						 output outH,
						 output outI
    );
assign outA = (sel) ? A : 1'b0;
assign outB = (sel) ? B : 1'b0;
assign outC = (sel) ? C : 1'b0;
assign outD = (sel) ? D : 1'b0;
assign outE = (sel) ? E : 1'b0;
assign outF = (sel) ? F : 1'b0;
assign outG = (sel) ? G : 1'b0;
assign outH = (sel) ? H : 1'b0;
assign outI = (sel) ? I : 1'b0;

endmodule
