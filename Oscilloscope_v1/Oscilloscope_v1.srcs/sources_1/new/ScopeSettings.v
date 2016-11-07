`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2016 10:32:08 PM
// Design Name: 
// Module Name: ScopeSettings
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


module ScopeSettings
    #(parameter DATA_BITS = 12)
    (input [7:0] sw,
    output wire signed [DATA_BITS-1:0]triggerThreshold
    );
    
    // interpret as ones complement for ease of use
    assign triggerThreshold = (sw[6:0] << (DATA_BITS - 7)) * (sw[7] ? -1 : 1);
endmodule
