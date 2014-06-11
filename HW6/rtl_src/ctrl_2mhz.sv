module ctrl_2mhz (
    input	clk,
    input	reset_n,
    input	empty,
    output reg	read,
    output reg	ac_clear,
    output reg	write_ram
    );

    
    //read_fifo enuerated reg
    enum reg	{
	    no_read_fifo    = 1'b0,
	    read_fifo	    = 1'b1,
	    read_fifo_xx    = 'x
	    } read_fifo_ps, read_fifo_ns;

    //reset_ac enumerated reg
    enum reg	{
	    reset_ac	    = 1'b0,
	    no_reset_ac	    = 1'b1,
	    reset_ac_xx	    = 'x
	    } reset_ac_ps, reset_ac_ns;

    //write_ram enumerated reg
    enum reg	{
	    no_wr_ram	    = 1'b0,
	    wr_ram	    = 1'b1,
	    write_ram_xx    = 'x
	    } write_ram_ps, write_ram_ns;

    //read_byte enumerated reg
    enum reg [1:0]  {
	    byte1	    = 2'b00,
	    byte2	    = 2'b01,
	    byte3	    = 2'b10,
	    byte4	    = 2'b11,
	    read_byte_xx    = 'x
	    } read_byte_ps, read_byte_ns;

//read_fifo state machine
always_ff @(posedge clk, negedge reset_n) 
begin

    if (!reset_n)   read_fifo_ps <= no_read_fifo;  
    else	    read_fifo_ps <= read_fifo_ns;
    
end

always_comb
begin
    read_fifo_ns = read_fifo_xx;

    if(!empty)	read_fifo_ns = read_fifo;
    else	read_fifo_ns = no_read_fifo;
end

//read_fifo output logic
always_comb 
begin
    read = 'x;

    if (read_fifo_ns == read_fifo) read = 1'b1;
    else read = 1'b0;

    
end


//reset_ac state machine
always_ff @(posedge clk, negedge reset_n)
begin	
    if(!reset_n)    reset_ac_ps <= reset_ac;
    else	    reset_ac_ps <= reset_ac_ns;
end

always_comb
begin
    reset_ac_ns = reset_ac_xx;

    if(read_byte_ns != byte1)	reset_ac_ns = no_reset_ac;
    else			reset_ac_ns = reset_ac;
end

//reset_ac output logic
always_comb
begin
    ac_clear = 'x;
    
    if(reset_ac_ps == reset_ac)	    ac_clear = 1'b1;
    else			    ac_clear = 1'b0;

end


//write_ram state machine
always_ff @(posedge clk, negedge reset_n)
begin
    if(!reset_n)    write_ram_ps <= no_wr_ram;
    else	    write_ram_ps <= write_ram_ns;
end


always_comb begin
    write_ram_ns = write_ram_xx;
    case(write_ram_ps)
	no_wr_ram     :	begin
			if (read && (read_byte_ps == byte4))	write_ram_ns = wr_ram;
			else					write_ram_ns = no_wr_ram;
			end
	
	wr_ram	      :	write_ram_ns = no_wr_ram;
    endcase
end

//write_ram output logic
always_comb
begin
    write_ram = 'x;

    if(write_ram_ps == wr_ram)  write_ram = 1'b1;
    else			write_ram = 1'b0;
end


//read_byte state machine
always_ff @(posedge clk, negedge reset_n)
begin
    if(!reset_n)    read_byte_ps <= byte1;
    else	    read_byte_ps <= read_byte_ns;
end

always_comb
begin
    read_byte_ns <= read_byte_xx;
    case(read_byte_ps)

	byte1	  : begin
		    if(read)	read_byte_ns <= byte2;
		    else	read_byte_ns <= byte1;
		    end

	byte2	  : begin
		    if(read)	read_byte_ns <= byte3;
		    else	read_byte_ns <= byte2;
		    end

	byte3	  : begin
		    if(read)	read_byte_ns <= byte4;
		    else	read_byte_ns <= byte3;
		    end

	byte4	  : begin
		    if(read)	read_byte_ns <= byte1;
		    else	read_byte_ns <= byte4;
		    end
    endcase

end


endmodule
