module smips(
    input clk
);

    wire [31:0] i_addr, instruction;
    wire [31:0] data_1, data_2, res;
    wire [2:0] alu_ctrl;
    wire write_enable;

    alu alu(.ctl(alu_ctrl), .*);
    instruction_memory inst_memory(.*);
    register_file reg_file(
        .reg_1(instruction[25:21]),
        .reg_2(instruction[20:16]),
        .write_reg(instruction[15:11]),
        .write_data(res),
        .*
    );
    program_sequencer prog_seq(.*);


endmodule
