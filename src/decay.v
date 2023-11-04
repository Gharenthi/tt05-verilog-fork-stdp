//out = in * 15/16
module decay(
    input   wire [0:7]  in,
    output  wire [0:7]  out
);

add8 magic(.in_a(in[0:7]), .in_b(~{in[4:7], 4'h0}), .sum(out[0:7]), .carry_in(1'b1), .carry_out());

endmodule