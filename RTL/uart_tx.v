module uart_tx(
    input clk,
    input rst,
    input tx_start,
    input [7:0] tx_data,
    output reg tx,
    output reg tx_busy
);

parameter CLK_FREQ = 100_000_000;
parameter BAUD_RATE = 9600;
localparam BAUD_COUNT = CLK_FREQ / BAUD_RATE;

reg [13:0] baud_counter;
reg [3:0] bit_index;
reg [9:0] tx_shift_reg;

always @(posedge clk) begin
    if (rst) begin
        tx <= 1'b1;
        tx_busy <= 1'b0;
        baud_counter <= 0;
        bit_index <= 0;
        tx_shift_reg <= 10'b1111111111;
    end
    else begin

        if (tx_start && !tx_busy) begin
            tx_shift_reg <= {1'b1, tx_data, 1'b0};
            tx_busy <= 1'b1;
            baud_counter <= 0;
            bit_index <= 0;
            tx <= 1'b0;
        end

        else if (tx_busy) begin

            if (baud_counter < BAUD_COUNT - 1) begin
                baud_counter <= baud_counter + 1;
            end
            else begin
                baud_counter <= 0;

                if (bit_index < 9) begin
                    bit_index <= bit_index + 1;
                    tx <= tx_shift_reg[bit_index + 1];
                end
                else begin
                    tx_busy <= 1'b0;
                    tx <= 1'b1;
                end
            end
        end
    end
end

endmodule