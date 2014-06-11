module averager (
	input		  clk,
	input		  reset_n,
	input		  ac_clear,
	input		  read,
	input	   [7:0]  data_in,
	output reg [7:0]  data_out
	);

	reg [9:0] ac;
	

always_ff @(posedge clk, negedge reset_n)
begin
	if(!reset_n)  ac <= '0;

	else if(read) 
	begin
		case(ac_clear)
		    1'b0 :  ac <= (ac + data_in);
		    1'b1 :  ac <= data_in;
		endcase
	end
end


always_comb
begin
	data_out = (ac >> 2);
end


endmodule

