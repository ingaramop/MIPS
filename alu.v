`timescale 1ns / 1ps

module Alu ( 
	 input [31:0] data1,  		// Primera entrada de datos.
	 input [31:0] data2,
	 input [3:0] operation,				// eleccion de la operacion 
    output reg[31:0] aluResult,	// Salida de la operacion de la ALU
	 output reg zero // flag de indicación de resultado = 0
	 );
	
	 always @(*) begin
		case(operation)
			4'b0000: begin
						aluResult = data1 & data2;
						end
			4'b0001: begin
						aluResult = data1 | data2; 
						end
			4'b0010: begin
						aluResult = data1 + data2; // load or store
						end
/*			4'b0100: begin
						aluResult = data1 ^ data2; // rs XOR rt
						end*/
			4'b1100: begin
						aluResult = ~(data1 | data2);  // rs NOR rt 
						end
			4'b0110: begin
						aluResult = data1 - data2; // branch equal
						end
/*			4'b1001: begin
						aluResult = data1 ^ data2; //rt XOR inmediato
						end*/
			4'b0111: begin
							if(data1 < data2)
								begin
									aluResult = 0;//ESTA BIEN O AL REVES??????????
								end
							else
								begin
									aluResult = 1;
								end
						end
			default :begin 
							aluResult = 0;
						end
			endcase
			
			if (aluResult == 0)
				zero = 1;
			else
				zero = 0;
		end
endmodule