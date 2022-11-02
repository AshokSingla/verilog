module tristate_buffer_1(out, a, control);
	input a, control;
	output out;
	assign out = control ? 1'bz : a;
	
	/*
	always
		begin
			if (control)
				out = 1'bz;
			else
				out = a;
		end
	*/

endmodule