`timescale 1ns/1ps

module uart_tx_tb;

reg clk;
reg rst;
reg tx_start;
reg [7:0] tx_data;

wire tx;
wire tx_busy;

uart_tx uut(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(tx),
    .tx_busy(tx_busy)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    tx_start = 0;
    tx_data = 8'b00000000;

    #100;
    rst = 0;

    #100;
    tx_data = 8'b10101010;
    tx_start = 1;

    #10;
    tx_start = 0;

    wait(tx_busy == 0);

    #1000;

    $finish;

end

endmodule