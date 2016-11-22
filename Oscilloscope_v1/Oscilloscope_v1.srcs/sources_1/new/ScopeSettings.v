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
      parameter TRIGGER_THRESHOLD_ADJUST = 3 << (DATA_BITS - 7))
    (input clock,
     input [7:0] sw,
     input btnu, input btnd, input btnc, input btnl,
     input signed [DATA_BITS-1:0] signalMin,
     input signed [DATA_BITS-1:0] signalMax,
     input [DATA_BITS-1:0] signalPeriod,
     output reg signed [DATA_BITS-1:0]triggerThreshold = 0,
     output reg [SCALE_FACTOR_SIZE-1:0]verticalScaleFactorTimes8 = 8,
     output reg [SAMPLE_PERIOD_BITS-1:0]samplePeriod = 0
    );
    
    wire [SCALE_FACTOR_SIZE-1:0] optimalScale;
    wire [SCALE_FACTOR_SIZE-1:0] biggestScaleToSeeMax = (512 * 8 / `ABS(signalMax));
    wire [SCALE_FACTOR_SIZE-1:0] biggestScaleToSeeMin = (512 * 8 / `ABS(signalMin));
    
    assign optimalScale = (biggestScaleToSeeMax > biggestScaleToSeeMin) ? biggestScaleToSeeMin : biggestScaleToSeeMax;
    
    always @(posedge clock) begin
        // manual adjust
        case (sw[1:0])
          2'b00: 
             // adjust trigger threshold
             if (btnu) triggerThreshold <= triggerThreshold + TRIGGER_THRESHOLD_ADJUST;
             else if (btnd) triggerThreshold <= triggerThreshold - TRIGGER_THRESHOLD_ADJUST;
         2'b01:
            // adjust vertical scaling
            if (btnu) verticalScaleFactorTimes8 <= verticalScaleFactorTimes8 * 2;
            else if (btnd) verticalScaleFactorTimes8 <= verticalScaleFactorTimes8 / 2;
         2'b10:
            // adjust sample rate
            if (btnu) samplePeriod <= samplePeriod + 1;
            else if (btnd) samplePeriod <= samplePeriod - 1;
       endcase
       
       // autoset
       if (btnl) begin
            triggerThreshold <= (signalMax + signalMin) / 2;
            // / 64 = / 512 * 8
            verticalScaleFactorTimes8 <= optimalScale;
            samplePeriod <= (3 * signalPeriod / 1280);
       end
            
       // reset to default settings
       if (btnc) begin
            triggerThreshold <= 0;
            verticalScaleFactorTimes8 <= 8;
            samplePeriod <= 0;
       end
    end
endmodule
