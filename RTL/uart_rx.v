module uart_rx(
    input clk,
    input rst,
    input rx,
    output reg [7:0] rx_data,
    output reg rx_done,
    output reg rx_error
);

parameter CLK_FREQ = 100_000_000;
parameter BAUD_RATE = 9600;

localparam BAUD_COUNT = CLK_FREQ / BAUD_RATE;
localparam HALF_BAUD_COUNT = BAUD_COUNT / 2;

reg [13:0] baud_counter;
reg [3:0] bit_index;
reg [7:0] rx_shift_reg;
reg rx_busy;

always @(posedge clk) begin

    if (rst) begin
        baud_counter <= 0;
        bit_index <= 0;
        rx_shift_reg <= 0;
        rx_data <= 0;
        rx_done <= 0;
        rx_error <= 0;
        rx_busy <= 0;
    end

    else begin

        rx_done <= 0;
        rx_error <= 0;

        if (!rx_busy) begin

            if (rx == 1'b0) begin
                rx_busy <= 1'b1;
                baud_counter <= 0;
                bit_index <= 0;
            end

        end

        else begin

            if (bit_index == 0) begin

                if (baud_counter < HALF_BAUD_COUNT - 1) begin
                    baud_counter <= baud_counter + 1;
                end

                else begin
                    baud_counter <= 0;

                    if (rx == 1'b0) begin
                        bit_index <= 1;
                    end
                    else begin
                        rx_busy <= 1'b0;
                        rx_error <= 1'b1;
                    end
                end

            end

            else if (bit_index <= 8) begin

                if (baud_counter < BAUD_COUNT - 1) begin
                    baud_counter <= baud_counter + 1;
                end

                else begin
                    baud_counter <= 0;
                    rx_shift_reg[bit_index - 1] <= rx;
                    bit_index <= bit_index + 1;
                end

            end

            else begin

                if (baud_counter < BAUD_COUNT - 1) begin
                    baud_counter <= baud_counter + 1;
                end

                else begin
                    baud_counter <= 0;
                    rx_busy <= 1'b0;

                    if (rx == 1'b1) begin
                        rx_data <= rx_shift_reg;
                        rx_done <= 1'b1;
                    end
                    else begin
                        rx_error <= 1'b1;
                    end
                end
            end
        end
    end
end

endmodule