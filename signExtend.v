`timescale 1ns / 1ps
module signExtend(
			input [15:0] inSignExtend, 
			output reg [31:0] outSignExtend
			);


always @(*)
begin
	if (inSignExtend[15]==1)
			outSignExtend={16'b1111_1111_1111_1111,inSignExtend};
	else
			outSignExtend={16'b0000_0000_0000_0000,inSignExtend};	
end
endmodule
