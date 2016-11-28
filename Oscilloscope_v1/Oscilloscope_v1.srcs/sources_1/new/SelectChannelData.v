`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2016 02:41:43 PM
// Design Name: 
// Module Name: SelectChannelData
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


module SelectChannelData
    #(parameter SAMPLE_BITS = 12)
    (input clock,
    input [SAMPLE_BITS-1:0] channel1,
    input [SAMPLE_BITS-1:0] channel2,
    input positiveSlopeChannel1,
    input positiveSlopeChannel2,
    input channelSelected,
    output reg [SAMPLE_BITS-1:0] channelSelectedData,
    output reg positiveSlopeChannelSelected
    );
    
    always @(posedge clock) begin
        if (channelSelected) begin
            channelSelectedData <= channel2;
            positiveSlopeChannelSelected <= positiveSlopeChannel2;
        end else begin
            channelSelectedData <= channel1;
            positiveSlopeChannelSelected <= positiveSlopeChannel1;
        end
    end
    
endmodule
