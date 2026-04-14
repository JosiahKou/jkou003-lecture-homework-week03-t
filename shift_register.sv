module shift_register #(parameter DIRECTION = 1) (
    input logic clk,
    input logic rst,
    input logic data,
    input logic wr_en,
    output logic [31:0] out
);

logic [31:0] reg_value;

always_ff @(posedge clk) begin
    if (rst) begin
        reg_value <= 32'b0;
    end else if (wr_en) begin
        if (DIRECTION == 1) begin
            reg_value <= {data, reg_value[31:1]};
        end else begin
            reg_value <= {reg_value[30:0], data};
        end
    end
end

assign out = reg_value;

endmodule