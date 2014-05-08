module adder8(
	input  [7:0] a,		//data in a
	input  [7:0] b,		//data in b
	output [7:0] sum_out,	//sum output
	output c_out		//carry output
	);

//Declare internal signals

 wire c1, c2, c3 ,c4 ,c5 ,c6 ,c7,c8; // wire delaclarations for 

  assign logic_one  = 1'b1;
  assign logic_zero = 1'b0;
//--------------------- module instantiations ----------------------

 fadder fadder_0(
  .a		(a[0]),
  .b		(b[0]),
  .cin		(logic_zero), // No carry in pin so the first cin set to 0
  .sum_out	(sum_out[0]),
  .c_out	(c1));

 fadder fadder_1(
  .a		(a[1]),
  .b		(b[1]),
  .cin		(c1),
  .sum_out	(sum_out[1]),
  .c_out	(c2));

 fadder fadder_2(
  .a		(a[2]),
  .b		(b[2]),
  .cin		(c2),
  .sum_out	(sum_out[2]),
  .c_out	(c3));

 fadder fadder_3(
  .a		(a[3]),
  .b		(b[3]),
  .cin		(c3),
  .sum_out	(sum_out[3]),
  .c_out	(c4));

 fadder fadder_4(
  .a		(a[4]),
  .b		(b[4]),
  .cin		(c4),
  .sum_out	(sum_out[4]),
  .c_out	(c5));

 fadder fadder_5(
  .a		(a[5]),
  .b		(b[5]),
  .cin		(c5),
  .sum_out	(sum_out[5]),
  .c_out	(c6));

 fadder fadder_6(
  .a		(a[6]),
  .b		(b[6]),
  .cin		(c6),
  .sum_out	(sum_out[6]),
  .c_out	(c7));

 fadder fadder_7(
  .a		(a[7]),
  .b		(b[7]),
  .cin		(c7),
  .sum_out	(sum_out[7]),
  .c_out	(c_out));	// final carry out bit

endmodule
