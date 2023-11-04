module add8(
    input   wire [0:7]  in_a,
    input   wire [0:7]  in_b,
    output  wire [0:7]  sum,
    input   wire        carry_in,
    output  wire        carry_out
);

wire [0:6] carry;

add1 a0(.a(in_a[0]), .b(in_b[0]), .c(carry_in), .sum(sum[0]), .carry_out(carry[0]));
add1 a1(.a(in_a[1]), .b(in_b[1]), .c(carry[0]), .sum(sum[1]), .carry_out(carry[1]));
add1 a2(.a(in_a[2]), .b(in_b[2]), .c(carry[1]), .sum(sum[2]), .carry_out(carry[2]));
add1 a3(.a(in_a[3]), .b(in_b[3]), .c(carry[2]), .sum(sum[3]), .carry_out(carry[3]));
add1 a4(.a(in_a[4]), .b(in_b[4]), .c(carry[3]), .sum(sum[4]), .carry_out(carry[4]));
add1 a5(.a(in_a[5]), .b(in_b[5]), .c(carry[4]), .sum(sum[5]), .carry_out(carry[5]));
add1 a6(.a(in_a[6]), .b(in_b[6]), .c(carry[5]), .sum(sum[6]), .carry_out(carry[6]));
add1 a7(.a(in_a[7]), .b(in_b[7]), .c(carry[6]), .sum(sum[7]), .carry_out(carry_out));


endmodule