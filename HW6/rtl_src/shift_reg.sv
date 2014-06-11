module shift_reg (
	input		  clk,
	input		  reset_n,
	input		  serial_data,
	input		  serial_en,
	output reg [7:0]  parallel_data
	);

	reg [7:0] bits;
	

//seiral data shifted in	
always_ff @(posedge clk, negedge reset_n) 
begin
	if(!reset_n)	    bits <= '0;

	else if(serial_en)  begin
			    bits <= (bits >> 1);
			    bits[7] <= serial_data;
			    end
end


//output data always avalable
always_comb
begin
	parallel_data = bits;
end


endmodule

