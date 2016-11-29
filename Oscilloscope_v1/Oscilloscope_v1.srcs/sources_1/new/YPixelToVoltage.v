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
                SCALE_FACTOR_SIZE = 10)
    (
    input [DISPLAY_Y_BITS-1:0] y,
    input [SCALE_FACTOR_SIZE-1:0] verticalScaleFactorTimes8ChannelSelected,
    output [VOLTAGE_BITS-1:0] voltage
    );
    
    
    
endmodule
