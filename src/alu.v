`include "alu_ops.vh"

module alu(
    input  [3:0]  ctl,
    input  [31:0] data_1,
    input  [31:0] data_2,
    output reg [31:0] res,
    output zero
);

    always @ * begin
        case(ctl)
            `ADD: res = data_1 + data_2;
            `SUB: res = data_1 - data_2;
            `AND: res = data_1 & data_2;
            `OR:  res = data_1 | data_2;
            `NOR: res = ~(data_1 | data_2);
            default: res = 32'b0;
        endcase
    end

    assign zero = res == 32'd0;

    `ifdef COCOTB_SIM
        initial begin
            $dumpfile("alu.vcd");
            $dumpvars(0, alu);
        end
    `endif

endmodule
