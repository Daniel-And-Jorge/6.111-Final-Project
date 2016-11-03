`timescale 1ns / 1ps
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
   #(parameter  TRIGGER_THRESHOLD = 2048,
                DISPLAY_X_BITS = 11,
                DISPLAY_Y_BITS = 10,
                ADDRESS_BITS = 11) 
   (input CLK100MHZ,
   input vauxp11,
   input vauxn11,
   input [1:0] sw,
   input CPU_RESETN,
   output reg [15:0] LED,
   output [7:0] an,
   output [6:0] seg,
   output VGA_HS,
   output VGA_VS,
   output [3:0] VGA_R, output [3:0] VGA_G, output [3:0] VGA_B
    );
    
    wire reset;
    assign reset = 0;
    //debounce rdb(.reset(reset), .clock(CLK100MHZ), .noisy(CPU_RESETN), .clean(reset));
    
    wire CLK65MHZ;
    //instantiate clock divider
    clk_wiz_0 ClockDivider
       (
       // Clock in ports
        .clk_in1(CLK100MHZ),      // input clk_in1
        // Clock out ports
        .clk_out1(CLK65MHZ),     // output clk_out1
        // Status and control signals
        .reset(reset), // input reset
        .locked(locked));

    
    // XADC IP module
    wire eoc;
    wire ready;
    wire [15:0] XADCdataOut;   
    reg [6:0] Address_in = 7'h1b;   
    //xadc instantiation connect the eoc_out .den_in to get continuous conversion
    xadc_wiz_0  XLXI_7 (.daddr_in(Address_in), //addresses can be found in the artix 7 XADC user guide DRP register space
                         .dclk_in(CLK65MHZ), 
                         .den_in(eoc), 
                         .di_in(), 
                         .dwe_in(), 
                         .busy_out(),                    
                         .vauxp11(vauxp11),
                         .vauxn11(vauxn11),
                         .vn_in(),
                         .vp_in(),
                         .alarm_out(),
                         .do_out(XADCdataOut),
                         .reset_in(reset), // ddr
                         .eoc_out(eoc), // ddr high for one cycle on end of conversion
                         .channel_out(),
                         .drdy_out(ready));
         
      // ADC controller
      wire adcc_ready;
      wire [11:0] ADCCdataOut;
      ADCController adcc(
                             .clock(CLK65MHZ),
                             .reset(reset),
                             .sampleEnabled(1),
                             .inputReady(eoc),
                             .dataIn(XADCdataOut[15:4]),
                             .ready(adcc_ready),
                             .dataOut(ADCCdataOut)
                             );
    
    wire [11:0] bufferDataOut;
    buffer Buffer (.clock(CLK65MHZ), .ready(adcc_ready), .dataIn(ADCCdataOut),
        .isTrigger(isTriggered), .disableCollection(0), .lockTrigger(drawStarting),
        .reset(reset),
        .readTriggerRelative(1),
        .readAddress(curveAddressOut),
        .dataOut(bufferDataOut));
        
    wire isTriggered;
    TriggerRisingEdge #(.DATA_BITS(12))
            Trigger
            (.clock(CLK65MHZ),
            .threshold(TRIGGER_THRESHOLD),
            .dataIn(ADCCdataOut),
            .triggerDisable(0),
            .isTriggered(isTriggered)
            );
            
     wire [DISPLAY_X_BITS-1:0] displayX;
     wire [DISPLAY_Y_BITS-1:0] displayY;
     wire vsync;
     wire hsync;
     wire blank;
     xvga(.vclock(CLK65MHZ),
        .displayX(displayX), // pixel number on current line
        .displayY(displayY), // line number
        .vsync(vsync), .hsync(hsync), .blank(blank));
        
    wire drawStarting;
    wire [ADDRESS_BITS-1:0] curveAddressOut;
    wire curveHsync;
    wire curveVsync;
    wire curveBlank;
    wire [23:0] curvePixel;
    Curve #(.ADDRESS_BITS(ADDRESS_BITS))
            myCurve
            (.clock(CLK65MHZ),
            .dataIn(bufferDataOut),
            .displayX(displayX),
            .displayY(displayY),
            .hsync(hsync),
            .vsync(vsync),
            .blank(blank),
            .pixel(pixel),
            .drawStarting(drawStarting),
            .address(curveAddressOut),
            .curveHsync(curveHsync),
            .curveVsync(curveVsync),
            .curveBlank(curveBlank)
            );
   /* 
    assign VGA_HS = curveHsync;
    assign VGA_VS = curveVsync;
    assign VGA_R = (curvePixel > 0) && !curveBlank ? 4'b1100 : 0;
    assign VGA_B = 0;
    assign VGA_G = 0;
    */
    
    assign VGA_HS = hsync;
    assign VGA_VS = vsync;
    assign VGA_R = blank ? 0 : 4'b1111;
    assign VGA_G = 0;
    assign VGA_B = 0;
endmodule