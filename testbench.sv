# testbench.sv

module tb_crc32;

    reg clk = 0;
    reg rst;
    reg data_in;
    reg enable;
    wire [31:0] crc_out;

    crc32_generator dut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .enable(enable),
        .crc_out(crc_out)
    );

    always #5 clk = ~clk;

    reg [7:0] data = 8'b10101011;
    integer i;

    initial begin
        // 🔥 REQUIRED FOR EPWave
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_crc32);

        rst = 1;
        enable = 0;
        data_in = 0;

        #10 rst = 0;
        enable = 1;

        for (i = 7; i >= 0; i = i - 1) begin
            data_in = data[i];
            #10;
        end

        enable = 0;
        #50;

        $display("CRC32 Output = %h", crc_out);
        $finish;
    end

endmodule
