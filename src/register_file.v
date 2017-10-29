module register_file(
    input clk,
    input reset,
    input write_enable,
    input [4:0] reg_1, reg_2, write_reg,
    input [31:0] write_data,
    output reg [31:0] data_1, data_2
);

    reg [31:0] reg_file [31:0];
    integer i; // just to index the reg_file on reset

    always @(posedge clk) begin
        if(reset == 1'b1)
            for(i=0; i<32; i++)
                reg_file[i] = 32'd0;
        else begin
            data_1 <= reg_file[reg_1];
            data_2 <= reg_file[reg_2];
            if(write_enable) begin
                reg_file[write_reg] <= write_data;
            end
        end
    end

endmodule
