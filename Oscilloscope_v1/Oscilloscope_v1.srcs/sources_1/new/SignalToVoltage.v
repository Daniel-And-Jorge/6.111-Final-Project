`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2016 07:38:19 PM
// Design Name: 
// Module Name: SignalToVoltage
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


module SignalToVoltage
    #(parameter DISPLAY_Y_BITS = 12,
                SCALE_EXPONENT_BITS = 4,
                SCALE_FACTOR_SIZE = 10,
                SELECT_CHARACTER_BITS = 7,
                VOLTAGE_BITS = 10,
                DIGIT_BITS = 4)
    (
    input clock,
    input signed [DISPLAY_Y_BITS-1:0]signal,
    input [SCALE_EXPONENT_BITS-1:0] scaleExponent,
    input [SCALE_FACTOR_SIZE-1:0] scale,
    output [SELECT_CHARACTER_BITS-1:0] character2,
    output [SELECT_CHARACTER_BITS-1:0] character1,
    output [SELECT_CHARACTER_BITS-1:0] character0,
    output isPositive
    );
    
    //convert signal to voltage
    wire signed [VOLTAGE_BITS-1:0] voltage;
    wire [VOLTAGE_BITS-1:0] voltageAbsoluteValue;
    wire voltageIsNegative;
    YPixelToVoltage signalMaxToVoltage
                (.clock(clock),
                .y(signal),
                .scaleExponent(scaleExponent),
                .scale(scale),
                .voltage(voltage),
                .voltageAbsoluteValue(voltageAbsoluteValue),
                .isNegative(voltageIsNegative)
                );
    
    //convert voltage into 3 digits           
    wire [DIGIT_BITS-1:0] voltageNumber2;
    wire [DIGIT_BITS-1:0] voltageNumber1;
    wire [DIGIT_BITS-1:0] voltageNumber0;
    ConvertBCD maxVoltageConvertBCD(
            .clock(clock),
            .data(voltageAbsoluteValue),
            .d(voltageNumber0),
            .d10(voltageNumber1),
            .d100(voltageNumber2)
            );
    
    //Convert digits into character ROM location  
    wire [SELECT_CHARACTER_BITS-1:0] character2Out;
    wire [SELECT_CHARACTER_BITS-1:0] character1Out;
    wire [SELECT_CHARACTER_BITS-1:0] character0Out;    
    DecimalToROMLocation voltagePerDivisionDecimalToROMLocation(
            .clock(clock),
            .number2(voltageNumber2),
            .number1(voltageNumber1),
            .number0(voltageNumber0),
            .character2(character2Out),
            .character1(character1Out),
            .character0(character0Out)
            );
            
    assign character2 = character2Out;
    assign character1 = character1Out;
    assign character0 = character0Out;
    assign isPositive = ~voltageIsNegative;
    
endmodule
