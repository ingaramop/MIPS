`timescale 1ns / 1ps

module addPc(input [9:0]inPc, 
				 input PCwrite,
				 output reg [9:0]outPc
    );

always @(*)
begin
	if(PCwrite)
		outPc <= inPc+1;
	else
		outPc <= outPc;
end

endmodule
