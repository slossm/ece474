
module fifo ( 
	input            wr_clk,   //write clock
	input            rd_clk,   //read clock
	input            reset_n,  //reset async active low
	input            wr,       //write enable 
	input            rd,       //read enable    
	input      [7:0] data_in,  //data in
	output reg [7:0] data_out, //data out
	output reg       empty,    //empty flag
	output reg       full      //full flag
	);

	reg	[3:0]	rd_addr;  //read address
	reg     [3:0]	wr_addr;  //write address

	reg	[7:0]	byte0;
	reg	[7:0]	byte1;
	reg	[7:0]	byte2;
	reg	[7:0]	byte3;
	reg	[7:0]	byte4;
	reg	[7:0]	byte5;
	reg	[7:0]	byte6;
	reg	[7:0]	byte7;


//write to memory logic
always_ff @(posedge wr_clk, negedge reset_n)  
begin
	if(!reset_n)	begin // reset writes zeros to the bytes and wr_addr  
			wr_addr <= 4'b0000;
  			byte0   <= '0;
			byte1   <= '0;
			byte2   <= '0;
			byte3   <= '0;
			byte4   <= '0;
			byte5   <= '0;
			byte6   <= '0;
			byte7   <= '0;
			end
	
	else if(wr)	begin //moves data from data_in to the bytes
			unique case (wr_addr[2:0])
			    3'b000 : byte0 <= data_in;
			    3'b001 : byte1 <= data_in; 
		    	    3'b010 : byte2 <= data_in; 
		    	    3'b011 : byte3 <= data_in; 
		    	    3'b100 : byte4 <= data_in; 
		    	    3'b101 : byte5 <= data_in; 
		    	    3'b110 : byte6 <= data_in; 
		    	    3'b111 : byte7 <= data_in; 
			endcase
			wr_addr <= wr_addr + 1;
			end
	
	else		begin
			wr_addr <= wr_addr;
			end
end


//read from memory logic
always_ff @(posedge rd_clk, negedge reset_n)  
begin
	if(!reset_n)	rd_addr <= 4'b0000;	//reset 
	else if(rd)	rd_addr <= rd_addr + 1;	//rd high
	else		rd_addr <= rd_addr;	//rd_clk high rd low
end

//combinational logic for data pass through
always_comb
begin
    if(!reset_n) data_out = byte0;

	else	begin
	    unique case (rd_addr[2:0])
		3'b000 : data_out = byte0;
		3'b001 : data_out = byte1;
		3'b010 : data_out = byte2;
		3'b011 : data_out = byte3;
		3'b100 : data_out = byte4;
		3'b101 : data_out = byte5;
		3'b110 : data_out = byte6;
		3'b111 : data_out = byte7;
	    endcase
	    end
end

//full and empty flag logic
always_comb  
begin
	if(!reset_n)	begin
			empty = 1;
			full  = 0;
			end

	else if(rd_addr[2:0] == wr_addr[2:0]) //compare the last 3 bits of address
		begin
		if(rd_addr[3] == wr_addr[3]) begin
					     full  = 0;
					     empty = 1;
					     end

		else	 begin
			 empty = 0;
			 full  = 1;
			 end
		end
	
	else	begin
		empty = 0;
		full  = 0;
		end

end


endmodule

