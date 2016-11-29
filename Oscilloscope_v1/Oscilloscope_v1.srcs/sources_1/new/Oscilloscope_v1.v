`timescale 1ns / 1ps
`include "VerticalScaler.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2016 01:36:27 PM
// Design Name: 
// Module Name: Oscilloscope_v1
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


module Oscilloscope_v1
   #(parameter  DISPLAY_X_BITS = 12,
                DISPLAY_Y_BITS = 12,
                ADDRESS_BITS = 12,
                RGB_BITS = 12,
                X_MIDDLE_VOLTAGE_CHARACTER_4 = 1_088,
                Y_MIDDLE_VOLTAGE_CHARACTER_4 = 496,
                X_MIDDLE_VOLTAGE_CHARACTER_3 = 1_108,
                Y_MIDDLE_VOLTAGE_CHARACTER_3 = 496,
                X_MIDDLE_VOLTAGE_CHARACTER_2 = 1_128,
                Y_MIDDLE_VOLTAGE_CHARACTER_2 = 496,
                X_MIDDLE_VOLTAGE_CHARACTER_1 = 1_148,
                Y_MIDDLE_VOLTAGE_CHARACTER_1 = 496,
                X_MIDDLE_VOLTAGE_CHARACTER_0 = 1_168,
                Y_MIDDLE_VOLTAGE_CHARACTER_0 = 496,
                X_TIME_PER_DIVISION_CHARACTER_4 = 700,
                Y_TIME_PER_DIVISION_CHARACTER_4 = 980,
                X_TIME_PER_DIVISION_CHARACTER_3 = 720,
                Y_TIME_PER_DIVISION_CHARACTER_3 = 980,
                X_TIME_PER_DIVISION_CHARACTER_2 = 740,
                Y_TIME_PER_DIVISION_CHARACTER_2 = 980,
                X_TIME_PER_DIVISION_CHARACTER_1 = 760,
                Y_TIME_PER_DIVISION_CHARACTER_1 = 980,
                X_TIME_PER_DIVISION_CHARACTER_0 = 780,
                Y_TIME_PER_DIVISION_CHARACTER_0 = 980,
                
                Y_CURSOR_1 = 80,
                X_CURSOR_1_CHARACTER_15 = 940,
                X_CURSOR_1_CHARACTER_14 = 960,
                X_CURSOR_1_CHARACTER_13 = 980,
                X_CURSOR_1_CHARACTER_12 = 1000,
                X_CURSOR_1_CHARACTER_11 = 1020,
                X_CURSOR_1_CHARACTER_10 = 1040,
                X_CURSOR_1_CHARACTER_9 = 1060,
                X_CURSOR_1_CHARACTER_8 = 1080,
                X_CURSOR_1_CHARACTER_7 = 1100,
                X_CURSOR_1_CHARACTER_6 = 1120,
                X_CURSOR_1_CHARACTER_5 = 1140,
                X_CURSOR_1_CHARACTER_4 = 1160,
                X_CURSOR_1_CHARACTER_3 = 1180,
                X_CURSOR_1_CHARACTER_2 = 1200,
                X_CURSOR_1_CHARACTER_1 = 1220,
                X_CURSOR_1_CHARACTER_0 = 1240,
                
                SELECT_CHARACTER_BITS = 7,
                DRP_ADDRESS_BITS = 7,
                DRP_SAMPLE_BITS = 16,
                SAMPLE_BITS = 12,
                TOGGLE_CHANNELS_STATE_BITS = 2,
                SCALE_FACTOR_BITS = 10,
                DIGIT_BITS = 4,
                CURSOR_VOLTAGE_BITS = 10,
                SCALE_EXPONENT_BITS = 4) 
   (input CLK100MHZ,
   input vauxp11,
   input vauxn11,
   input vauxp3,
   input vauxn3,
   input [15:0] SW,
   input BTNU, input BTND, input BTNC, input BTNL,
   //input reset,
   output wire [15:0] LED,
   output [7:0] an,
   output dp,
   output [6:0] seg,
   output reg VGA_HS,
   output reg VGA_VS,
   output reg [3:0] VGA_R, output reg [3:0] VGA_G, output reg [3:0] VGA_B
    );
    
    wire reset;
    assign reset = 0;
    //debounce rdb(.reset(reset), .clock(CLK100MHZ), .noisy(CPU_RESETN), .clean(reset));
    
    wire CLK108MHZ;
    //instantiate clock divider
    clk_wiz_0 ClockDivider
       (
       // Clock in ports
        .clk_in1(CLK100MHZ),      // input clk_in1
        // Clock out ports
        .clk_out1(CLK108MHZ),    // output clk_out1
        // Status and control signals
        .reset(reset), // input reset
        .locked(locked));
        
    // Scope settings
    wire signed [11:0] triggerThreshold;
    wire [9:0] verticalScaleFactorTimes8Channel1;
    wire [9:0] verticalScaleFactorTimes8Channel2;
    wire [3:0] verticalScaleExponentChannel1;
    wire [3:0] verticalScaleExponentChannel2;
    wire [5:0] samplePeriod;
    wire channelSelected;
    assign LED[15] = channelSelected;
    
    // these come from MeasureSignal
    wire signed [11:0] signalMinChannel1;
    wire signed [11:0] signalMaxChannel1;
    wire [11:0] signalPeriodChannel1;
    wire signed [11:0] signalAverageChannel1;
    wire signed [11:0] signalMinChannel2;
    wire signed [11:0] signalMaxChannel2;
    wire [11:0] signalPeriodChannel2;
    wire signed [11:0] signalAverageChannel2;
    
    ScopeSettings myss(.clock(CLK108MHZ), .sw(SW[15:0]),
                        .btnu(btnu_1pulse), .btnd(btnd_1pulse), .btnc(btnc_1pulse), .btnl(btnl_1pulse),
                        .signalMinChannel1(signalMinChannel1), .signalMaxChannel1(signalMaxChannel1), .signalPeriodChannel1(signalPeriodChannel1),
                        .signalMinChannel2(signalMinChannel2), .signalMaxChannel2(signalMaxChannel2), .signalPeriodChannel2(signalPeriodChannel2),
                        .triggerThreshold(triggerThreshold), 
                        .verticalScaleFactorTimes8Channel1(verticalScaleFactorTimes8Channel1), 
                        .verticalScaleFactorTimes8Channel2(verticalScaleFactorTimes8Channel2),
                        .verticalScaleExponentChannel1(verticalScaleExponentChannel1),
                        .verticalScaleExponentChannel2(verticalScaleExponentChannel2),
                        .samplePeriod(samplePeriod), .channelSelected(channelSelected)                
                        );
    
    // Button input debouncers
    debounce (.reset(reset), .clock(CLK108MHZ), .noisy(BTNU), .clean(btnu_clean));
    debounce (.reset(reset), .clock(CLK108MHZ), .noisy(BTND), .clean(btnd_clean));
    debounce (.reset(reset), .clock(CLK108MHZ), .noisy(BTNC), .clean(btnc_clean));
    debounce (.reset(reset), .clock(CLK108MHZ), .noisy(BTNL), .clean(btnl_clean));
    
    ButtonSinglePulse(.clock(CLK108MHZ), .btn(btnu_clean), .btn1pulse(btnu_1pulse));
    ButtonSinglePulse(.clock(CLK108MHZ), .btn(btnd_clean), .btn1pulse(btnd_1pulse));
    ButtonSinglePulse(.clock(CLK108MHZ), .btn(btnc_clean), .btn1pulse(btnc_1pulse));
    ButtonSinglePulse(.clock(CLK108MHZ), .btn(btnl_clean), .btn1pulse(btnl_1pulse));
    
    assign LED[9:0] = verticalScaleFactorTimes8Channel1;

    wire [DRP_ADDRESS_BITS-1:0] DRPAddress;
    wire DRPEnable;
    wire DRPWriteEnable;
    wire DRPReady;
    wire signed [DRP_SAMPLE_BITS-1:0] DRPDataOut;
    wire endOfConversion;
    SimultaneousSamplingXADC simultaneousSamplingXADC (
        .di_in(),                       // input wire [15 : 0] di_in
        .daddr_in(DRPAddress),          // input wire [6 : 0] daddr_in
        .den_in(DRPEnable),             // input wire den_in
        .dwe_in(DRPWriteEnable),        // input wire dwe_in
        .drdy_out(DRPReady),            // output wire drdy_out
        .do_out(DRPDataOut),            // output wire [15 : 0] do_out
        .dclk_in(CLK108MHZ),            // input wire dclk_in
        .reset_in(reset),               // input wire reset_in
        .vp_in(),                       // input wire vp_in
        .vn_in(),                       // input wire vn_in
        .vauxp3(vauxp3),                // input wire vauxp3
        .vauxn3(vauxn3),                // input wire vauxn3
        .vauxp11(vauxp11),              // input wire vauxp11
        .vauxn11(vauxn11),              // input wire vauxn11
        .channel_out(),                 // output wire [4 : 0] channel_out
        .eoc_out(endOfConversion),      // output wire eoc_out
        .alarm_out(),                   // output wire alarm_out
        .eos_out(),                     // output wire eos_out
        .busy_out()                     // output wire busy_out
        );
        
    wire signed [SAMPLE_BITS-1:0] channel1;
    wire signed [SAMPLE_BITS-1:0] channel2;
    wire channelDataReady;
    wire [TOGGLE_CHANNELS_STATE_BITS-1:0] state;
    wire [TOGGLE_CHANNELS_STATE_BITS-1:0] previousState;
    ToggleChannels myToggleChannels(
        .clock(CLK108MHZ),
        .endOfConversion(endOfConversion),
        .DRPReady(DRPReady),
        .DRPDataOut(DRPDataOut[15:4]),
        .DRPEnable(DRPEnable),
        .DRPWriteEnable(DRPWriteEnable),
        .channel1(channel1),
        .channel2(channel2),
        .DRPAddress(DRPAddress),
        .channelDataReady(channelDataReady),
        .state(state),
        .previousState(previousState)
        );
              
      // ADC controller channel1
      wire adcc_ready;
      wire adccRawReady;
      wire signed [11:0] ADCCdataOutChannel1;
      wire signed [11:0] adccRawDataOutChannel1;
      wire signed [11:0] ADCCdataOutChannel2;
      wire signed [11:0] adccRawDataOutChannel2;

      ADCController adcc(
                             .clock(CLK108MHZ),
                             .reset(reset),
                             .sampleEnabled(1),
                             .inputReady(channelDataReady),
                             .samplePeriod(samplePeriod),
                             .ready(adcc_ready),
                             .rawReady(adccRawReady), // not affected by samplePeriod
                             .dataInChannel1(channel1),
                             .dataOutChannel1(ADCCdataOutChannel1),
                             .rawDataOutChannel1(adccRawDataOutChannel1),
                             .dataInChannel2(channel2),
                             .dataOutChannel2(ADCCdataOutChannel2),
                             .rawDataOutChannel2(adccRawDataOutChannel2)
                             );

   // edge type detector channel 1
   wire risingEdgeReadyChannel1;
   wire signed [13:0] slopeChannel1;
   wire positiveSlopeChannel1;
    EdgeTypeDetector myEdgeTypeDetectorChannel1
     (.clock(CLK108MHZ),
      .dataReady(adccRawReady),
      .dataIn(adccRawDataOutChannel1),
      .risingEdgeReady(risingEdgeReadyChannel1),
      .estimatedSlope(slopeChannel1),
      .estimatedSlopeIsPositive(positiveSlopeChannel1));
      
    // edge type detector channel 2
    wire risingEdgeReadyChannel2;
    wire signed [13:0] slopeChannel2;
    wire positiveSlopeChannel2;
    EdgeTypeDetector myEdgeTypeDetectorChannel2
        (.clock(CLK108MHZ),
         .dataReady(adccRawReady),
         .dataIn(adccRawDataOutChannel2),
         .risingEdgeReady(risingEdgeReadyChannel2),
         .estimatedSlope(slopeChannel2),
         .estimatedSlopeIsPositive(positiveSlopeChannel2));
    
    wire drawStarting;
    wire activeBramSelect;
    BufferSelector mybs(
        .clock(CLK108MHZ),
        .drawStarting(drawStarting),
        .activeBramSelect(activeBramSelect)
        );
    
    wire isTriggered;
    wire [11:0] bufferDataOutChannel1;
    wire [ADDRESS_BITS-1:0] curveAddressOutChannel1;
    buffer BufferChannel1 (.clock(CLK108MHZ), .ready(adcc_ready), .dataIn(ADCCdataOutChannel1),
        .isTrigger(isTriggered), .disableCollection(0), .activeBramSelect(activeBramSelect),
        .reset(reset),
        .readTriggerRelative(1),
        .readAddress(curveAddressOutChannel1),
        .dataOut(bufferDataOutChannel1));
    
    wire [11:0] buffer2DataOutChannel1;
    wire [ADDRESS_BITS-1:0] curveAddressOut2Channel1; 
    buffer Buffer2Channel1 (.clock(CLK108MHZ), .ready(risingEdgeReadyChannel1), .dataIn(slopeChannel1),
                .isTrigger(isTriggered), .disableCollection(0), .activeBramSelect(activeBramSelect),
                .reset(reset),
                .readTriggerRelative(1),
                .readAddress(curveAddressOut2Channel1),
                .dataOut(buffer2DataOutChannel1));
    
    wire [11:0] bufferDataOutChannel2;    
    wire [ADDRESS_BITS-1:0] curveAddressOutChannel2;        
    buffer BufferChannel2 (.clock(CLK108MHZ), .ready(adcc_ready), .dataIn(ADCCdataOutChannel2),
                        .isTrigger(isTriggered), .disableCollection(0), .activeBramSelect(activeBramSelect),
                        .reset(reset),
                        .readTriggerRelative(1),
                        .readAddress(curveAddressOutChannel2),
                        .dataOut(bufferDataOutChannel2));
                        
    wire [11:0] buffer2DataOutChannel2;
    wire [ADDRESS_BITS-1:0] curveAddressOut2Channel2; 
    buffer Buffer2Channel2 (.clock(CLK108MHZ), .ready(risingEdgeReadyChannel2), .dataIn(slopeChannel2),
                .isTrigger(isTriggered), .disableCollection(0), .activeBramSelect(activeBramSelect),
                .reset(reset),
                .readTriggerRelative(1),
                .readAddress(curveAddressOut2Channel2),
                .dataOut(buffer2DataOutChannel2));
    
    wire [SAMPLE_BITS-1:0] channelSelectedData;
    wire positiveSlopeChannelSelected;
    wire [SCALE_FACTOR_BITS-1:0] verticalScaleFactorTimes8ChannelSelected;
    SelectChannelData mySelectChannelData
            (.clock(CLK108MHZ),
            .channel1(adccRawDataOutChannel1),
            .channel2(adccRawDataOutChannel2),
            .positiveSlopeChannel1(positiveSlopeChannel1),
            .positiveSlopeChannel2(positiveSlopeChannel2),
            .verticalScaleFactorTimes8Channel1(verticalScaleFactorTimes8Channel1),
            .verticalScaleFactorTimes8Channel2(verticalScaleFactorTimes8Channel2),
            .channelSelected(channelSelected),
            .channelSelectedData(channelSelectedData),
            .positiveSlopeChannelSelected(positiveSlopeChannelSelected),
            .verticalScaleFactorTimes8ChannelSelected(verticalScaleFactorTimes8ChannelSelected)
            );
        
    TriggerRisingEdgeSteady #(.DATA_BITS(12))
            Trigger
            (.clock(CLK108MHZ),
            .threshold(triggerThreshold),
            .dataReady(adccRawReady),
            .dataIn(channelSelectedData),
            .triggerDisable(~positiveSlopeChannelSelected),
            .isTriggered(isTriggered)
            );
     
     MeasureSignal myMeasureSignalChannel1
                (
                .clock(CLK108MHZ),
                .dataReady(adccRawReady),
                .dataIn(adccRawDataOutChannel1),
                .isTrigger(isTriggered),
                .signalMax(signalMaxChannel1),
                .signalMin(signalMinChannel1),
                .signalPeriod(signalPeriodChannel1),
                .signalAverage(signalAverageChannel1)
                );
     
     MeasureSignal myMeasureSignalChannel2
                (
                .clock(CLK108MHZ),
                .dataReady(adccRawReady),
                .dataIn(adccRawDataOutChannel2),
                .isTrigger(isTriggered),
                .signalMax(signalMaxChannel2),
                .signalMin(signalMinChannel2),
                .signalPeriod(signalPeriodChannel2),
                .signalAverage(signalAverageChannel2)
                );
     
     // Create display system and sprites    
     wire [DISPLAY_X_BITS-1:0] displayX;
     wire [DISPLAY_Y_BITS-1:0] displayY;
     wire vsync;
     wire hsync;
     wire blank;
     xvga1280_1024 myXVGA(.vclock(CLK108MHZ),
        .displayX(displayX), // pixel number on current line
        .displayY(displayY), // line number
        .vsync(vsync), .hsync(hsync), .blank(blank));
    
    // draw grid lines
    wire [DISPLAY_X_BITS-1:0] gridDisplayX;
    wire [DISPLAY_Y_BITS-1:0] gridDisplayY;
    wire gridVsync;
    wire gridHsync;
    wire gridBlank;
    wire [RGB_BITS-1:0] gridPixel;
    Grid myGrid(.clock(CLK108MHZ), .displayX(displayX), .displayY(displayY), .hsync(hsync), .vsync(vsync), .blank(blank),
                .gridDisplayX(gridDisplayX), .gridDisplayY(gridDisplayY), .gridHsync(gridHsync), 
                .gridVsync(gridVsync), .gridBlank(gridBlank), .pixel(gridPixel));
        
    wire [DISPLAY_X_BITS-1:0] curveChannel1DisplayX;
    wire [DISPLAY_Y_BITS-1:0] curveChannel1DisplayY;
    wire curveChannel1Hsync;
    wire curveChannel1Vsync;
    wire curveChannel1Blank;
    wire [RGB_BITS-1:0] curveChannel1Pixel;
    
    wire [11:0] dataInChannel1;
    assign dataInChannel1 = bufferDataOutChannel1;
    Curve #(.ADDRESS_BITS(ADDRESS_BITS))
            curveChannel1
            (.clock(CLK108MHZ),
            .dataIn(dataInChannel1),
            .verticalScaleFactorTimes8(verticalScaleFactorTimes8Channel1),
            .displayX(gridDisplayX),
            .displayY(gridDisplayY),
            .hsync(gridHsync),
            .vsync(gridVsync),
            .blank(gridBlank),
            .previousPixel(gridPixel),
            .pixel(curveChannel1Pixel),
            .drawStarting(),
            .address(curveAddressOutChannel1),
            .curveDisplayX(curveChannel1DisplayX),
            .curveDisplayY(curveChannel1DisplayY),
            .curveHsync(curveChannel1Hsync),
            .curveVsync(curveChannel1Vsync),
            .curveBlank(curveChannel1Blank)
            );
            
        wire [DISPLAY_X_BITS-1:0] curveChannel2DisplayX;
        wire [DISPLAY_Y_BITS-1:0] curveChannel2DisplayY;
        wire curveChannel2Hsync;
        wire curveChannel2Vsync;
        wire curveChannel2Blank;
        wire [RGB_BITS-1:0] curveChannel2Pixel;
            
        wire [11:0] dataInChannel2;
        assign dataInChannel2 = bufferDataOutChannel2;
        Curve #(.ADDRESS_BITS(ADDRESS_BITS),
                .RGB_COLOR(12'h0FF)) //blue
                curveChannel2
                (.clock(CLK108MHZ),
                .dataIn(dataInChannel2),
                .verticalScaleFactorTimes8(verticalScaleFactorTimes8Channel2),
                .displayX(curveChannel1DisplayX),
                .displayY(curveChannel1DisplayY),
                .hsync(curveChannel1Hsync),
                .vsync(curveChannel1Vsync),
                .blank(curveChannel1Blank),
                .previousPixel(curveChannel1Pixel),
                .pixel(curveChannel2Pixel),
                .drawStarting(drawStarting),
                .address(curveAddressOutChannel2),
                .curveDisplayX(curveChannel2DisplayX),
                .curveDisplayY(curveChannel2DisplayY),
                .curveHsync(curveChannel2Hsync),
                .curveVsync(curveChannel2Vsync),
                .curveBlank(curveChannel2Blank)
                );
     
     wire [RGB_BITS-1:0] tlsPixel;
     wire [DISPLAY_X_BITS-1:0] tlsDisplayX;
     wire [DISPLAY_Y_BITS-1:0] tlsDisplayY;
     wire tlsHsync, tlsVsync, tlsBlank;
     HorizontalLineSprite mytls
                (.clock(CLK108MHZ),
                .level(triggerThreshold * $signed(verticalScaleFactorTimes8ChannelSelected) / 'sd8),
                .displayX(curveChannel2DisplayX),
                .displayY(curveChannel2DisplayY),
                .hsync(curveChannel2Hsync),
                .vsync(curveChannel2Vsync),
                .blank(curveChannel2Blank),
                .previousPixel(curveChannel2Pixel),
                .pixel(tlsPixel),
                .spriteDisplayX(tlsDisplayX),
                .spriteDisplayY(tlsDisplayY),
                .spriteHsync(tlsHsync),
                .spriteVsync(tlsVsync),
                .spriteBlank(tlsBlank)
                );
    
    wire [DISPLAY_Y_BITS-1:0] yCursor1;
    assign yCursor1 = 12'd412;
    wire [SCALE_EXPONENT_BITS-1:0] verticalScaleExponentChannelSelected;
    assign verticalScaleExponentChannelSelected =4'd3;
    wire signed [CURSOR_VOLTAGE_BITS-1:0] cursor1Voltage;
    wire [CURSOR_VOLTAGE_BITS-1:0] cursor1VoltageAbsoluteValue;
    wire isNegative;
    YPixelToVoltage yCursor1ToVoltage
            (.clock(CLK108MHZ),
            .y(yCursor1),
            .scaleExponent(verticalScaleExponentChannelSelected),
            .voltage(cursor1Voltage),
            .voltageAbsoluteValue(cursor1VoltageAbsoluteValue),
            .isNegative(isNegative)
            );
            
    
    wire [DIGIT_BITS-1:0] cursor1Number2;
    wire [DIGIT_BITS-1:0] cursor1Number1;
    wire [DIGIT_BITS-1:0] cursor1Number0;
    ConvertBCD cursor1ConvertBCD(
            .clock(CLK108MHZ),
            .data(cursor1VoltageAbsoluteValue),
            .d(cursor1Number0),
            .d10(cursor1Number1),
            .d100(cursor1Number2)
            );
     
    wire [SELECT_CHARACTER_BITS-1:0] cursor1VoltageCharacter2;
    wire [SELECT_CHARACTER_BITS-1:0] cursor1VoltageCharacter1;
    wire [SELECT_CHARACTER_BITS-1:0] cursor1VoltageCharacter0;
    DecimalToROMLocation cursor1VoltageDecimalToROMLocation(
            .clock(CLK108MHZ),
            .number2(cursor1Number2),
            .number1(cursor1Number1),
            .number0(cursor1Number0),
            .character2(cursor1VoltageCharacter2),
            .character1(cursor1VoltageCharacter1),
            .character0(cursor1VoltageCharacter0)
            );
            
    wire textHsync, textVsync, textBlank;
    wire [RGB_BITS-1:0] textPixel;
    wire [DISPLAY_X_BITS-1:0] textDisplayX;
    wire [DISPLAY_Y_BITS-1:0] textDisplayY;
    wire [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter4;
    assign middleVoltageCharacter4 = 7'd21;
    wire [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter3;
    assign middleVoltageCharacter3 = 7'd16;
    wire [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter2;
    assign middleVoltageCharacter2 = 7'd16;
    wire [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter1;
    assign middleVoltageCharacter1 = 7'd77;
    wire [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter0;
    assign middleVoltageCharacter0 = 7'd54;
    wire [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter4;
    assign timePerDivisionCharacter4 = 7'd0;
    wire [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter3;
    assign timePerDivisionCharacter3 = 7'd17;
    wire [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter2;
    assign timePerDivisionCharacter2 = 7'd16;
    wire [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter1;
    assign timePerDivisionCharacter1 = 7'd77;
    wire [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter0;
    assign timePerDivisionCharacter0 = 7'd83;
    
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character15;
    assign cursor1Character15 = 7'd35;  //C
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character14;
    assign cursor1Character14 = 7'd85;  //u
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character13;
    assign cursor1Character13 = 7'd82;  //r
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character12;
    assign cursor1Character12 = 7'd83;  //s
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character11;
    assign cursor1Character11 = 7'd79;  //o
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character10;
    assign cursor1Character10 = 7'd82;  //r
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character9;
    assign cursor1Character9 = 7'd0;  //Space
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character8;
    assign cursor1Character8 = 7'd17;  //1
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character7;
    assign cursor1Character7 = 7'd26;  //:
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character6;
    assign cursor1Character6 = 7'd0;  //Space
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character5;
    assign cursor1Character5 = 7'd11;  //+
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character4;
    assign cursor1Character4 = cursor1VoltageCharacter2;  //1
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character3;
    assign cursor1Character3 = cursor1VoltageCharacter1;  //2
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character2;
    assign cursor1Character2 = cursor1VoltageCharacter0;  //3
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character1;
    assign cursor1Character1 = 7'd77;  //m
    wire [SELECT_CHARACTER_BITS-1:0] cursor1Character0;
    assign cursor1Character0 = 7'd54;  //V
    Text myText (.clock(CLK108MHZ), 
        .xMiddleVoltage4(X_MIDDLE_VOLTAGE_CHARACTER_4), .yMiddleVoltage4(Y_MIDDLE_VOLTAGE_CHARACTER_4), .middleVoltageCharacter4(middleVoltageCharacter4),
        .xMiddleVoltage3(X_MIDDLE_VOLTAGE_CHARACTER_3), .yMiddleVoltage3(Y_MIDDLE_VOLTAGE_CHARACTER_3), .middleVoltageCharacter3(middleVoltageCharacter3),
        .xMiddleVoltage2(X_MIDDLE_VOLTAGE_CHARACTER_2), .yMiddleVoltage2(Y_MIDDLE_VOLTAGE_CHARACTER_2), .middleVoltageCharacter2(middleVoltageCharacter2),
        .xMiddleVoltage1(X_MIDDLE_VOLTAGE_CHARACTER_1), .yMiddleVoltage1(Y_MIDDLE_VOLTAGE_CHARACTER_1), .middleVoltageCharacter1(middleVoltageCharacter1),
        .xMiddleVoltage0(X_MIDDLE_VOLTAGE_CHARACTER_0), .yMiddleVoltage0(Y_MIDDLE_VOLTAGE_CHARACTER_0), .middleVoltageCharacter0(middleVoltageCharacter0),
        .xTimePerDivision4(X_TIME_PER_DIVISION_CHARACTER_4), .yTimePerDivision4(Y_TIME_PER_DIVISION_CHARACTER_4), .timePerDivisionCharacter4(timePerDivisionCharacter4),
        .xTimePerDivision3(X_TIME_PER_DIVISION_CHARACTER_3), .yTimePerDivision3(Y_TIME_PER_DIVISION_CHARACTER_3), .timePerDivisionCharacter3(timePerDivisionCharacter3),
        .xTimePerDivision2(X_TIME_PER_DIVISION_CHARACTER_2), .yTimePerDivision2(Y_TIME_PER_DIVISION_CHARACTER_2), .timePerDivisionCharacter2(timePerDivisionCharacter2),
        .xTimePerDivision1(X_TIME_PER_DIVISION_CHARACTER_1), .yTimePerDivision1(Y_TIME_PER_DIVISION_CHARACTER_1), .timePerDivisionCharacter1(timePerDivisionCharacter1),
        .xTimePerDivision0(X_TIME_PER_DIVISION_CHARACTER_0), .yTimePerDivision0(Y_TIME_PER_DIVISION_CHARACTER_0), .timePerDivisionCharacter0(timePerDivisionCharacter0),
        
        .xCursor1_15(X_CURSOR_1_CHARACTER_15), .yCursor1_15(Y_CURSOR_1), .cursor1Character15(cursor1Character15),
        .xCursor1_14(X_CURSOR_1_CHARACTER_14), .yCursor1_14(Y_CURSOR_1), .cursor1Character14(cursor1Character14),
        .xCursor1_13(X_CURSOR_1_CHARACTER_13), .yCursor1_13(Y_CURSOR_1), .cursor1Character13(cursor1Character13),
        .xCursor1_12(X_CURSOR_1_CHARACTER_12), .yCursor1_12(Y_CURSOR_1), .cursor1Character12(cursor1Character12),
        .xCursor1_11(X_CURSOR_1_CHARACTER_11), .yCursor1_11(Y_CURSOR_1), .cursor1Character11(cursor1Character11),
        .xCursor1_10(X_CURSOR_1_CHARACTER_10), .yCursor1_10(Y_CURSOR_1), .cursor1Character10(cursor1Character10),
        .xCursor1_9(X_CURSOR_1_CHARACTER_9), .yCursor1_9(Y_CURSOR_1), .cursor1Character9(cursor1Character9),
        .xCursor1_8(X_CURSOR_1_CHARACTER_8), .yCursor1_8(Y_CURSOR_1), .cursor1Character8(cursor1Character8),
        .xCursor1_7(X_CURSOR_1_CHARACTER_7), .yCursor1_7(Y_CURSOR_1), .cursor1Character7(cursor1Character7),
        .xCursor1_6(X_CURSOR_1_CHARACTER_6), .yCursor1_6(Y_CURSOR_1), .cursor1Character6(cursor1Character6),
        .xCursor1_5(X_CURSOR_1_CHARACTER_5), .yCursor1_5(Y_CURSOR_1), .cursor1Character5(cursor1Character5),
        .xCursor1_4(X_CURSOR_1_CHARACTER_4), .yCursor1_4(Y_CURSOR_1), .cursor1Character4(cursor1Character4),
        .xCursor1_3(X_CURSOR_1_CHARACTER_3), .yCursor1_3(Y_CURSOR_1), .cursor1Character3(cursor1Character3),
        .xCursor1_2(X_CURSOR_1_CHARACTER_2), .yCursor1_2(Y_CURSOR_1), .cursor1Character2(cursor1Character2),
        .xCursor1_1(X_CURSOR_1_CHARACTER_1), .yCursor1_1(Y_CURSOR_1), .cursor1Character1(cursor1Character1),
        .xCursor1_0(X_CURSOR_1_CHARACTER_0), .yCursor1_0(Y_CURSOR_1), .cursor1Character0(cursor1Character0),
        
        .displayX(tlsDisplayX), .displayY(tlsDisplayY), 
        .hsync(tlsHsync), .vsync(tlsVsync), .blank(tlsBlank), .previousPixel(tlsPixel),
        .displayXOut(textDisplayX), .displayYOut(textDisplayY), 
        .hsyncOut(textHsync), .vsyncOut(textVsync), .blankOut(textBlank), .pixel(textPixel), .addressA(addressA));
     
     always @(posedge CLK108MHZ) begin
        {VGA_R, VGA_G, VGA_B} <= !textBlank ? textPixel : 12'b0;
        VGA_HS <= tlsHsync;
        VGA_VS <= tlsVsync;
     end
         
endmodule
