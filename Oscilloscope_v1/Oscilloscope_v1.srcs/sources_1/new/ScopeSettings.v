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
    #(parameter DATA_BITS = 12, SAMPLE_PERIOD_BITS = 6, SCALE_FACTOR_SIZE = 10,
      parameter TRIGGER_THRESHOLD_ADJUST = 3 << (DATA_BITS - 7),
                SCALE_EXPONENT_BITS = 4,
                DISPLAY_Y_BITS = 12,
                INCREASE_PIXEL_COUNT = 1000000, //1,000,000
                COUNT_BITS = 20)
    (input clock,
     input [15:0] sw,
     input btnu, input btnd, input btnc, input btnl,
     input buttonUpClean, input buttonDownClean,
     input signed [DATA_BITS-1:0] signalMinChannel1,
     input signed [DATA_BITS-1:0] signalMaxChannel1,
     input [DATA_BITS-1:0] signalPeriodChannel1,
     input signed [DATA_BITS-1:0] signalMinChannel2,
     input signed [DATA_BITS-1:0] signalMaxChannel2,
     input [DATA_BITS-1:0] signalPeriodChannel2,
     output reg signed [DATA_BITS-1:0]triggerThreshold = 0,
     output reg [SCALE_FACTOR_SIZE-1:0]verticalScaleFactorTimes8Channel1 = 8,
     output reg [SCALE_FACTOR_SIZE-1:0]verticalScaleFactorTimes8Channel2 = 8,
     output reg [SAMPLE_PERIOD_BITS-1:0]samplePeriod = 0,
     output reg channelSelected,
     output wire xyDisplayMode,
     output wire fftDisplayMode,
     output reg signed [DISPLAY_Y_BITS-1:0] yCursor1 = 12'd0,
     output reg signed [DISPLAY_Y_BITS-1:0] yCursor2 = 12'd0
    );
    
    wire [SCALE_FACTOR_SIZE-1:0] optimalScaleChannel1;
    wire [SCALE_FACTOR_SIZE-1:0] biggestScaleToSeeMaxChannel1 = (512 * 8 / `ABS(signalMaxChannel1));
    wire [SCALE_FACTOR_SIZE-1:0] biggestScaleToSeeMinChannel1 = (512 * 8 / `ABS(signalMinChannel1));
    
    wire [SCALE_FACTOR_SIZE-1:0] optimalScaleChannel2;
    wire [SCALE_FACTOR_SIZE-1:0] biggestScaleToSeeMaxChannel2 = (512 * 8 / `ABS(signalMaxChannel2));
    wire [SCALE_FACTOR_SIZE-1:0] biggestScaleToSeeMinChannel2 = (512 * 8 / `ABS(signalMinChannel2));
    
    assign optimalScaleChannel1 = (biggestScaleToSeeMaxChannel1 > biggestScaleToSeeMinChannel1) ? 
                            biggestScaleToSeeMinChannel1 : biggestScaleToSeeMaxChannel1;
    assign optimalScaleChannel2 = (biggestScaleToSeeMaxChannel2 > biggestScaleToSeeMinChannel2) ? 
                            biggestScaleToSeeMinChannel2 : biggestScaleToSeeMaxChannel2;
                            
    reg [COUNT_BITS-1:0] count;
    
    assign xyDisplayMode = sw[8];
    assign fftDisplayMode = sw[9];
    
    always @(posedge clock) begin
        // manual adjust
        case (sw[4:0])
          5'b00000: 
             // adjust trigger threshold
             if (btnu) triggerThreshold <= triggerThreshold + TRIGGER_THRESHOLD_ADJUST;
             else if (btnd) triggerThreshold <= triggerThreshold - TRIGGER_THRESHOLD_ADJUST;
         5'b00001:
            // adjust vertical scaling channel1
            if (btnu) begin
                verticalScaleFactorTimes8Channel1 <= verticalScaleFactorTimes8Channel1 * 2;
            end else if (btnd) begin
                verticalScaleFactorTimes8Channel1 <= verticalScaleFactorTimes8Channel1 / 2;
            end
         5'b00010:
            // adjust vertical scaling channel2
             if (btnu) begin
                verticalScaleFactorTimes8Channel2 <= verticalScaleFactorTimes8Channel2 * 2;
             end else if (btnd) begin
                verticalScaleFactorTimes8Channel2 <= verticalScaleFactorTimes8Channel2 / 2;
             end
         5'b00100:
            // adjust sample rate
            if (btnu) samplePeriod <= samplePeriod + 1;
            else if (btnd) samplePeriod <= samplePeriod - 1;
         5'b01000:
            // select channel to trigger on
            if (btnu) channelSelected = ~channelSelected;
            else if (btnd) channelSelected = ~channelSelected;
         5'b10000:
            //adjust cursor 1
            if (buttonUpClean) begin
                if (count > INCREASE_PIXEL_COUNT) begin
                    count <= 0;
                    yCursor1 <= yCursor1 + 1;
                end else begin
                    count <= count + 1;
                end
            end else if (buttonDownClean) begin
                if (count > INCREASE_PIXEL_COUNT) begin
                    count <= 0;
                    yCursor1 <= yCursor1 - 1;
                end else begin
                    count <= count + 1;
                end
            end else begin
                count <= 0;
            end
         5'b10001:
            //adjust cursor 1
             if (buttonUpClean) begin
                 if (count > INCREASE_PIXEL_COUNT) begin
                     count <= 0;
                     yCursor2 <= yCursor2 + 1;
                 end else begin
                     count <= count + 1;
                 end
             end else if (buttonDownClean) begin
                 if (count > INCREASE_PIXEL_COUNT) begin
                     count <= 0;
                     yCursor2 <= yCursor2 - 1;
                 end else begin
                     count <= count + 1;
                 end
             end else begin
                 count <= 0;
             end
         default:
            ;//do nothing
       endcase
       
       // autoset
       if (btnl) begin
            if (channelSelected) begin //channel 2 selected
                triggerThreshold <= (signalMaxChannel2 + signalMinChannel2) / 2;
                // / 64 = / 512 * 8
                verticalScaleFactorTimes8Channel2 <= optimalScaleChannel2;
                samplePeriod <= (3 * signalPeriodChannel2 / 1280);
            end else begin
                triggerThreshold <= (signalMaxChannel1 + signalMinChannel1) / 2;
                // / 64 = / 512 * 8
                verticalScaleFactorTimes8Channel1 <= optimalScaleChannel1;
                samplePeriod <= (3 * signalPeriodChannel1 / 1280);
            end
       end
            
       // reset to default settings
       if (btnc) begin
            triggerThreshold <= 0;
            verticalScaleFactorTimes8Channel1 <= 8;
            verticalScaleFactorTimes8Channel2 <= 8;
            samplePeriod <= 0;
       end
    end
    
endmodule
