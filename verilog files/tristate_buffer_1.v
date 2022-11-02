module tristate_buffer_1(out, a, control);
	input a, control;
	output out;
	assign out = control ? a : 1'bz;
	
	/*
	always
		begin
			if (control)
				out = a;
			else
				out = 1'bz;
		end
	*/

endmodule