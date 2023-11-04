module neuron(
    input   wire [0:7]  inputs,
    input   wire        learn,
    output  wire        spike_out,
    input   wire        clk,
    input   wire        reset
);

// wire [0:63] acts;
wire [0:31] acts;
synapse s0(.pre_spike(inputs[0]), .post_spike(spike_out), .learn(learn), .clk(clk), .reset(reset), .activation(acts[0:7]   ));
synapse s1(.pre_spike(inputs[1]), .post_spike(spike_out), .learn(learn), .clk(clk), .reset(reset), .activation(acts[8:15]  ));
synapse s2(.pre_spike(inputs[2]), .post_spike(spike_out), .learn(learn), .clk(clk), .reset(reset), .activation(acts[16:23] ));
synapse s3(.pre_spike(inputs[3]), .post_spike(spike_out), .learn(learn), .clk(clk), .reset(reset), .activation(acts[24:31] ));
// synapse s4(.pre_spike(inputs[4]), .post_spike(spike_out), .learn(learn), .clk(clk), .reset(reset), .activation(acts[32:39] ));
// synapse s5(.pre_spike(inputs[5]), .post_spike(spike_out), .learn(learn), .clk(clk), .reset(reset), .activation(acts[40:47] ));
// synapse s6(.pre_spike(inputs[6]), .post_spike(spike_out), .learn(learn), .clk(clk), .reset(reset), .activation(acts[48:55] ));
// synapse s7(.pre_spike(inputs[7]), .post_spike(spike_out), .learn(learn), .clk(clk), .reset(reset), .activation(acts[56:63] ));

// wire [0:31] sum_0;
// add8 a00(.in_a(acts[0:7]  ), .in_b(acts[8:15] ), .sum(sum_0[0:7]  ), .carry_in(1'b0), .carry_out());
// add8 a01(.in_a(acts[16:23]), .in_b(acts[24:31]), .sum(sum_0[8:15] ), .carry_in(1'b0), .carry_out());
// add8 a02(.in_a(acts[32:39]), .in_b(acts[40:47]), .sum(sum_0[16:23]), .carry_in(1'b0), .carry_out());
// add8 a03(.in_a(acts[48:55]), .in_b(acts[56:63]), .sum(sum_0[24:31]), .carry_in(1'b0), .carry_out());
wire [0:15] sum_1;
add8 a10(.in_a(acts[0:7]  ), .in_b(acts[8:15] ), .sum(sum_1[0:7] ), .carry_in(1'b0), .carry_out());
add8 a11(.in_a(acts[16:23]), .in_b(acts[24:31]), .sum(sum_1[8:15]), .carry_in(1'b0), .carry_out());
wire [0:7] sum_2;
add8 a2(.in_a(sum_1[0:7]), .in_b(sum_1[8:15]), .sum(sum_2[0:7]), .carry_in(1'b0), .carry_out());

wire [0:7] sum_3;
wire [0:7] reg_out;
wire [0:7] decay_out;
reg8 acc(.write(sum_3[0:7]), .read(reg_out[0:7]), .clk(clk), .reset(reset));
decay leak(.in(reg_out[0:7]), .out(decay_out[0:7]));
add8 a3(.in_a(sum_2[0:7]), .in_b(decay_out[0:7]), .sum(sum_3[0:7]), .carry_in(1'b0), .carry_out(spike_out));

endmodule