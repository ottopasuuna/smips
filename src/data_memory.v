// TODO: fix number of memory locations
module data_memory(
    input clk,
    input reset,
    input [31:0] address, write_data,
    input write_enable,
    output reg [31:0] rdata
);

    reg [31:0] ram [0:255];
    integer i;

    always @(posedge clk) begin
        if (reset == 1'b1)
            for(i=0; i<256; i++)
                ram[i] = 32'd0;
        else begin
            if (write_enable == 1'b1) begin
                ram[address] <= write_data;
            end

            rdata = ram[address];
        end
    end


endmodule
