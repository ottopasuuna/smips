module register_file(
    input clk,
    input write_enable,
    input [4:0] reg_1, reg_2, write_reg,
    input [31:0] write_data,
    output reg [31:0] data_1, data_2
);

    reg [31:0] reg_file [31:0];

    always @(posedge clk) begin
        data_1 <= reg_file[reg_1];
        data_2 <= reg_file[reg_2];
        if(write_enable) begin
            reg_file[write_reg] <= write_data;
        end
    end

endmodule
