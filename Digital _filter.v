module fir_filter (
    input clk,
    input reset,
    input [7:0] x_in,
    output reg [15:0] y_out
);

parameter N = 4;
reg [7:0] x [0:N-1];
reg [7:0] coeff [0:N-1];
integer i;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (i = 0; i < N; i = i + 1) begin
            x[i] <= 0;
            coeff[i] <= 8'd1;  // all coefficients = 1
        end
        y_out <= 0;
    end else begin
        for (i = N-1; i > 0; i = i - 1)
            x[i] <= x[i-1];
        x[0] <= x_in;

        y_out = 0;
        for (i = 0; i < N; i = i + 1)
            y_out = y_out + x[i] * coeff[i];
    end
end

endmodule
