`include "alu_ops.vh"

module alu_control(
    input [1:0] alu_op,
    input [5:0] funct,
    output reg [3:0] alu_ctrl
);

    always @ * begin
        case(alu_op)
            2'b00: alu_ctrl = `ADD; // LW, SW
            2'b01: alu_ctrl = `SUB; // Branch equal
            2'b10: begin // R-Type
                case(funct)
                    6'b100000: alu_ctrl = `ADD;
                    6'b100010: alu_ctrl = `SUB;
                    6'b100100: alu_ctrl = `AND;
                    6'b100101: alu_ctrl = `OR;
                    6'b101010: alu_ctrl = `SET_LT;
                    default: alu_ctrl = 4'b0;
                endcase
            end
            default: alu_ctrl = 4'b0;
        endcase
    end

endmodule
