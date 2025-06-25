`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:29:06 06/25/2025
// Design Name:   processor_unit
// Module Name:   C:/Users/Lenovo/Documents/Downloads/ayeshatask/processor_unit_tb.v
// Project Name:  ayeshatask
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: processor_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module processor_unit_tb;

    // Inputs
    reg [7:0] data_in;
    reg trigger;
    reg reset;
    reg clk;

    // Outputs
    wire finished;
    wire [7:0] result;

    // Instantiate the Unit Under Test
    processor_unit uut (
        .data_in(data_in),
        .trigger(trigger),
        .reset(reset),
        .clk(clk),
        .finished(finished),
        .result(result)
    );

    // Clock Generation
    always #10 clk = ~clk;

    initial begin
        data_in = 0;
        trigger = 0;
        reset = 1;
        clk = 0;

        #100;
        reset = 0;
        trigger = 1;

        data_in = 8'd9;    // RAM[0]
        data_in = 8'd21;   // RAM[1]
        data_in = 8'd105;  // RAM[2]
        data_in = 8'd134;  // RAM[3]
        data_in = 8'd7;    // RAM[4]
        data_in = 8'd3;    // RAM[5]
        data_in = 8'd19;   // RAM[6]
        data_in = 8'd29;   // RAM[7]
        data_in = 8'd14;   // RAM[8]
        data_in = 8'd27;   // RAM[9]
        data_in = 8'd8;    // RAM[10]
        data_in = 8'd20;   // RAM[11]
        data_in = 8'd24;   // RAM[12]
        data_in = 8'd30;   // RAM[13]
        data_in = 8'd40;   // RAM[14]
        data_in = 8'd36;   // RAM[15]


        // Simulation pause
        #200;
    end

endmodule

