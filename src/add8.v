module add8(
    input   wire [0:7]  in_a,
    input   wire [0:7]  in_b,
    output  wire [0:7]  sum,
    input   wire        carry_in,
    output  wire        carry_out
);

wire [0:6] carry;

add1 a0(.in_a(in_a[0]), .in_b(in_b[0]), .carry_in(carry_in), .sum(sum[0]), .carry_out(carry[0]));
add1 a1(.in_a(in_a[1]), .in_b(in_b[1]), .carry_in(carry[0]), .sum(sum[1]), .carry_out(carry[1]));
add1 a2(.in_a(in_a[2]), .in_b(in_b[2]), .carry_in(carry[1]), .sum(sum[2]), .carry_out(carry[2]));
add1 a3(.in_a(in_a[3]), .in_b(in_b[3]), .carry_in(carry[2]), .sum(sum[3]), .carry_out(carry[3]));
add1 a4(.in_a(in_a[4]), .in_b(in_b[4]), .carry_in(carry[3]), .sum(sum[4]), .carry_out(carry[4]));
add1 a5(.in_a(in_a[5]), .in_b(in_b[5]), .carry_in(carry[4]), .sum(sum[5]), .carry_out(carry[5]));
add1 a6(.in_a(in_a[6]), .in_b(in_b[6]), .carry_in(carry[5]), .sum(sum[6]), .carry_out(carry[6]));
add1 a7(.in_a(in_a[7]), .in_b(in_b[7]), .carry_in(carry[6]), .sum(sum[7]), .carry_out(carry_out));


endmodule