module tt_um_gharenthi_top #( parameter MAX_COUNT = 24'd10_000_000 ) (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

assign uio_out[7:0] = 8'b00000000;
assign uio_oe[7:0] =  8'b00000000;
assign uo_out[6:0] =  7'b0000000;

neuron n1(
    .inputs(ui_in[7:0]),
    .learn(1'b1),
    .spike_out(uo_out[7]),
    .clk(clk), .reset(rst_n)
);

endmodule