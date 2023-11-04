module synapse(
    input   wire        pre_spike,
    input   wire        post_spike,
    input   wire        learn,
    input   wire        clk,
    input   wire        reset,
    output  wire [0:7]  activation
);

wire [0:7] rw_out;
wire [0:7] new_weight;
wire [0:7] delta_weight;
wire [0:7] hyst_out;
wire [0:7] hyst_decay_out;
wire clk_update;
wire wnew_clip;

assign activation = rw_out[0:7] & {8{pre_spike}};
assign clk_update = clk & learn;


reg8 r_weight(.write(new_weight[0:7] | {{7{1'b0}}, wnew_clip}), .read(rw_out[0:7]), .clk(clk_update & post_spike), .reset(reset));
add8 a_wnew(.in_a(rw_out[0:7]), .in_b(delta_weight[0:7]), .sum(new_weight[0:7]), .carry_in(1'b0), .carry_out(wnew_clip));

reg8 r_hyst(.write({8{pre_spike}} | hyst_decay_out), .read(hyst_out[0:7]), .clk(clk_update), .reset(reset));
add8 a_delta(.in_a(hyst_out[0:7]), .in_b(8'b11111100), .sum(delta_weight[0:7]), .carry_in(1'b0), .carry_out());
decay leak(.in(hyst_out[0:7]), .out(hyst_decay_out[0:7]));


endmodule