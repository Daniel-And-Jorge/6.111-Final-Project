`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2016 09:27:39 PM
// Design Name: 
// Module Name: fake_data_source
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


module fake_data_source(
    input clock,
    output ready,
    output [11:0] dataOut
    );
    
    reg [3:0] state;
    
    always @(posedge clock) begin
        if (!ready) begin
            state <= state + 1;
            ready <= 1;
            dataOut <= state;
        end else
            ready <= 0;
    end
endmodule
