`timescale 1ns/1ps

module uart_tb;

reg clk;
reg rst;
reg tx_start;
reg [7:0] tx_data;

wire tx;
wire [7:0] rx_data;
wire rx_done;
wire rx_error;

uart_tx transmitter(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(tx),
    .tx_busy()
);

uart_rx receiver(
    .clk(clk),
    .rst(rst),
    .rx(tx),
    .rx_data(rx_data),
    .rx_done(rx_done),
    .rx_error(rx_error)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    tx_start = 0;
    tx_data = 8'h00;

    #100;
    rst = 0;

    #100;

    tx_data = 8'hAA;
    tx_start = 1;

    #10;
    tx_start = 0;

    wait(rx_done == 1);

    #10;

    if (rx_data == 8'hAA)
        $display("UART TEST PASSED: Received AA");
    else
        $display("UART TEST FAILED: Received %h", rx_data);

    if (rx_error == 1)
        $display("UART ERROR DETECTED");

    #100;

    $finish;

end

endmodule