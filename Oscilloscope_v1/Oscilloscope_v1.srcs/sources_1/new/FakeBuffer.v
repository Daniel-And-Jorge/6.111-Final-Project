`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2016 03:10:23 PM
// Design Name: 
// Module Name: FakeBuffer
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


module ConstantFakeBuffer
    #(parameter ADDRESS_BITS = 10,
                DATA_BITS = 12,
                VOLTAGE = 300)
    (input [ADDRESS_BITS-1:0] address,
    output [DATA_BITS-1:0] dataOut
    );
    
    assign dataOut = VOLTAGE;
    
endmodule
