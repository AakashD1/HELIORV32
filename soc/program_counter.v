`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2025 02:55:59
// Design Name: 
// Module Name: program_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module program_counter #(parameter BIT_WIDTH = 32)(
    input clock, reset,
    input [BIT_WIDTH - 1:0] ADDRESS_IN,
    output reg [BIT_WIDTH - 1:0] ADDRESS_OUT
    );
    
    initial ADDRESS_OUT = {BIT_WIDTH{1'b0}};
    
    always @(posedge clock)
        begin
            if(reset)
                ADDRESS_OUT <= {BIT_WIDTH{1'b0}};
            else
                ADDRESS_OUT <= ADDRESS_IN;
        end
endmodule