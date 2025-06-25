`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:03 06/25/2025 
// Design Name: 
// Module Name:    processor_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module processor_unit (
    input [7:0] data_in,
    input trigger, reset, clk,
    output reg finished,
    output reg [7:0] result
);

    integer idx;
    reg write_en;
    parameter mem_size = 16;

    // ROM
    reg [7:0] ROM [0:mem_size-1];
    initial begin
        $readmemh("hexFile.mem", ROM);
    end

    // RAM
    reg [7:0] RAM [0:mem_size-1];

    always @(posedge clk) begin
        if (reset) begin
            finished <= 0;
            idx <= 0;
            write_en <= 1;
        end else begin
            if (trigger) begin
                if (idx < mem_size) begin
                    if (write_en) begin
                        RAM[idx] <= data_in;
                        idx <= idx + 1;
                    end else begin
                        result <= RAM[idx] * ROM[idx];
                        idx <= idx + 1;
                        if (idx == mem_size - 1)
                            finished <= 1;
                    end
                end else begin
                    if (!finished) begin
                        write_en <= 0;
                        idx <= 0;
                    end
                end
            end
        end
    end

endmodule
