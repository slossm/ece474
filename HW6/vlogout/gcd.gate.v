
module tas ( clk_50, clk_2, reset_n, serial_data, data_ena, ram_wr_n, ram_data, 
        ram_addr );
  output [7:0] ram_data;
  output [10:0] ram_addr;
  input clk_50, clk_2, reset_n, serial_data, data_ena;
  output ram_wr_n;
  wire   N0, n9, n10, n11, n12, n13;
  tri   clk_50;
  tri   clk_2;
  tri   reset_n;
  tri   serial_data;
  tri   data_ena;
  tri   ram_wr_n;
  tri   [7:0] ram_data;
  tri   [10:0] ram_addr;
  tri   [7:0] parallel_data;
  tri   a5_or_c3;
  tri   write;
  tri   fifo_empty;
  tri   read;
  tri   zero_sel;
  tri   [7:0] fifo_out;

  ctrl_50mhz ctrl_50mhz_0 ( .clk(clk_50), .reset_n(reset_n), .serial_en(
        data_ena), .A5_or_C3(a5_or_c3), .write(write) );
  ctrl_2mhz ctrl_2mhz_0 ( .clk(clk_2), .reset_n(reset_n), .empty(fifo_empty), 
        .read(read), .zero_sel(zero_sel), .write_ram(ram_wr_n) );
  shift_reg shift_reg_0 ( .clk(clk_50), .reset_n(reset_n), .serial_data(
        serial_data), .serial_en(data_ena), .parallel_data(parallel_data) );
  fifo fifo_0 ( .wr_clk(clk_50), .rd_clk(clk_2), .reset_n(reset_n), .wr(write), 
        .rd(read), .data_in(parallel_data), .data_out(fifo_out), .empty(
        fifo_empty) );
  averager averager_0 ( .clk(clk_2), .reset_n(reset_n), .zero_sel(zero_sel), 
        .read(read), .data_in(fifo_out), .data_out(ram_data) );
  ram_ctr ram_ctr_0 ( .clk(clk_2), .reset_n(reset_n), .write_ram(ram_wr_n), 
        .ram_addr(ram_addr) );
  NBUFFX2 B_0 ( .IN(N0), .Q(a5_or_c3) );
  AND4X1 U8 ( .IN1(n9), .IN2(parallel_data[7]), .IN3(n10), .IN4(
        parallel_data[0]), .Q(N0) );
  NOR2X0 U9 ( .IN1(parallel_data[4]), .IN2(parallel_data[3]), .QN(n10) );
  MUX21X1 U10 ( .IN1(n11), .IN2(n12), .S(parallel_data[5]), .Q(n9) );
  NOR3X0 U11 ( .IN1(n13), .IN2(parallel_data[6]), .IN3(parallel_data[1]), .QN(
        n12) );
  AND3X1 U12 ( .IN1(parallel_data[6]), .IN2(n13), .IN3(parallel_data[1]), .Q(
        n11) );
  INVX0 U13 ( .IN(parallel_data[2]), .QN(n13) );
endmodule

