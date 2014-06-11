module ram_ctr (
	input		   clk,
	input		   reset_n,
	input		   write_ram,
	output reg [10:0]  ram_addr
	);


always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n) ram_addr <= 11'h7ff;
	else if(write_ram && ram_addr == 11'h000)   ram_addr <= 11'h7ff;
	else if(write_ram) ram_addr <= (ram_addr - 1'b1);
end


endmodule

