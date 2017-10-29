module smips(
    input clk,
    input reset
);

    // Control signals
    wire [3:0] alu_ctrl;
    wire [1:0] alu_op;
    wire alu_src;
    wire reg_dest;
    wire pc_src;
    wire reg_write_enable, ram_write_enable;
    wire write_back_select;

    wire [31:0] i_addr, instruction;
    wire [31:0] data_1, alu_res;
    wire [31:0] ram_data_out;
    wire [31:0] reg_data_2;
    wire [31:0] branch_target;
    wire [5:0]  alu_funct;

    assign alu_funct = instruction[5:0];

    // Multiplexers
    reg [31:0] reg_write_data;
    always @ * begin
        case(write_back_select)
            1'b0: reg_write_data = alu_res;
            1'b1: reg_write_data = ram_data_out;
            default: reg_write_data = alu_res;
        endcase
    end

    reg [4:0] reg_write_reg;
    always @ * begin
        case(reg_dest)
            1'b0: reg_write_reg = instruction[20:16];
            1'b1: reg_write_reg = instruction[15:11];
            default: reg_write_reg = instruction[15:11];
        endcase
    end


    reg [31:0] alu_data_2;
    always @ * begin
        case(alu_src)
            1'b0: alu_data_2 = reg_data_2;
            1'b1: alu_data_2 = branch_target; // sign extend
            default: alu_data_2 = reg_data_2;
        endcase
    end

    sign_extend jump_extend(
        .in(instruction[15:0]),
        .out(branch_target)
    );

    alu_control alu_controller(
        .funct(alu_funct),
        .*
    );

    alu alu(
        .ctl(alu_ctrl),
        .data_2(alu_data_2),
        .res(alu_res),
        .*
    );
    instruction_memory rom(.*);
    register_file reg_file(
        .reg_1(instruction[25:21]),
        .reg_2(instruction[20:16]),
        .write_reg(reg_write_reg),
        .write_data(reg_write_data),
        .write_enable(reg_write_enable),
        .data_2(reg_data_2),
        .*
    );
    program_sequencer prog_seq(.*);
    data_memory ram(
        .address(alu_res),
        .write_data(reg_data_2),
        .write_enable(ram_write_enable),
        .rdata(ram_data_out),
        .*
    );

    `ifdef COCOTB_SIM
        initial begin
            $dumpfile("waveform.vcd");
            $dumpvars(0, smips);
        end
    `endif

endmodule
