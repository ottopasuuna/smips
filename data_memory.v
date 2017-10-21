// TODO: fix number of memory locations
module data_memory(
    input clk,
    input [31:0] address, write_data,
    input write_enable,
    output reg [31:0] rdata
);

    reg [31:0] ram [0:255];

    always @(posedge clk) begin
        if (write_enable == 1'b1) begin
            ram[address] <= write_data;
        end

        rdata = ram[address];
    end


endmodule
