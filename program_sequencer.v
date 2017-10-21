module program_sequencer(
    input clk,
    output [31:0] i_addr
);

    reg [31:0] pc;

    always @(posedge clk) begin
        pc = pc+4;
    end

    assign i_addr = pc;

endmodule
