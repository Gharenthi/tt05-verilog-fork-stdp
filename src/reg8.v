module reg8(
    input   wire [0:7]  write,
    output  wire [0:7]  read,
    input   wire        clk
);

logic [0:7] mem;

always @(posedge clk){
    mem [0:7] <= write [0:7]
}

endmodule