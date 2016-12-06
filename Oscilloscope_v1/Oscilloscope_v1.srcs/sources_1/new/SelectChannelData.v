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
    #(parameter SAMPLE_BITS = 12,
                SCALE_FACTOR_BITS = 10,
                SCALE_EXPONENT_BITS = 4)
    (input clock,
    input [SAMPLE_BITS-1:0] channel1,
    input [SAMPLE_BITS-1:0] channel2,
    input positiveSlopeChannel1,
    input positiveSlopeChannel2,
    input [SCALE_FACTOR_BITS-1:0] verticalScaleFactorTimes8Channel1,
    input [SCALE_FACTOR_BITS-1:0] verticalScaleFactorTimes8Channel2,
    input [SCALE_EXPONENT_BITS-1:0] verticalScaleExponentChannel1,
    input [SCALE_EXPONENT_BITS-1:0] verticalScaleExponentChannel2,
    input channelSelected,
    output reg [SAMPLE_BITS-1:0] channelSelectedData,
    output reg positiveSlopeChannelSelected,
    output reg [SCALE_FACTOR_BITS-1:0] verticalScaleFactorTimes8ChannelSelected,
    output reg [SCALE_EXPONENT_BITS-1:0] verticalScaleExponentChannelSelected
    );
    
    always @(posedge clock) begin
        if (channelSelected) begin
            channelSelectedData <= channel2;
            positiveSlopeChannelSelected <= positiveSlopeChannel2;
            verticalScaleFactorTimes8ChannelSelected <= verticalScaleFactorTimes8Channel2;
            verticalScaleExponentChannelSelected <= verticalScaleExponentChannel2;
        end else begin
            channelSelectedData <= channel1;
            positiveSlopeChannelSelected <= positiveSlopeChannel1;
            verticalScaleFactorTimes8ChannelSelected <= verticalScaleFactorTimes8Channel1;
            verticalScaleExponentChannelSelected <= verticalScaleExponentChannel1;
        end
    end
    
endmodule
