`timescale 1ns / 1ps

module Forwarding_Unit(
	input [4:0] regRt_IDEX, 
	input [4:0] regRs_IDEX, 			
	input [4:0] regRd_EXMEM, 	
	input [4:0] regRd_MEMWB,		
	input RegWrite_EXMEM, 	
	input RegWrite_MEMWB ,	
	output reg [1:0]FowardingA,
	output reg [1:0]FowardingB	
    );
	 
//initial FowardingA = 2'b10;
//initial FowardingB = 2'b10;
	 
//RegWrite == 1 --> Escribe en Registros	
//RegWrite == 0 --> No escribe en Registros	 
always @(*)
	begin
		if((RegWrite_EXMEM !=0) && (regRd_EXMEM !=0)&&(regRd_EXMEM == regRs_IDEX))
			FowardingA = 2'b10; // El 1er operando de la ALU es anticipado del anterior resultado de la ALU
		else 
			if((RegWrite_MEMWB!=0) && (regRd_MEMWB!=0) && (regRd_MEMWB == regRs_IDEX))
				FowardingA = 2'b01; 
				//El 1er operando de la ALU es anticipado de la memoria de datos o de un previo resultado de la ALU
			else 
				FowardingA = 2'b00;	//El 1er operando de la ALU viene del archivo de registros
					
		if((RegWrite_EXMEM!=0) && (regRd_EXMEM !=0) && (regRd_EXMEM == regRt_IDEX))
			FowardingB = 2'b10; //El 2º operando de la ALU es anticipado del anterior resultado de la ALU
		else
			if((RegWrite_MEMWB!=0) && (regRd_MEMWB!=0) && (regRd_MEMWB == regRt_IDEX))
				FowardingB = 2'b01; 
			//El 2º operando de la ALU es anticipado de la memoria de datos o de un previo resultado de la ALU
			else
				FowardingB = 2'b00; //El 2º operando de la ALU viene del archivo de registros	
	end
endmodule