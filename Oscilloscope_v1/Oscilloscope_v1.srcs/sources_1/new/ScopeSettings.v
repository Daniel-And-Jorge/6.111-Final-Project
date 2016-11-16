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
    #(parameter DATA_BITS = 12, SAMPLE_PERIOD_BITS = 6, SCALE_FACTOR_SIZE = 5,
      parameter TRIGGER_THRESHOLD_ADJUST = 3 << (DATA_BITS - 7))
    (input clock,
     input [7:0] sw,
     input btnu, input btnd, input btnc,
     output reg signed [DATA_BITS-1:0]triggerThreshold = 0,
     output reg signed [SCALE_FACTOR_SIZE-1:0]verticalShiftLeftFactor = 0, // negative means shift right
     output reg [SAMPLE_PERIOD_BITS-1:0]samplePeriod = 0
    );
    
    always @(posedge clock) begin
        case (sw[1:0])
          2'b00: 
             // adjust trigger threshold
             if (btnu) triggerThreshold <= triggerThreshold + TRIGGER_THRESHOLD_ADJUST;
             else if (btnd) triggerThreshold <= triggerThreshold - TRIGGER_THRESHOLD_ADJUST;
         2'b01:
            // adjust vertical scaling
            if (btnu) verticalShiftLeftFactor <= verticalShiftLeftFactor + 1;
            else if (btnd) verticalShiftLeftFactor <= verticalShiftLeftFactor - 1;
         2'b10:
            // adjust sample rate
            if (btnu) samplePeriod <= samplePeriod + 1;
            else if (btnd) samplePeriod <= samplePeriod - 1;
       endcase
       
       if (btnc) begin
            triggerThreshold <= 0;
            verticalShiftLeftFactor <= 0;
            samplePeriod <= 0;
       end
    end
endmodule
