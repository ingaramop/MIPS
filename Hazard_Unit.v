`timescale 1ns / 1ps
module Hazard_Unit(
			input memreadMEM,
			input [4:0] rs_IFID,
			input [4:0] rt_IFID,
			input [4:0] rt_IDEX,
			output reg muxCtrlSignal,
			output reg IFIDWrite
			);
initial muxCtrlSignal = 1;
//initial PCWrite = 1;
initial IFIDWrite = 1;
always @ (*)
begin
	if( memreadMEM && ((rt_IDEX == rs_IFID) || (rt_IDEX == rt_IFID)))
		begin
			muxCtrlSignal <= 0;
			IFIDWrite <= 0;
		end
	else
		begin
			muxCtrlSignal <= 1;
			IFIDWrite <= 1;
		end
end
endmodule
