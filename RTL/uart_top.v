module uart_top(
    input clk,
    input rst_n,
    input uart_rx,
    output uart_tx,
    output [9:0] led
);

wire [7:0] rx_data;
wire rx_done;
wire rx_error;
wire tx_busy;

reg tx_start;
reg rx_done_d;
reg received_flag;
reg error_flag;

uart_rx receiver(
    .clk(clk),
    .rst(~rst_n),
    .rx(uart_rx),
    .rx_data(rx_data),
    .rx_done(rx_done),
    .rx_error(rx_error)
);

uart_tx transmitter(
    .clk(clk),
    .rst(~rst_n),
    .tx_start(tx_start),
    .tx_data(rx_data),
    .tx(uart_tx),
    .tx_busy(tx_busy)
);

always @(posedge clk) begin

    if (~rst_n) begin
        rx_done_d <= 1'b0;
        tx_start <= 1'b0;
        received_flag <= 1'b0;
        error_flag <= 1'b0;
    end

    else begin

        tx_start <= rx_done;
        rx_done_d <= rx_done;

        if (rx_done)
            received_flag <= 1'b1;

        if (rx_error)
            error_flag <= 1'b1;

    end

end

assign led[7:0] = rx_data;
assign led[8] = received_flag;
assign led[9] = error_flag;

endmodule