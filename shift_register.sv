module shift_register #(parameter DIRECTION = 1) (
    input clk,
    input rst,
    input data,
    input wr_en,
    output [31:0] out
);

reg [31:0] shift_reg;

always @(posedge clk) begin
    if (rst) begin
        shift_reg <= 32'b0;
    end else if (wr_en) begin
        if (DIRECTION == 1) begin
            shift_reg <= {data, shift_reg[31:1]};
        end else begin
            shift_reg <= {shift_reg[30:0], data};
        end
    end
end

assign out = shift_reg;

endmodule