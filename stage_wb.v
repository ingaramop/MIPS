`timescale 1ns / 1ps

module stage_wb(input [31:0] readData,
					 input [31:0] aluResult,
					 input memReg,
					 input regWrite,
					 input [4:0] wrIn,
					 input reset,
					 output reg regWrite_WBID,
					 output reg [31:0] dataOut,
					 output reg [4:0] wrOut
    );

initial regWrite_WBID = 0;
always @(*)
	begin
		if (reset) begin
			dataOut = 0;
			wrOut = 0;
		end
		else begin
			dataOut = memReg ? readData : aluResult;
			wrOut = wrIn;
			regWrite_WBID = regWrite;
		end
	end

endmodule
