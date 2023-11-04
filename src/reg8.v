module reg8(
    input   wire [0:7]  write,
    output  reg  [0:7]  read,
    input   wire        clk,
    input   wire        reset
);

always @(posedge clk) begin
    read[0:7] <= write[0:7] & {8{reset}};
end

endmodule