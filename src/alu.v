`define AND    3'b000
`define OR     3'b001
`define ADD    3'b010
`define SUB    3'b110
`define SET_LT 3'b111

module alu(
    input  [2:0]  ctl,
    input  [31:0] data_1,
    input  [31:0] data_2,
    output reg [31:0] res
);

    always @ * begin
        case(ctl)
            `ADD: res = data_1 + data_2;
            `SUB: res = data_1 - data_2;
            `AND: res = data_1 & data_2;
            `OR:  res = data_1 | data_2;
            default: res = 32'b0;
        endcase
    end

endmodule
