`timescale 1ns / 1ps

module jumpControl(input [5:0] opcode,
						 output reg jump
    );
always @(*)
begin 
	if (opcode == 6'b000010)
	jump <= 1;
	else 
	jump <= 0;
end

endmodule
