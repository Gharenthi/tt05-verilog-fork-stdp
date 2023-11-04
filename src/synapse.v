module synapse(
    input   wire        pre_spike,
    input   wire        post_spike,
    input   wire        learn,
    input   wire        clk,
    output  wire [0:7]  spike_out
);

wire [0:7] rpre_out;
wire [0:7] rpos_out;
wire [0:7] rwgt_out;

reg8 r_pre_hyst();
reg8 r_post_hyst();
reg8 r_weight();

add8 post_mult(.in_a(), .in_b(), .sum() .carry_in(), .carry_out())



endmodule