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
                X_MIDDLE_VOLTAGE_CHARACTER_4 = 1_100,
                Y_MIDDLE_VOLTAGE_CHARACTER_4 = 496,
                X_MIDDLE_VOLTAGE_CHARACTER_3 = 1_120,
                Y_MIDDLE_VOLTAGE_CHARACTER_3 = 496,
                X_MIDDLE_VOLTAGE_CHARACTER_2 = 1_140,
                Y_MIDDLE_VOLTAGE_CHARACTER_2 = 496,
                X_MIDDLE_VOLTAGE_CHARACTER_1 = 1_160,
                Y_MIDDLE_VOLTAGE_CHARACTER_1 = 496,
                X_MIDDLE_VOLTAGE_CHARACTER_0 = 1_180,
                Y_MIDDLE_VOLTAGE_CHARACTER_0 = 496,
                
                X_TIME_PER_DIVISION_CHARACTER_4 = 200,
                Y_TIME_PER_DIVISION_CHARACTER_4 = 980,
                X_TIME_PER_DIVISION_CHARACTER_3 = 220,
                Y_TIME_PER_DIVISION_CHARACTER_3 = 980,
                X_TIME_PER_DIVISION_CHARACTER_2 = 240,
                Y_TIME_PER_DIVISION_CHARACTER_2 = 980,
                X_TIME_PER_DIVISION_CHARACTER_1 = 260,
                Y_TIME_PER_DIVISION_CHARACTER_1 = 980,
                X_TIME_PER_DIVISION_CHARACTER_0 = 280,
                Y_TIME_PER_DIVISION_CHARACTER_0 = 980,
                
                Y_VOLTAGE_PER_DIVISION_CHARACTER = 744,
                X_VOLTAGE_PER_DIVISION_CHARACTER_4 = 0,
                X_VOLTAGE_PER_DIVISION_CHARACTER_3 = 20,
                X_VOLTAGE_PER_DIVISION_CHARACTER_2 = 40,
                X_VOLTAGE_PER_DIVISION_CHARACTER_1 = 60,
                X_VOLTAGE_PER_DIVISION_CHARACTER_0 = 80,
                
                Y_MAX = 12,
                X_MAX_CHARACTER_9 = 200,
                X_MAX_CHARACTER_8 = 220,
                X_MAX_CHARACTER_7 = 240,
                X_MAX_CHARACTER_6 = 260,
                X_MAX_CHARACTER_5 = 280,
                X_MAX_CHARACTER_4 = 300,
                X_MAX_CHARACTER_3 = 320,
                X_MAX_CHARACTER_2 = 340,
                X_MAX_CHARACTER_1 = 360,
                X_MAX_CHARACTER_0 = 380,
                
                Y_MIN = 44,
                X_MIN_CHARACTER_9 = 200,
                X_MIN_CHARACTER_8 = 220,
                X_MIN_CHARACTER_7 = 240,
                X_MIN_CHARACTER_6 = 260,
                X_MIN_CHARACTER_5 = 280,
                X_MIN_CHARACTER_4 = 300,
                X_MIN_CHARACTER_3 = 320,
                X_MIN_CHARACTER_2 = 340,
                X_MIN_CHARACTER_1 = 360,
                X_MIN_CHARACTER_0 = 380,
                
                Y_CURSOR_1 = 12,
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
                
                Y_CURSOR_2 = 44,
                X_CURSOR_2_CHARACTER_15 = 940,
                X_CURSOR_2_CHARACTER_14 = 960,
                X_CURSOR_2_CHARACTER_13 = 980,
                X_CURSOR_2_CHARACTER_12 = 1000,
                X_CURSOR_2_CHARACTER_11 = 1020,
                X_CURSOR_2_CHARACTER_10 = 1040,
                X_CURSOR_2_CHARACTER_9 = 1060,
                X_CURSOR_2_CHARACTER_8 = 1080,
                X_CURSOR_2_CHARACTER_7 = 1100,
                X_CURSOR_2_CHARACTER_6 = 1120,
                X_CURSOR_2_CHARACTER_5 = 1140,
                X_CURSOR_2_CHARACTER_4 = 1160,
                X_CURSOR_2_CHARACTER_3 = 1180,
                X_CURSOR_2_CHARACTER_2 = 1200,
                X_CURSOR_2_CHARACTER_1 = 1220,
                X_CURSOR_2_CHARACTER_0 = 1240,
                
                Y_VOLTAGE_CURSOR_DIFFERENCE = 76,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_15 = 940,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_14 = 960,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_13 = 980,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_12 = 1000,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_11 = 1020,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_10 = 1040,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_9 = 1060,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_8 = 1080,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_7 = 1100,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_6 = 1120,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_5 = 1140,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_4 = 1160,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_3 = 1180,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_2 = 1200,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_1 = 1220,
                X_VOLTAGE_CURSOR_DIFFERENCE_CHARACTER_0 = 1240,
                
                X_CHANNEL_SELECTED = 12,
                Y_CHANNEL_SELECTED = 12,
                
                SELECT_CHARACTER_BITS = 7,
                DRP_ADDRESS_BITS = 7,
                DRP_SAMPLE_BITS = 16,
                SAMPLE_BITS = 12,
                TOGGLE_CHANNELS_STATE_BITS = 2,
                SCALE_FACTOR_BITS = 10,
                DIGIT_BITS = 4,
                CURSOR_VOLTAGE_BITS = 12,
                SCALE_EXPONENT_BITS = 4,
                TIME_PER_DIVISION_BITS = 10,
                REAL_DISPLAY_WIDTH = 1688,
                REAL_DISPLAY_HEIGHT = 1066,
                PIXELS_PER_DIVISION = 8'sd100,
                
                GREEN = 12'h0C0,
                LIGHT_PURPLE = 12'hF6F,
                YELLOW = 12'hFF0,
                BLUE = 12'h0FF,
                VERY_LIGHT_PURPLE = 12'hFCF) 
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
    wire btnu_clean, btnd_clean, btnc_clean, btnl_clean;
    wire signed [11:0] triggerThreshold;
    wire [9:0] verticalScaleFactorTimes8Channel1;
    wire [9:0] verticalScaleFactorTimes8Channel2;
    wire [5:0] samplePeriod;
    wire channelSelected;
    assign LED[15] = channelSelected;
    wire xyDisplayMode;
    wire signed [DISPLAY_Y_BITS-1:0] yCursor1;
    wire signed [DISPLAY_Y_BITS-1:0] yCursor2;
    
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
                        .btnu(btnu_1pulse), .btnd(btnd_1pulse), .btnc(btnc_1pulse), .btnl(btnl_1pulse),.buttonUpClean(btnu_clean), .buttonDownClean(btnd_clean),
                        .signalMinChannel1(signalMinChannel1), .signalMaxChannel1(signalMaxChannel1), .signalPeriodChannel1(signalPeriodChannel1),
                        .signalMinChannel2(signalMinChannel2), .signalMaxChannel2(signalMaxChannel2), .signalPeriodChannel2(signalPeriodChannel2),
                        .triggerThreshold(triggerThreshold), 
                        .verticalScaleFactorTimes8Channel1(verticalScaleFactorTimes8Channel1), 
                        .verticalScaleFactorTimes8Channel2(verticalScaleFactorTimes8Channel2),
                        .samplePeriod(samplePeriod), .channelSelected(channelSelected),
                        .xyDisplayMode(xyDisplayMode),
                        .yCursor1(yCursor1),
                        .yCursor2(yCursor2)              
                        );
    
    wire [3:0] verticalScaleExponentChannel1;
    wire [3:0] verticalScaleExponentChannel2;
    GetVerticalScaleExponents myGetVericalScaleExponents
                                    (.clock(CLK108MHZ),
                                    .verticalScaleFactorTimes8Channel1(verticalScaleFactorTimes8Channel1),
                                    .verticalScaleFactorTimes8Channel2(verticalScaleFactorTimes8Channel2),
                                    .verticalScaleExponentChannel1(verticalScaleExponentChannel1),
                                    .verticalScaleExponentChannel2(verticalScaleExponentChannel2)
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
    
    
    // Then set address inputs to two other buffers to be whichever address is selected by xyDisplayMode
    // and select pixel/drawing data to the output of whichever curve is chosen by xyDisplayMode
    
    wire [ADDRESS_BITS-1:0] curveAddressOutChannel1;
    wire [ADDRESS_BITS-1:0] curveAddressOutChannel2;
    wire [ADDRESS_BITS-1:0] xyChannel1Address;
    wire [ADDRESS_BITS-1:0] xyChannel2Address; 
    
    wire isTriggered;
    wire [11:0] bufferDataOutChannel1;
    
    buffer BufferChannel1 (.clock(CLK108MHZ), .ready(adcc_ready), .dataIn(ADCCdataOutChannel1),
        .isTrigger(isTriggered), .disableCollection(0), .activeBramSelect(activeBramSelect),
        .reset(reset),
        .readTriggerRelative(1),
        .readAddress(xyDisplayMode ? xyChannel1Address : curveAddressOutChannel1),
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
    buffer BufferChannel2 (.clock(CLK108MHZ), .ready(adcc_ready), .dataIn(ADCCdataOutChannel2),
                        .isTrigger(isTriggered), .disableCollection(0), .activeBramSelect(activeBramSelect),
                        .reset(reset),
                        .readTriggerRelative(1),
                        .readAddress(xyDisplayMode ? xyChannel2Address : curveAddressOutChannel2),
                        .dataOut(bufferDataOutChannel2));
                        
    wire [11:0] buffer2DataOutChannel2;
    buffer Buffer2Channel2 (.clock(CLK108MHZ), .ready(risingEdgeReadyChannel2), .dataIn(slopeChannel2),
                .isTrigger(isTriggered), .disableCollection(0), .activeBramSelect(activeBramSelect),
                .reset(reset),
                .readTriggerRelative(1),
                .readAddress(curveAddressOut2Channel2),
                .dataOut(buffer2DataOutChannel2));
    
    wire [SAMPLE_BITS-1:0] channelSelectedData;
    wire positiveSlopeChannelSelected;
    wire [SCALE_FACTOR_BITS-1:0] verticalScaleFactorTimes8ChannelSelected;
    wire [SCALE_EXPONENT_BITS-1:0] verticalScaleExponentChannelSelected;
    SelectChannelData mySelectChannelData
            (.clock(CLK108MHZ),
            .channel1(adccRawDataOutChannel1),
            .channel2(adccRawDataOutChannel2),
            .positiveSlopeChannel1(positiveSlopeChannel1),
            .positiveSlopeChannel2(positiveSlopeChannel2),
            .verticalScaleFactorTimes8Channel1(verticalScaleFactorTimes8Channel1),
            .verticalScaleFactorTimes8Channel2(verticalScaleFactorTimes8Channel2),
            .verticalScaleExponentChannel1(verticalScaleExponentChannel1),
            .verticalScaleExponentChannel2(verticalScaleExponentChannel2),
            .channelSelected(channelSelected),
            .channelSelectedData(channelSelectedData),
            .positiveSlopeChannelSelected(positiveSlopeChannelSelected),
            .verticalScaleFactorTimes8ChannelSelected(verticalScaleFactorTimes8ChannelSelected),
            .verticalScaleExponentChannelSelected(verticalScaleExponentChannelSelected)
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
    
    // figure out the drawStarting signal
    // there is not enough sprite delay for the exact placement of this to matter
    assign drawStarting = (gridDisplayX == REAL_DISPLAY_WIDTH - 1) && (gridDisplayY == (REAL_DISPLAY_HEIGHT - 1));
    
    // draw curves
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
                .drawStarting(),
                .address(curveAddressOutChannel2),
                .curveDisplayX(curveChannel2DisplayX),
                .curveDisplayY(curveChannel2DisplayY),
                .curveHsync(curveChannel2Hsync),
                .curveVsync(curveChannel2Vsync),
                .curveBlank(curveChannel2Blank)
                );
                
          
     wire [DISPLAY_X_BITS-1:0] xyCurveDisplayX;
     wire [DISPLAY_Y_BITS-1:0] xyCurveDisplayY;
     wire xyCurveHsync;
     wire xyCurveVsync;
     wire xyCurveBlank;
     wire [RGB_BITS-1:0] xyCurvePixel;
      
     XYCurve xyc
                    (.clock(CLK108MHZ),
                    .dataIn1(dataInChannel1),
                    .dataIn2(dataInChannel2),
                    .displayX(gridDisplayX),
                    .displayY(gridDisplayY),
                    .hsync(gridHsync),
                    .vsync(gridVsync),
                    .blank(gridBlank),
                    .previousPixel(gridPixel),
                    .pixel(xyCurvePixel),
                    .drawStarting(),
                    .address1(xyChannel1Address),
                    .address2(xyChannel2Address),
                    .curveDisplayX(xyCurveDisplayX),
                    .curveDisplayY(xyCurveDisplayY),
                    .curveHsync(xyCurveHsync),
                    .curveVsync(xyCurveVsync),
                    .curveBlank(xyCurveBlank)
                    );
     
     wire [RGB_BITS-1:0] tlsPixel;
     wire [DISPLAY_X_BITS-1:0] tlsDisplayX;
     wire [DISPLAY_Y_BITS-1:0] tlsDisplayY;
     wire tlsHsync, tlsVsync, tlsBlank;
     HorizontalLineSprite mytls
                (.clock(CLK108MHZ),
                .level(triggerThreshold * $signed(verticalScaleFactorTimes8ChannelSelected) / 'sd8),
                .displayX(xyDisplayMode ? xyCurveDisplayX : curveChannel2DisplayX),
                .displayY(xyDisplayMode ? xyCurveDisplayY : curveChannel2DisplayY),
                .hsync(xyDisplayMode ? xyCurveHsync : curveChannel2Hsync),
                .vsync(xyDisplayMode ? xyCurveVsync : curveChannel2Vsync),
                .blank(xyDisplayMode ? xyCurveBlank : curveChannel2Blank),
                .previousPixel(xyDisplayMode ? xyCurvePixel : curveChannel2Pixel),
                
                /*.displayX(curveChannel2DisplayX),
                                .displayY(curveChannel2DisplayY),
                                .hsync(curveChannel2Hsync),
                                .vsync(curveChannel2Vsync),
                                .blank(curveChannel2Blank),
                                .previousPixel(curveChannel2Pixel),
                
                .displayX(xyCurveDisplayX),
                .displayY(xyCurveDisplayY),
                .hsync(xyCurveHsync),
                .vsync(xyCurveVsync),
                .blank(xyCurveBlank),
                .previousPixel(xyCurvePixel),
                */
                .pixel(tlsPixel),
                .spriteDisplayX(tlsDisplayX),
                .spriteDisplayY(tlsDisplayY),
                .spriteHsync(tlsHsync),
                .spriteVsync(tlsVsync),
                .spriteBlank(tlsBlank)
                );
    
    wire signed [CURSOR_VOLTAGE_BITS-1:0] cursor1Voltage;
    wire [CURSOR_VOLTAGE_BITS-1:0] cursor1VoltageAbsoluteValue;
    wire cursor1IsNegative;
    YPixelToVoltage yCursor1ToVoltage
            (.clock(CLK108MHZ),
            .y(yCursor1),
            .scaleExponent(verticalScaleExponentChannelSelected),
            .scale(verticalScaleFactorTimes8ChannelSelected),
            .voltage(cursor1Voltage),
            .voltageAbsoluteValue(cursor1VoltageAbsoluteValue),
            .isNegative(cursor1IsNegative)
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
           
    wire [RGB_BITS-1:0] cursor1Pixel;
    wire [DISPLAY_X_BITS-1:0] cursor1DisplayX;
    wire [DISPLAY_Y_BITS-1:0] cursor1DisplayY;
    wire cursor1Hsync, cursor1Vsync, cursor1Blank;
    HorizontalLineSprite #(.RGB_COLOR(12'hF0F), .ADDITIONAL_LINE_PIXELS(1'b0)) cursor1Line
            (.clock(CLK108MHZ),
            .level(yCursor1),
            .displayX(tlsDisplayX),
            .displayY(tlsDisplayY),
            .hsync(tlsHsync),
            .vsync(tlsVsync),
            .blank(tlsBlank),
            .previousPixel(tlsPixel),
            .pixel(cursor1Pixel),
            .spriteDisplayX(cursor1DisplayX),
            .spriteDisplayY(cursor1DisplayY),
            .spriteHsync(cursor1Hsync),
            .spriteVsync(cursor1Vsync),
            .spriteBlank(cursor1Blank)
            );
    
    //compute characters to display min value
    wire [SELECT_CHARACTER_BITS-1:0] cursor2Character4;
    wire [SELECT_CHARACTER_BITS-1:0] cursor2Character3;
    wire [SELECT_CHARACTER_BITS-1:0] cursor2Character2;
    wire cursor2IsPositive;
    SignalToVoltage getCursor2VoltageCharacters(
            .clock(CLK108MHZ),
            .signal(yCursor2),
            .scaleExponent(verticalScaleExponentChannelSelected),
            .scale(verticalScaleFactorTimes8ChannelSelected),
            .character2(cursor2Character4),
            .character1(cursor2Character3),
            .character0(cursor2Character2),
            .isPositive(cursor2IsPositive));
            
    wire [RGB_BITS-1:0] cursor2Pixel;
    wire [DISPLAY_X_BITS-1:0] cursor2DisplayX;
    wire [DISPLAY_Y_BITS-1:0] cursor2DisplayY;
    wire cursor2Hsync, cursor2Vsync, cursor2Blank;
    HorizontalLineSprite #(.RGB_COLOR(12'hF6F), //light purple
    .ADDITIONAL_LINE_PIXELS(1'b0)) cursor2Line
            (.clock(CLK108MHZ),
            .level(yCursor2),
            .displayX(cursor1DisplayX),
            .displayY(cursor1DisplayY),
            .hsync(cursor1Hsync),
            .vsync(cursor1Vsync),
            .blank(cursor1Blank),
            .previousPixel(cursor1Pixel),
            .pixel(cursor2Pixel),
            .spriteDisplayX(cursor2DisplayX),
            .spriteDisplayY(cursor2DisplayY),
            .spriteHsync(cursor2Hsync),
            .spriteVsync(cursor2Vsync),
            .spriteBlank(cursor2Blank)
            );
    
    //compute characters to diplay time per division
    wire [TIME_PER_DIVISION_BITS-1:0] timePerDivision;  
    SamplePeriodToTimePerDivision mySamplePeriodToTimePerDivision
            (.clock(CLK108MHZ),
            .samplePeriod(samplePeriod),
            .timePerDivision(timePerDivision)
            );
    
    wire [DIGIT_BITS-1:0] timePerDivisionNumber0;     
    wire [DIGIT_BITS-1:0] timePerDivisionNumber1;
    wire [DIGIT_BITS-1:0] timePerDivisionNumber2;     
    ConvertBCD timePerDivisionBCD
            (.clock(CLK108MHZ),
            .data(timePerDivision),
            .d(timePerDivisionNumber0),
            .d10(timePerDivisionNumber1),
            .d100(timePerDivisionNumber2)
            );
    
    wire [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter4;
    wire [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter3;
    wire [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter2;        
    DecimalToROMLocation timePerDivisionDecimalToROMLocation(
                        .clock(CLK108MHZ),
                        .number2(timePerDivisionNumber2),
                        .number1(timePerDivisionNumber1),
                        .number0(timePerDivisionNumber0),
                        .character2(timePerDivisionCharacter4),
                        .character1(timePerDivisionCharacter3),
                        .character0(timePerDivisionCharacter2)
                        );
                        
    //compute characters to display voltage per division
    wire signed [CURSOR_VOLTAGE_BITS-1:0] voltagePerDivision;
    wire [CURSOR_VOLTAGE_BITS-1:0] voltagePerDivisionAbsoluteValue;
    wire voltagePerDivisionIsNegative;
    YPixelToVoltage pixelsPerDivisionToVoltage
                (.clock(CLK108MHZ),
                .y(PIXELS_PER_DIVISION),
                .scaleExponent(verticalScaleExponentChannelSelected),
                .scale(verticalScaleFactorTimes8ChannelSelected),
                .voltage(voltagePerDivision),
                .voltageAbsoluteValue(voltagePerDivisionAbsoluteValue),
                .isNegative(voltagePerDivisionIsNegative)
                );
                
    wire [DIGIT_BITS-1:0] voltagePerDivisionNumber2;
    wire [DIGIT_BITS-1:0] voltagePerDivisionNumber1;
    wire [DIGIT_BITS-1:0] voltagePerDivisionNumber0;
    ConvertBCD voltagePerDivisionConvertBCD(
            .clock(CLK108MHZ),
            .data(voltagePerDivisionAbsoluteValue),
            .d(voltagePerDivisionNumber0),
            .d10(voltagePerDivisionNumber1),
            .d100(voltagePerDivisionNumber2)
            );
     
    wire [SELECT_CHARACTER_BITS-1:0] voltagePerDivisionCharacter4;
    wire [SELECT_CHARACTER_BITS-1:0] voltagePerDivisionCharacter3;
    wire [SELECT_CHARACTER_BITS-1:0] voltagePerDivisionCharacter2;
    DecimalToROMLocation voltagePerDivisionDecimalToROMLocation(
            .clock(CLK108MHZ),
            .number2(voltagePerDivisionNumber2),
            .number1(voltagePerDivisionNumber1),
            .number0(voltagePerDivisionNumber0),
            .character2(voltagePerDivisionCharacter4),
            .character1(voltagePerDivisionCharacter3),
            .character0(voltagePerDivisionCharacter2)
            );
            
    //compute characters to display max value
    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter4;
    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter3;
    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter2;
    wire maxVoltageIsPositive;
    SignalToVoltage getMaxVoltageCharacters(
            .clock(CLK108MHZ),
            .signal(channelSelected ? signalMaxChannel2 : signalMaxChannel1),
            .scaleExponent(verticalScaleExponentChannelSelected),
            .scale(verticalScaleFactorTimes8ChannelSelected),
            .character2(maxCharacter4),
            .character1(maxCharacter3),
            .character0(maxCharacter2),
            .isPositive(maxVoltageIsPositive));
            
    //compute characters to display min value
    wire [SELECT_CHARACTER_BITS-1:0] minCharacter4;
    wire [SELECT_CHARACTER_BITS-1:0] minCharacter3;
    wire [SELECT_CHARACTER_BITS-1:0] minCharacter2;
    wire minVoltageIsPositive;
    SignalToVoltage getminVoltageCharacters(
            .clock(CLK108MHZ),
            .signal(channelSelected ? signalMinChannel2 : signalMinChannel1),
            .scaleExponent(verticalScaleExponentChannelSelected),
            .scale(verticalScaleFactorTimes8ChannelSelected),
            .character2(minCharacter4),
            .character1(minCharacter3),
            .character0(minCharacter2),
            .isPositive(minVoltageIsPositive));
              
    wire textHsync, textVsync, textBlank;
    wire [RGB_BITS-1:0] textPixel;
    wire [DISPLAY_X_BITS-1:0] textDisplayX;
    wire [DISPLAY_Y_BITS-1:0] textDisplayY;
    wire [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter4;
    assign middleVoltageCharacter4 = 7'd0;   //space
    wire [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter3;
    assign middleVoltageCharacter3 = 7'd0;   //space
    wire [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter2;
    assign middleVoltageCharacter2 = 7'd16;  //0
    wire [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter1;
    assign middleVoltageCharacter1 = 7'd77;  //m
    wire [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter0;
    assign middleVoltageCharacter0 = 7'd54;  //V
    
    wire [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter1;
    assign timePerDivisionCharacter1 = 7'd77;  //m
    wire [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter0;
    assign timePerDivisionCharacter0 = 7'd83;  //s
    
    wire [SELECT_CHARACTER_BITS-1:0] voltagePerDivisionCharacter1;
    assign voltagePerDivisionCharacter1 = 7'd77;  //m
    wire [SELECT_CHARACTER_BITS-1:0] voltagePerDivisionCharacter0;
    assign voltagePerDivisionCharacter0 = 7'd54;  //V
    
    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter9;
    assign maxCharacter9 = 7'd77;  //m
    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter8;
    assign maxCharacter8 = 7'd65;  //a
    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter7;
    assign maxCharacter7 = 7'd88;  //x
    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter6;
    assign maxCharacter6 = 7'd26;  //:
    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter5;
    assign maxCharacter5 = maxVoltageIsPositive ? 7'd0 : 7'd13;  //space or -
//    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter4;
//    assign maxCharacter4 = 7'd16;  //0
//    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter3;
//    assign maxCharacter3 = 7'd16;  //0
//    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter2;
//    assign maxCharacter2 = 7'd16;  //0
    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter1;
    assign maxCharacter1 = 7'd77;  //m
    wire [SELECT_CHARACTER_BITS-1:0] maxCharacter0;
    assign maxCharacter0 = 7'd54;  //V
    
    wire [SELECT_CHARACTER_BITS-1:0] minCharacter9;
    assign minCharacter9 = 7'd77;  //m
    wire [SELECT_CHARACTER_BITS-1:0] minCharacter8;
    assign minCharacter8 = 7'd73;  //i
    wire [SELECT_CHARACTER_BITS-1:0] minCharacter7;
    assign minCharacter7 = 7'd78;  //n
    wire [SELECT_CHARACTER_BITS-1:0] minCharacter6;
    assign minCharacter6 = 7'd26;  //:
    wire [SELECT_CHARACTER_BITS-1:0] minCharacter5;
    assign minCharacter5 = minVoltageIsPositive ? 7'd0 : 7'd13;  //space or -
//    wire [SELECT_CHARACTER_BITS-1:0] minCharacter4;
//    assign minCharacter4 = 7'd16;  //0
//    wire [SELECT_CHARACTER_BITS-1:0] minCharacter3;
//    assign minCharacter3 = 7'd16;  //0
//    wire [SELECT_CHARACTER_BITS-1:0] minCharacter2;
//    assign minCharacter2 = 7'd16;  //0
    wire [SELECT_CHARACTER_BITS-1:0] minCharacter1;
    assign minCharacter1 = 7'd77;  //m
    wire [SELECT_CHARACTER_BITS-1:0] minCharacter0;
    assign minCharacter0 = 7'd54;  //V
    
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
    assign cursor1Character5 = cursor1IsNegative ? 7'd13 : 7'd0;  //- or space
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
        
        .xVoltagePerDivision4(X_VOLTAGE_PER_DIVISION_CHARACTER_4), .yVoltagePerDivision4(Y_VOLTAGE_PER_DIVISION_CHARACTER), .voltagePerDivisionCharacter4(voltagePerDivisionCharacter4),
        .xVoltagePerDivision3(X_VOLTAGE_PER_DIVISION_CHARACTER_3), .yVoltagePerDivision3(Y_VOLTAGE_PER_DIVISION_CHARACTER), .voltagePerDivisionCharacter3(voltagePerDivisionCharacter3),
        .xVoltagePerDivision2(X_VOLTAGE_PER_DIVISION_CHARACTER_2), .yVoltagePerDivision2(Y_VOLTAGE_PER_DIVISION_CHARACTER), .voltagePerDivisionCharacter2(voltagePerDivisionCharacter2),
        .xVoltagePerDivision1(X_VOLTAGE_PER_DIVISION_CHARACTER_1), .yVoltagePerDivision1(Y_VOLTAGE_PER_DIVISION_CHARACTER), .voltagePerDivisionCharacter1(voltagePerDivisionCharacter1),
        .xVoltagePerDivision0(X_VOLTAGE_PER_DIVISION_CHARACTER_0), .yVoltagePerDivision0(Y_VOLTAGE_PER_DIVISION_CHARACTER), .voltagePerDivisionCharacter0(voltagePerDivisionCharacter0),
        
        .xMax9(X_MAX_CHARACTER_9), .yMax9(Y_MAX), .maxCharacter9(maxCharacter9),
        .xMax8(X_MAX_CHARACTER_8), .yMax8(Y_MAX), .maxCharacter8(maxCharacter8),
        .xMax7(X_MAX_CHARACTER_7), .yMax7(Y_MAX), .maxCharacter7(maxCharacter7),
        .xMax6(X_MAX_CHARACTER_6), .yMax6(Y_MAX), .maxCharacter6(maxCharacter6),
        .xMax5(X_MAX_CHARACTER_5), .yMax5(Y_MAX), .maxCharacter5(maxCharacter5),
        .xMax4(X_MAX_CHARACTER_4), .yMax4(Y_MAX), .maxCharacter4(maxCharacter4),
        .xMax3(X_MAX_CHARACTER_3), .yMax3(Y_MAX), .maxCharacter3(maxCharacter3),
        .xMax2(X_MAX_CHARACTER_2), .yMax2(Y_MAX), .maxCharacter2(maxCharacter2),
        .xMax1(X_MAX_CHARACTER_1), .yMax1(Y_MAX), .maxCharacter1(maxCharacter1),
        .xMax0(X_MAX_CHARACTER_0), .yMax0(Y_MAX), .maxCharacter0(maxCharacter0),
        
//        .xMin9(X_MIN_CHARACTER_9), .yMin9(Y_MIN), .minCharacter9(minCharacter9),
//        .xMin8(X_MIN_CHARACTER_8), .yMin8(Y_MIN), .minCharacter8(minCharacter8),
//        .xMin7(X_MIN_CHARACTER_7), .yMin7(Y_MIN), .minCharacter7(minCharacter7),
//        .xMin6(X_MIN_CHARACTER_6), .yMin6(Y_MIN), .minCharacter6(minCharacter6),
//        .xMin5(X_MIN_CHARACTER_5), .yMin5(Y_MIN), .minCharacter5(minCharacter5),
//        .xMin4(X_MIN_CHARACTER_4), .yMin4(Y_MIN), .minCharacter4(minCharacter4),
//        .xMin3(X_MIN_CHARACTER_3), .yMin3(Y_MIN), .minCharacter3(minCharacter3),
//        .xMin2(X_MIN_CHARACTER_2), .yMin2(Y_MIN), .minCharacter2(minCharacter2),
//        .xMin1(X_MIN_CHARACTER_1), .yMin1(Y_MIN), .minCharacter1(minCharacter1),
//        .xMin0(X_MIN_CHARACTER_0), .yMin0(Y_MIN), .minCharacter0(minCharacter0),
        
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
        
        .displayX(cursor2DisplayX), .displayY(cursor2DisplayY), 
        .hsync(cursor2Hsync), .vsync(cursor2Vsync), .blank(cursor2Blank), .previousPixel(cursor2Pixel),
        .displayXOut(textDisplayX), .displayYOut(textDisplayY), 
        .hsyncOut(textHsync), .vsyncOut(textVsync), .blankOut(textBlank), .pixel(textPixel), .addressA());
        
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character15;
     assign cursor2Character15 = 7'd35;  //C
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character14;
     assign cursor2Character14 = 7'd85;  //u
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character13;
     assign cursor2Character13 = 7'd82;  //r
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character12;
     assign cursor2Character12 = 7'd83;  //s
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character11;
     assign cursor2Character11 = 7'd79;  //o
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character10;
     assign cursor2Character10 = 7'd82;  //r
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character9;
     assign cursor2Character9 = 7'd0;  //Space
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character8;
     assign cursor2Character8 = 7'd18;  //2
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character7;
     assign cursor2Character7 = 7'd26;  //:
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character6;
     assign cursor2Character6 = 7'd0;  //Space
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character5;
     assign cursor2Character5 = cursor2IsPositive ? 7'd0 : 7'd13;  //space or -
//     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character4;
//     assign cursor2Character4 = cursor1VoltageCharacter2;  //1
//     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character3;
//     assign cursor2Character3 = cursor1VoltageCharacter1;  //2
//     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character2;
//     assign cursor2Character2 = cursor1VoltageCharacter0;  //3
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character1;
     assign cursor2Character1 = 7'd77;  //m
     wire [SELECT_CHARACTER_BITS-1:0] cursor2Character0;
     assign cursor2Character0 = 7'd54;  //V
     
     wire text2Hsync, text2Vsync, text2Blank;
     wire [RGB_BITS-1:0] text2Pixel;
     wire [DISPLAY_X_BITS-1:0] text2DisplayX;
     wire [DISPLAY_Y_BITS-1:0] text2DisplayY;
     Text30Characters textMinCursor2ChannelSelected (.clock(CLK108MHZ), 
     
        .xCharacter29(X_MIN_CHARACTER_9), .yCharacter29(Y_MIN), .character29(minCharacter9), .character29Color(GREEN),
        .xCharacter28(X_MIN_CHARACTER_8), .yCharacter28(Y_MIN), .character28(minCharacter8), .character28Color(GREEN),
        .xCharacter27(X_MIN_CHARACTER_7), .yCharacter27(Y_MIN), .character27(minCharacter7), .character27Color(GREEN),
        .xCharacter26(X_MIN_CHARACTER_6), .yCharacter26(Y_MIN), .character26(minCharacter6), .character26Color(GREEN),
        .xCharacter25(X_MIN_CHARACTER_5), .yCharacter25(Y_MIN), .character25(minCharacter5), .character25Color(GREEN),
        
        .xCharacter24(X_MIN_CHARACTER_4), .yCharacter24(Y_MIN), .character24(minCharacter4), .character24Color(GREEN),
        .xCharacter23(X_MIN_CHARACTER_3), .yCharacter23(Y_MIN), .character23(minCharacter3), .character23Color(GREEN),
        .xCharacter22(X_MIN_CHARACTER_2), .yCharacter22(Y_MIN), .character22(minCharacter2), .character22Color(GREEN),
        .xCharacter21(X_MIN_CHARACTER_1), .yCharacter21(Y_MIN), .character21(minCharacter1), .character21Color(GREEN),
        .xCharacter20(X_MIN_CHARACTER_0), .yCharacter20(Y_MIN), .character20(minCharacter0), .character20Color(GREEN),
        
        .xCharacter19(X_CURSOR_2_CHARACTER_15), .yCharacter19(Y_CURSOR_2), .character19(cursor2Character15), .character19Color(LIGHT_PURPLE),
        .xCharacter18(X_CURSOR_2_CHARACTER_14), .yCharacter18(Y_CURSOR_2), .character18(cursor2Character14), .character18Color(LIGHT_PURPLE),
        .xCharacter17(X_CURSOR_2_CHARACTER_13), .yCharacter17(Y_CURSOR_2), .character17(cursor2Character13), .character17Color(LIGHT_PURPLE),
        .xCharacter16(X_CURSOR_2_CHARACTER_12), .yCharacter16(Y_CURSOR_2), .character16(cursor2Character12), .character16Color(LIGHT_PURPLE),
        .xCharacter15(X_CURSOR_2_CHARACTER_11), .yCharacter15(Y_CURSOR_2), .character15(cursor2Character11), .character15Color(LIGHT_PURPLE),
        
        .xCharacter14(X_CURSOR_2_CHARACTER_10), .yCharacter14(Y_CURSOR_2), .character14(cursor2Character10), .character14Color(LIGHT_PURPLE),    
        .xCharacter13(X_CURSOR_2_CHARACTER_9), .yCharacter13(Y_CURSOR_2), .character13(cursor2Character9), .character13Color(LIGHT_PURPLE),
        .xCharacter12(X_CURSOR_2_CHARACTER_8), .yCharacter12(Y_CURSOR_2), .character12(cursor2Character8), .character12Color(LIGHT_PURPLE),
        .xCharacter11(X_CURSOR_2_CHARACTER_7), .yCharacter11(Y_CURSOR_2), .character11(cursor2Character7), .character11Color(LIGHT_PURPLE),
        .xCharacter10(X_CURSOR_2_CHARACTER_6), .yCharacter10(Y_CURSOR_2), .character10(cursor2Character6), .character10Color(LIGHT_PURPLE),
        
        .xCharacter9(X_CURSOR_2_CHARACTER_5), .yCharacter9(Y_CURSOR_2), .character9(cursor2Character5), .character9Color(LIGHT_PURPLE),
        .xCharacter8(X_CURSOR_2_CHARACTER_4), .yCharacter8(Y_CURSOR_2), .character8(cursor2Character4), .character8Color(LIGHT_PURPLE),
        .xCharacter7(X_CURSOR_2_CHARACTER_3), .yCharacter7(Y_CURSOR_2), .character7(cursor2Character3), .character7Color(LIGHT_PURPLE),
        .xCharacter6(X_CURSOR_2_CHARACTER_2), .yCharacter6(Y_CURSOR_2), .character6(cursor2Character2), .character6Color(LIGHT_PURPLE),
        .xCharacter5(X_CURSOR_2_CHARACTER_1), .yCharacter5(Y_CURSOR_2), .character5(cursor2Character1), .character5Color(LIGHT_PURPLE),
        
        .xCharacter4(X_CURSOR_2_CHARACTER_0), .yCharacter4(Y_CURSOR_2), .character4(cursor2Character0), .character4Color(LIGHT_PURPLE),
        .xCharacter3(X_CHANNEL_SELECTED), .yCharacter3(Y_CHANNEL_SELECTED), .character3(channelSelected ? 7'd18 : 7'd17), 
            .character3Color(channelSelected ? BLUE : YELLOW),
        .xCharacter2(), .yCharacter2(), .character2(), .character2Color(),
        .xCharacter1(), .yCharacter1(), .character1(), .character1Color(),
        .xCharacter0(), .yCharacter0(), .character0(), .character0Color(),
        
        .displayX(textDisplayX), .displayY(textDisplayY), 
        .hsync(textHsync), .vsync(textVsync), .blank(textBlank), .previousPixel(textPixel),
        .displayXOut(text2DisplayX), .displayYOut(text2DisplayY), 
        .hsyncOut(text2Hsync), .vsyncOut(text2Vsync), .blankOut(text2Blank), .pixel(text2Pixel), .addressA()
     );
     
     always @(posedge CLK108MHZ) begin
        {VGA_R, VGA_G, VGA_B} <= !text2Blank ? text2Pixel : 12'b0;
        VGA_HS <= text2Hsync;
        VGA_VS <= text2Vsync;
     end
         
endmodule
