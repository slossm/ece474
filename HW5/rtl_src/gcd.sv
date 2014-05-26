// GCD Module
// Author: Matthew Sloss
// ECE 474

module gcd (
    input   	[31:0]  a_in, 		// Input A
    input   	[31:0]  b_in, 		// Input B
    input   		start, 		// Tells module to begin
    input  		reset_n, 	// Reset. Active low
    input   		clk, 		// Clock
    output reg	[31:0]	result, 	// Output
    output reg		done 		// Finished flag
);

	// Declare internal registers for A and B
	reg [31:0] reg_a;
	reg [31:0] reg_b;
	
	// Declare enums for reg_a_sel
	enum reg [1:0] {load_a, 
			load_a_minus_b, 
			swap_a_from_b, 
			hold_a		} reg_a_sel;
	
	// Declare enums for reg_b_sel
	enum reg [1:0] {load_b, 
			swap_b_from_a, 
			hold_b		} reg_b_sel;
	
	// Declare enums for states
	enum reg [1:0] {idle, 
			run, 
			finished, 
			xx_state = 'X} gcd_ps, gcd_ns;
	
	// Declare a_lt_b internal wire
	reg a_lt_b;
	
	// Declare b_eq_zero internal wire *credit of scott harpool for latch avoidance
	reg b_eq_zero;
	
	// Creation of reg_a
	always_ff @(posedge clk, negedge reset_n)
	begin
	    if (!reset_n) reg_a <= '0;
	    else
		unique case (reg_a_sel)
		    load_a  		:	reg_a <= a_in;
		    load_a_minus_b  	:	reg_a <= reg_a - reg_b;
		    swap_a_from_b   	:	reg_a <= reg_b;
		    hold_a  		:	reg_a <= reg_a;
		endcase
	end
	
	// Creation of reg_b
	always_ff @(posedge clk, negedge reset_n)
	begin
	    if (!reset_n) reg_b <= '0;
	    else
		unique case (reg_b_sel)
		    load_b  		:	reg_b <= b_in;
		    swap_b_from_a   	:	reg_b <= reg_a;
		    hold_b  		:	reg_b <= reg_b;
		endcase
	end
	
	// Make result
	always_ff @(posedge clk, negedge reset_n) 
	begin
	    if (!reset_n) result <= '0;
	    else
		unique case (b_eq_zero)
		    1'b0    :	result <= result;
		    1'b1    :	result <= reg_a;
		endcase
	end
	
	// Check if reg_a is less than reg_b
	always_comb 
	begin
	    if (reg_a < reg_b) 	a_lt_b = 1'b1;
	    else 		a_lt_b = 1'b0;
	end
	
	// Check if reg_b is equal to zero
	always_comb 
	begin
	    if (reg_b == 0) 	b_eq_zero = 1'b1;
	    else    		b_eq_zero = 1'b0;
	end
	
	// Make state machine: storage
	always_ff @(posedge clk, negedge reset_n) 
	begin
	    if (!reset_n)   gcd_ps <= idle;
	    else	    gcd_ps <= gcd_ns;
	end
	
	// Make state machine: next state combo logic
	always_comb 
	begin
	    gcd_ns = xx_state;
	    case (gcd_ps)
		idle	    :   begin
				    if (start) gcd_ns = run;
				    else gcd_ns = idle;
				end

		run	    :   begin
				    if (a_lt_b) gcd_ns = run;
				    else if (!b_eq_zero) gcd_ns = run;
				    else gcd_ns = finished;
				end

		finished    :	gcd_ns = idle;	
	    endcase
	end
	
	// Make state machine: output combo logic
	always_comb begin
	    reg_a_sel = hold_a;
	    reg_b_sel = hold_b;
	    done = 1'b0;
	    case (gcd_ps)
		idle	:   begin
				if (start)
				begin
				    reg_a_sel = load_a;
				    reg_b_sel = load_b;
				end

				else
				begin
				    reg_a_sel = hold_a;
				    reg_b_sel = hold_b;
				end
			    end

		run 	:   begin
				if (a_lt_b)
				begin
				    reg_a_sel = swap_a_from_b;
				    reg_b_sel = swap_b_from_a;
				end

				else if (!b_eq_zero)
				begin
				    reg_a_sel = load_a_minus_b;
				    reg_b_sel = hold_b;
				end
				else
				begin
				    reg_a_sel = hold_a;
				    reg_b_sel = hold_b;
				end
			    end

		finished    :	begin
				    reg_a_sel = hold_a;
				    reg_b_sel = hold_b;
				    done = 1'b1;
				end
	    endcase
	end
endmodule
