`include "opcodes.vh"

module control_unit(
    input [5:0] operation,
    output reg [1:0] alu_op,
    output reg reg_dst,
    output reg branch,
    output reg mem_read,
    output reg mem_write,
    output reg mem_to_reg,
    output reg alu_src,
    output reg reg_write_enable
);

    // reg_dst
    always @ *
        case(operation)
            `R_FORMAT: reg_dst = 1'b1;
            default:   reg_dst = 1'b0;
        endcase

    // branch
    always @ *
        case(operation)
            `BEQ:    branch = 1'b1;
            default: branch = 1'b0;
        endcase

    // mem_read
    always @ *
        case(operation)
            `LW:     mem_read = 1'b1;
            default: mem_read = 1'b0;
        endcase

    // mem_write
    always @ *
        case(operation)
            `SW:     mem_write = 1'b1;
            default: mem_write = 1'b0;
        endcase

    // mem_to_reg
    always @ *
        case(operation)
            `LW:     mem_to_reg = 1'b1;
            default: mem_to_reg = 1'b0;
        endcase

    // alu_src
    always @ *
        case(operation)
            `LW:     alu_src = 1'b1;
            `SW:     alu_src = 1'b1;
            default: alu_src = 1'b0;
        endcase

    // reg_write_enable
    always @ *
        case(operation)
            `R_FORMAT: reg_write_enable = 1'b1;
            `LW:       reg_write_enable = 1'b1;
            default:   reg_write_enable = 1'b0;
        endcase

    // alu_op
    always @ *
        case(operation)
            `R_FORMAT: alu_op = 2'b10;
            `BEQ:      alu_op = 2'b01;
            default:   alu_op = 2'b00;
        endcase


endmodule
