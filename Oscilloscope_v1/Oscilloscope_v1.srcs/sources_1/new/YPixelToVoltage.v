`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2016 02:41:15 PM
// Design Name: 
// Module Name: YPixelToVoltage
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


module YPixelToVoltage
    #(parameter VOLTAGE_BITS = 10,
                DISPLAY_Y_BITS = 12,
                SCALE_FACTOR_SIZE = 10,
                Y_ZERO_VOLTS = 512,
                PIXELS_RELATIVE_TO_ZERO_VOLTS_TIMES_250_BITS = 18,
                PIXELS_RELATIVE_TO_ZERO_VOLTS_TIMES_250_BITS_TIMES_DEFAULT_SCALE = 21,
                DEFAULT_SCALE_VOLTAGE_RANGE = 250,
                DISPLAY_HEIGHT = 1024,
                SCALE_TIMES_DISPLAY_HEIGHT_BITS = 20)
    (
    input clock,
    input [DISPLAY_Y_BITS-1:0] y,
    input [SCALE_FACTOR_SIZE-1:0] scale,
    output reg signed [VOLTAGE_BITS-1:0] voltage,
    output reg [VOLTAGE_BITS-1:0] voltageAbsoluteValue,
    output reg isNegative  //0 if positive 1 if negative
    );
    
    wire signed [DISPLAY_Y_BITS-1:0] pixelsRelativeToZeroVolts;
    assign pixelsRelativeToZeroVolts = Y_ZERO_VOLTS - y;
    
    reg signed [PIXELS_RELATIVE_TO_ZERO_VOLTS_TIMES_250_BITS-1:0] pixelsRelativeToZeroVoltsTimesVoltageRange;
    reg signed [PIXELS_RELATIVE_TO_ZERO_VOLTS_TIMES_250_BITS_TIMES_DEFAULT_SCALE-1:0] pixelsRelativeToZeroVoltsTimesVoltageRangeTimesDefaultScale;
    
    reg [SCALE_TIMES_DISPLAY_HEIGHT_BITS-1:0] scaleTimesDisplayHeight;
    reg [SCALE_TIMES_DISPLAY_HEIGHT_BITS-1:0] scaleTimesDisplayHeightCycle1;
    
    reg a;
    reg b;
    reg c;
    
    always @(posedge clock) begin
        //voltage = y*DEFAULT_VOLTAGE_RANGE*DEFAULT_SCALE/(DISPLAY_HEIGHT*scale)
        //voltage = y*250*8/(1,024*scale)
    
        //cycle 0
        pixelsRelativeToZeroVoltsTimesVoltageRange <= pixelsRelativeToZeroVolts * DEFAULT_SCALE_VOLTAGE_RANGE;
        scaleTimesDisplayHeight <= scale * DISPLAY_HEIGHT;
        
        //cycle 1
        pixelsRelativeToZeroVoltsTimesVoltageRangeTimesDefaultScale <= pixelsRelativeToZeroVoltsTimesVoltageRange << 3;  //multiply by 8 (DEFAULT_SCALE = 8)
        scaleTimesDisplayHeightCycle1 <= scaleTimesDisplayHeight;
        
        //cycle 2
        voltage <= pixelsRelativeToZeroVoltsTimesVoltageRangeTimesDefaultScale / scaleTimesDisplayHeightCycle1;
        
        //cycle 3
        isNegative <= (voltage < 0) ? 1'b1 : 1'b0;
        voltageAbsoluteValue <= (voltage > 0) ? voltage : ((~voltage) + 1);
    end
    
endmodule
