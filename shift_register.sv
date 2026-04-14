module shift_register #(parameter DIRECTION = 1) (
    input clk,
    input rst,
    input data,
    input wr_en,
    output [31:0] out
);

reg [31:0] out;

always @(posedge clk) begin
    if (rst) begin
        out <= 32'b0;
    end else if (wr_en) begin
        if (DIRECTION == 1) begin
            out <= {data, out[31:1]};
        end else begin
            out <= {out[30:0], data};
        end
    end
end

endmodule