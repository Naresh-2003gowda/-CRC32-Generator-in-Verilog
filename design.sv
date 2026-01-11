# design.sv

module crc32_generator (
    input  wire        clk,
    input  wire        rst,
    input  wire        data_in,
    input  wire        enable,
    output reg [31:0]  crc_out
);

    parameter POLY = 32'h04C11DB7;
    reg feedback;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            crc_out <= 32'hFFFFFFFF;
        end else if (enable) begin
            feedback = crc_out[31] ^ data_in;
            crc_out <= {crc_out[30:0], 1'b0};
            if (feedback)
                crc_out <= ({crc_out[30:0], 1'b0}) ^ POLY;
        end
    end
endmodule
