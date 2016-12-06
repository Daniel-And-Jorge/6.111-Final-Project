`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2016 01:19:40 PM
// Design Name: 
// Module Name: Curve
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

`include "VerticalScaler.vh"


module XYCurve
    #(parameter DATA_IN_BITS = 12,
                SCALE_FACTOR_BITS = 10,
                DISPLAY_X_BITS = 12,
                DISPLAY_Y_BITS = 12,
                RGB_COLOR = 12'hFF0,  //yellow
                RGB_BITS = 12,
                DISPLAY_WIDTH = 1280,
                DISPLAY_HEIGHT = 1024,
                REAL_DISPLAY_WIDTH = 1688,
                REAL_DISPLAY_HEIGHT = 1066,
                WIDTH_ZERO_PIXEL = DISPLAY_WIDTH/2,
                HEIGHT_ZERO_PIXEL = DISPLAY_HEIGHT/2,
                ADDITIONAL_WAVE_PIXELS = 1,  //number of colored pixels below and on top of the actual wave
                ADDRESS_BITS = 12
                )
    (input clock,
    input signed [DATA_IN_BITS-1:0] dataIn1,
    input signed [DATA_IN_BITS-1:0] dataIn2,
    input [SCALE_FACTOR_BITS-1:0] verticalScaleFactorTimes8, // to allow for shrinking and growing the signal
    input [DISPLAY_X_BITS-1:0] displayX,
    input [DISPLAY_Y_BITS-1:0] displayY,
    input hsync,
    input vsync,
    input blank,
    input [RGB_BITS-1:0] previousPixel,
    output [RGB_BITS-1:0] pixel,
    output reg drawStarting,
    output [ADDRESS_BITS-1:0] address1,
    output [ADDRESS_BITS-1:0] address2,
    output reg [DISPLAY_X_BITS-1:0] curveDisplayX,
    output reg [DISPLAY_Y_BITS-1:0] curveDisplayY,
    output reg curveHsync,
    output reg curveVsync,
    output reg curveBlank
    );
    
    reg [DISPLAY_X_BITS-1:0] currentSample = 0;
    wire [DATA_IN_BITS-1:0]shiftedPixel1;
    wire [DATA_IN_BITS-1:0]shiftedPixel2;
    
    assign address1 = currentSample;
    assign address2 = currentSample;
    
    assign shiftedPixel1 = WIDTH_ZERO_PIXEL + dataIn1; // x location
    assign shiftedPixel2 = HEIGHT_ZERO_PIXEL - dataIn2; // y location, - since screen values increase downward
    
    reg displayedRow = 0;
    reg [DISPLAY_X_BITS-1:0]pixelRows[1:0];
    
    reg pixelOn;
    
    always @(posedge clock) begin
        // 1. Perform display from non-active row buffer
    
        // TODO delay these by the correct number of cycles
        curveHsync <= hsync;
        curveVsync <= vsync;
        curveBlank <= blank;
        curveDisplayX <= displayX;
        curveDisplayY <= displayY;
        
        //control drawStarting
        if (displayX==(DISPLAY_WIDTH-1) && displayY==(DISPLAY_HEIGHT-1)) begin
            drawStarting <= 1;
        end else begin
            drawStarting <= 0;
        end
        
        // output pixel value from the buffer
        pixelOn <= pixelRows[displayedRow][displayY];

        // 2. Figure out what pixels will go in the next row
        // plan: we compute what to display row by row, since each row contains n samples
        // n clock cycles before we need to start displaying the pixels for a given row, we start requesting
        // samples from the buffer, iterating through time. Each timestep, we draw a pixel if necessary in
        // whatever location it should appear in in the next row. Meanwhile we're sending the current row
        // to the monitor. At the end of the row, the two swap.
       
       if ( shiftedPixel2 == (displayY + 1) )
            pixelRows[~displayedRow][shiftedPixel1] <= 1;
        
        currentSample <= currentSample + 1;
    end
    
    assign pixel = pixelOn ? RGB_COLOR : previousPixel;
    
endmodule
