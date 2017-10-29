// TODO: fix rom size and indexing
module instruction_memory(
    input clk,
    input reset,
    input [31:0] i_addr,
    output reg [31:0] instruction
);

    integer i;

    reg [31:0] rom [0:255];
    always @(posedge clk) begin
        if(reset == 1'b1)
            for(i=0; i<256; i++)
                rom[i] = 32'd0;
        instruction <= rom[i_addr[7:0]];
    end

endmodule
