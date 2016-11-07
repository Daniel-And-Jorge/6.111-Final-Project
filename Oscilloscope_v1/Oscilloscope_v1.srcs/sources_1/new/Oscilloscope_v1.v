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
   #(parameter  DISPLAY_X_BITS = 11,
                DISPLAY_Y_BITS = 11,
                ADDRESS_BITS = 12,
                RGB_BITS = 12) 
   (input CLK100MHZ,
   input vauxp11,
   input vauxn11,
   input [7:0] SW,
   //input reset,
   output reg [15:0] LED,
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
    
    wire CLK65MHZ;
    wire CLK108MHZ;
    //instantiate clock divider
    clk_wiz_0 ClockDivider
       (
       // Clock in ports
        .clk_in1(CLK100MHZ),      // input clk_in1
        // Clock out ports
        .clk_out1(CLK65MHZ),     // output clk_out1
        .clk_out2(CLK108MHZ),    // output clk_out2
        // Status and control signals
        .reset(reset), // input reset
        .locked(locked));
        
    // Scope settings
    wire [11:0] triggerThreshold;
    ScopeSettings myss(.sw(SW[7:0]), .triggerThreshold(triggerThreshold));
    
    // XADC IP module
    wire eoc;
    wire ready;
    wire [15:0] XADCdataOut;   
    reg [6:0] Address_in = 7'h1b; // select VAUXP/N11 as input [see Artix 7 XADC]
    //xadc instantiation connect the eoc_out .den_in to get continuous conversion
    xadc_wiz_0  XLXI_7 (.daddr_in(Address_in), //addresses can be found in the artix 7 XADC user guide DRP register space
                         .dclk_in(CLK108MHZ), 
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
                             .clock(CLK108MHZ),
                             .reset(reset),
                             .sampleEnabled(1),
                             .inputReady(eoc),
                             .dataIn(XADCdataOut[15:4]),
                             .ready(adcc_ready),
                             .dataOut(ADCCdataOut)
                             );

//    wire adcc_ready;
//    wire [11:0] ADCCdataOut;
//    assign adcc_ready = 1;
//    FakeADCC adcc(.clock(CLK65MHZ), .dataOut(ADCCdataOut));
    
    wire [11:0] bufferDataOut;
    wire activeBramSelect;
    BufferSelector mybs(
        .clock(CLK108MHZ),
        .drawStarting(drawStarting),
        .activeBramSelect(activeBramSelect)
        );
    
    buffer Buffer (.clock(CLK108MHZ), .ready(adcc_ready), .dataIn(ADCCdataOut),
        .isTrigger(isTriggered), .disableCollection(0), .activeBramSelect(activeBramSelect),
        //.isTrigger(isTriggered), .disableCollection(0), .activeBramSelect(sw[0]),
        .reset(reset),
        .readTriggerRelative(1),
        .readAddress(curveAddressOut),
        .dataOut(bufferDataOut));

//    wire [11:0] bufferDataOut;
//    ConstantFakeBuffer buffer(.address(), .dataOut(bufferDataOut));
        
    wire isTriggered;
    TriggerRisingEdgeSteady #(.DATA_BITS(12), .HOLDOFF_SAMPLES(10))
            Trigger
            (.clock(CLK108MHZ),
            .threshold(triggerThreshold),
            .dataIn(ADCCdataOut),
            .triggerDisable(0),
            .isTriggered(isTriggered)
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
        
    wire drawStarting;
    wire [ADDRESS_BITS-1:0] curveAddressOut;
    wire [DISPLAY_X_BITS-1:0] curveDisplayX;
    wire [DISPLAY_Y_BITS-1:0] curveDisplayY;
    wire curveHsync;
    wire curveVsync;
    wire curveBlank;
    wire [RGB_BITS-1:0] curvePixel;
    Curve #(.ADDRESS_BITS(ADDRESS_BITS))
            myCurve
            (.clock(CLK108MHZ),
            .dataIn(bufferDataOut),
            .displayX(gridDisplayX),
            .displayY(gridDisplayY),
            .hsync(gridHsync),
            .vsync(gridVsync),
            .blank(gridBlank),
            .previousPixel(gridPixel),
            .pixel(curvePixel),
            .drawStarting(drawStarting),
            .address(curveAddressOut),
            .curveDisplayX(curveDisplayX),
            .curveDisplayY(curveDisplayY),
            .curveHsync(curveHsync),
            .curveVsync(curveVsync),
            .curveBlank(curveBlank)
            );
     
     wire [RGB_BITS-1:0] tlsPixel;
     TriggerLevelSprite mytls
                (.clock(CLK108MHZ),
                .threshold(triggerThreshold),
                .displayX(curveDisplayX),
                .displayY(curveDisplayY),
                .hsync(curveHsync),
                .vsync(curveVsync),
                .blank(curveBlank),
                .previousPixel(curvePixel),
                .pixel(tlsPixel),
                .spriteHsync(tlsHsync),
                .spriteVsync(tlsVsync),
                .spriteBlank(tlsBlank)
                );       
     
     
     always @(posedge CLK108MHZ) begin
        {VGA_R, VGA_G, VGA_B} <= !curveBlank ? tlsPixel : 12'b0;
        VGA_HS <= tlsHsync;
        VGA_VS <= tlsVsync;
     end
         
endmodule
