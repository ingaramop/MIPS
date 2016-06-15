`timescale 1ns / 1ps

module PC(input [9:0]pc,input clk, input reset, output reg [9:0]outPc
    );

initial begin
		outPc = 0;
			end

always @(*)
begin
	if(reset) outPc<=0;
	else outPc<=pc;
end
 
endmodule
