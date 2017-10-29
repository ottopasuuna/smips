module program_sequencer(
    input clk,
    input reset,
    input pc_src,
    input [31:0] branch_target,
    output [31:0] i_addr
);

    reg [31:0] pc;

    /* Increment pc by 4 */
    wire [31:0] pc_incr;
    assign pc_incr = pc + 4;

    // pc source multiplexer
    always @(posedge clk) begin
        if(reset == 1'b1)
            pc = 32'd0;
        else
            case(pc_src)
                1'b0: pc = pc_incr;
                1'b1: pc = pc_incr + (branch_target << 2);
                default: pc = pc_incr;
            endcase
    end

    assign i_addr = pc;

endmodule
