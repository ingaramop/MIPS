`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:32 11/25/2013 
// Design Name: 
// Module Name:    alu_ctrl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module AluControl(
    input [1:0] aluOp,
    input [5:0] functionField,
    output reg [3:0] operation
    );
	 
	 always @(*) begin
	
		case (aluOp) 
			2'b00://LOAD OR STORE WORD
				begin 
					operation = 4'b0010; // ADD
				end
			2'b01://BRANCH EQUAL
				begin 
					operation = 4'b0110; // SUBSTRACT
				end
			2'b10://R TYPE
				begin 
					case (functionField) 
						6'b100000://ADD
							begin
								operation = 4'b0010; // ADD
							end
						6'b100010://SUBSTRACT
							begin
								operation = 4'b0110; // SUBSTRACT
							end
						6'b100100://AND
							begin
								operation = 4'b0000; // AND
							end
						6'b100101://OR
							begin
								operation = 4'b0001; // OR
							end
						6'b101010://SET ON LESS THAN
							begin
								operation = 4'b0111; //SET ON LESS THAN
							end
						default :
							begin 
								operation = 4'b0000;
							end
					endcase
				end
		default :
			begin 
				operation = 4'b0000;
			end
		endcase
	end 
	
endmodule