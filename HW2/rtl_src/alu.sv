module alu(
      input        [7:0] in_a     ,  //input a
      input        [7:0] in_b     ,  //input b
      input        [3:0] opcode   ,  //opcode input
      output  reg  [7:0] alu_out  ,  //alu output
      output  reg        alu_zero ,  //logic '1' when alu_output [7:0] is all zeros
      output  reg        alu_carry   //indicates a carry out from ALU 
      );


    parameter c_add = 4'h1;		//opcode of 0001 for addition
    parameter c_sub = 4'h2;		//opcode of 0010 for subtraction
    parameter c_inc = 4'h3;		//opcode of 0011 for increment
    parameter c_dec = 4'h4;		//opcode of 0100 for decrement
    parameter c_or  = 4'h5;		//opcode of 0101 for or
    parameter c_and = 4'h6;		//opcode of 0110 for and
    parameter c_xor = 4'h7;		//opcode of 0111 for xor
    parameter c_shr = 4'h8;		//opcode of 1000 for shift right
    parameter c_shl = 4'h9;		//opcode of 1001 for shift left
    parameter c_onescomp = 4'hA;	//opcode of 1010 for one's complement
    parameter c_twoscomp = 4'hB;	//opcode of 1011 for two's complement

    reg	     [8:0] total;
    reg	     [7:0] twoscomp_temp;
    always_comb begin
	
	unique case(opcode)
	    c_add   :	begin
		    	total = in_a + in_b;
			alu_out = total[7:0];
			alu_carry = total[8] ;
			end

	    c_sub   :   begin
			total = in_a - in_b;
			alu_out = total[7:0];		    
			alu_carry = total[8];  //needs carry support
			end

	    c_inc   :	begin
		    	total = in_a + 1;
			alu_out = total[7:0];
			alu_carry = total[8];
			end

	    c_dec   :   begin
			total = in_a - 1;
			alu_out = total[7:0];
			alu_carry = total[8];	//needs carry support
			end

	    c_or    :   begin
			alu_out = in_a | in_b;
			alu_carry = 1'b0;
                        end

	    c_and   :	begin
		    	alu_out = in_a & in_b;
			alu_carry = 1'b0;
                        end

	    c_xor   :   begin
		    	alu_out = in_a ^ in_b;
			alu_carry = 1'b0;
                        end

	    c_shr   :	begin
			alu_out = in_a >> 1;
			alu_carry = 1'b0;
			end			

	    c_shl   :	begin
			total = in_a << 1;
			alu_out = total[7:0];
			alu_carry = total[8];
			end    

	    c_onescomp	:   begin
			    alu_out = ~in_a;
			    alu_carry = 1'b0;
			    end

	    c_twoscomp	:   begin
			    twoscomp_temp = ~in_a;
			    total = twoscomp_temp + 1;
			    alu_carry = total[8];
			    alu_out = total[7:0];
			    end
	    
	     default	:   begin
			    alu_out = 'x;
			    alu_carry = 'x;
			    end
	     endcase

	    
	    alu_zero = ~(|(alu_out+alu_out));

    end // ending always_comb block


endmodule
