module counter#(
    parameter DWIDTH = 8)(
    input  wire                  CLK,
    input  wire                  RST,
    input  wire                  CE,
    input  wire                  SCLR,
    output wire [(DWIDTH - 1):0] Q
    );

    reg  [(DWIDTH - 1):0] q_reg;

    assign Q = q_reg;

    always @(posedge CLK or negedge RST) begin
        if (~RST) q_reg <= {DWIDTH{1'h0}};
        else begin
            if (CE) begin
              if (SCLR) q_reg <= {DWIDTH{1'h0}};
              else      q_reg <= q_reg + {{(DWIDTH - 1){1'h0}}, 1'h1};
            end
            else q_reg <= q_reg;
        end
    end

endmodule
