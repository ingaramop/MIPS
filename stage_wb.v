`timescale 1ns / 1ps

module stage_wb(input [31:0] readData,
					 input [31:0] aluResult,
					 input memReg,
					 input [4:0] wrIn,
					 input reset,
					 output reg [31:0] dataOut,
					 output reg [4:0] wrOut
    );

always @(*)
	begin
		if (reset) begin
			dataOut = 0;
			wrOut = 0;
		end
		else begin
			dataOut = memReg ? readData : aluResult;
			wrOut = wrIn;
		end
	end

endmodule
