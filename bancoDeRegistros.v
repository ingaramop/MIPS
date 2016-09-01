`timescale 1ns / 1ps

module bancoDeRegistros(addressA, addressB, addressW, clk, we, data, reset, regA, regB, registers);
parameter DATA_WIDTH = 32;
parameter REGFILE_WIDTH = 5;
 
//pin declarations
input wire we, clk;
input wire [REGFILE_WIDTH-1:0] addressA, addressB, addressW;
input wire [DATA_WIDTH-1:0] data;
input wire reset;
output wire [DATA_WIDTH-1:0] regA, regB;
output wire [1023:0] registers;

 
reg [REGFILE_WIDTH-1:0] ra1, ra2;
integer i;
 
//memory declarations
reg [DATA_WIDTH - 1:0] banco[0:(2**REGFILE_WIDTH - 1)];
  
//write logic
always@(addressA or addressB or reset) begin
	if (reset) begin
		ra1 = 0;
		ra2 = 0;
	end
	else begin
		ra1 = addressA;
		ra2 = addressB;
		//$display("writing time:%t ra1:%dt ra2:%d", $time, ra1, ra2);
	end
end
 
always@(posedge clk) begin
    if(we == 1 & ~reset) begin
        //$display("writing time:%ttAddress:%dtData:%d", $time, addressW, data);
        banco[addressW] = data;
    end
	 else if (reset) begin
		banco[0] = 0;
		banco[1] = 0;
		banco[2] = 0;
		banco[3] = 0;
		banco[4] = 0;
		banco[5] = 0;
		banco[6] = 0;
		banco[7] = 0;
		banco[8] = 0;
		banco[9] = 0;
		banco[10] = 0;
		banco[11] = 0;
		banco[12] = 0;
		banco[13] = 0;
		banco[14] = 0;
		banco[15] = 0;
		banco[16] = 0;
		banco[17] = 0;
		banco[18] = 0;
		banco[19] = 0;
		banco[20] = 0;
		banco[21] = 0;
		banco[22] = 0;
		banco[23] = 0;
		banco[24] = 0;
		banco[25] = 0;
		banco[26] = 0;
		banco[27] = 0;
		banco[28] = 0;
		banco[29] = 0;
		banco[30] = 0;
		banco[31] = 0;
			for (i = 0; i < 2**REGFILE_WIDTH; i = i +1) begin
				banco[i] = 0;
			end
		end

end

assign regA = banco[ra1];
assign regB = banco[ra2];
assign registers = {banco[0],banco[1], banco[2], banco[3], banco[4],banco[5], banco[6], banco[7],
							banco[8], banco[9], banco[10], banco[11],banco[12], banco[13], banco[14], banco[15],
							banco[16], banco[17], banco[18], banco[19],banco[20], banco[21], banco[22],banco[23],
							banco[24], banco[25], banco[26], banco[27],banco[28], banco[29], banco[30], banco[31]};
 
endmodule