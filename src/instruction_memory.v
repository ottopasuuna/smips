// TODO: fix rom size and indexing
module instruction_memory(
    input clk,
    input [31:0] i_addr,
    output reg [31:0] instruction
);

    reg [31:0] rom [0:255];
    always @(posedge clk) begin
        instruction <= rom[i_addr[7:0]];
    end

endmodule
