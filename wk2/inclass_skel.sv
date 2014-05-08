module inclass (
       input  clk,           // clock input
       input  reset_n,       // reset async active low
       input  read,          // read signal 
       input  write,         // write signal
       input  [7:0] data_in, // data input 
       output [7:0] data_out // data output 
       );

//declare internal signals
  wire [2:0] address;   //output of counter 
  wire ram_wr;          //write line to fifo
  wire ram_rd;          //read line to fifo
  wire logic_one;       //read line to fifo

  assign logic_one = 1'b1;    //pullup to logic one

//-----------------  module instantiations  --------------------------
  counter #(.width(3)) counter_0(   //this is a three bit counter
  .clk           (clk),
  .reset_n       (reset_n),
  .enable        (logic_one),
  .up            (ram_wr),
  .down          (ram_rd),
  .count_out     ([2:0] address));

//instantiate logic_blk here

  logic_blk logic_blk_0(
    .clk	 (clk)
    .reset_n	 (reset_n)
    .wr		 (write)
    .rd		 (read)
    .wr_ram	 (ram_wr)
    .rd_ram	 (ram_re)
    .error_flag	 ());

//instantaiate the ram here

 ram ram_0(
    .address	([2:0] address)
    .data_in	([7:0] data_in)
    .ram_wr	(ram_wr)
    .ram_rd	(ram_rd) 
    .output	([7:0] data_out));
//--------------------------------------------------------------------
endmodule

