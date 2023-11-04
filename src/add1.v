module add1(
    input   wire         in_a,
    input   wire         in_b,
    input   wire         carry_in,
    output  wire         sum,
    output  wire         carry_out
);

assign wire p1 = in_a ^ in_b;

assign sum = p1 ^ carry_in;
assign carry_out = (p1 & carry_in) | (in_a & in_b);

endmodule