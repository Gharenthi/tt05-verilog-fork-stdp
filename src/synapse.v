module synapse(
    input   wire        pre_spike,
    input   wire        post_spike,
    input   wire        learn,
    input   wire        clk,
    input   wire        reset,
    output  wire [0:7]  activation
);

assign activation = 2'b00000000;

// wire [0:7] rw_out;

//reg8 r_pre_hyst();
//reg8 r_post_hyst();
// reg8 r_weight(.write(sum_3[0:7]), .read(rw_out[0:7]), .clk(clk), .reset(reset));

//add8 post_mult(.in_a(), .in_b(), .sum() .carry_in(), .carry_out())



endmodule