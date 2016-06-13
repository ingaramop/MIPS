`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:35 10/30/2013 
// Design Name: 
// Module Name:    Baud_Rate 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 100MHz/(19200*16)=325,52=>326 ticks
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Baud_Rate(
    input clock,
    output reg tick
    );

reg [8:0] cuenta;

initial
	begin
	tick=0;
	cuenta=0;
end

always @(posedge clock)
	begin
	cuenta=cuenta+1'b1;
	if(cuenta==326)	
		begin
		cuenta=0;
		tick=1;
		end
	else
	tick=0;
end

endmodule
