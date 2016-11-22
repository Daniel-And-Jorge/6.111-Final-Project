`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2016 03:42:36 PM
// Design Name: 
// Module Name: FakeADCC
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


module FakeADCC 
    #(parameter DATA_BITS = 12,
                MAX_COUNT = 300)
    (input clock,
    output ready,
    output reg signed [DATA_BITS-1:0] dataOut = 0
    );
    
    assign ready = 1;
    
    always @(posedge clock) begin
        if (dataOut >= MAX_COUNT) begin
            dataOut <= 0;
        end else begin
            dataOut <= dataOut + 1;
        end
    end
    
endmodule
