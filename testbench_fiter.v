module tb_fir_filter;
    reg clk, reset;
    reg [7:0] x_in;
    wire [15:0] y_out;

    fir_filter uut (.clk(clk), .reset(reset), .x_in(x_in), .y_out(y_out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10 reset = 0;

        x_in = 8'd5; #10;
        x_in = 8'd10; #10;
        x_in = 8'd15; #10;
        x_in = 8'd20; #10;
        x_in = 8'd25; #10;

        #100;
        $stop;
    end
endmodule
