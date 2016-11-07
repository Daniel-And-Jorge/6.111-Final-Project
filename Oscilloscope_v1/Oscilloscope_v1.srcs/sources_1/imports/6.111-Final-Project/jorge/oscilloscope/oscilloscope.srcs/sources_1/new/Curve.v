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


module Curve
    #(parameter DATA_IN_BITS = 12,
                DISPLAY_X_BITS = 12,
                DISPLAY_Y_BITS = 12,
                RGB_COLOR = 12'hFF0,  //yellow
                RGB_BITS = 12,
                DISPLAY_WIDTH = 1280,
                DISPLAY_HEIGHT = 1024,
                REAL_DISPLAY_WIDTH = 1688,
                REAL_DISPLAY_HEIGHT = 1066,
                HEIGHT_ZERO_PIXEL = DISPLAY_HEIGHT/2,
                ADDITIONAL_WAVE_PIXELS = 1,  //number of colored pixels below and on top of the actual wave
                SCALING_SHIFTS = 0,
                ADDRESS_BITS = 12
                )
    (input clock,
    input signed [DATA_IN_BITS-1:0] dataIn,
    input [DISPLAY_X_BITS-1:0] displayX,
    input [DISPLAY_Y_BITS-1:0] displayY,
    input hsync,
    input vsync,
    input blank,
    output [RGB_BITS-1:0] pixel,
    output reg drawStarting,
    output reg [ADDRESS_BITS-1:0] address,
    output reg [DISPLAY_X_BITS-1:0] curveDisplayX,
    output reg [DISPLAY_Y_BITS-1:0] curveDisplayY,
    output reg curveHsync,
    output reg curveVsync,
    output reg curveBlank
    );    
    
    //scale dataIn
    wire signed [DATA_IN_BITS-1:0] scaledDataIn;
    assign scaledDataIn = dataIn >> SCALING_SHIFTS;
    
    // figure out horiz location on screen
    // this has to be unsigned!
    wire [DATA_IN_BITS-1:0] dataScreenLocation;
    assign dataScreenLocation = HEIGHT_ZERO_PIXEL - scaledDataIn;
    
    reg pixelOn;
    
    always @(posedge clock) begin
        // todo delay these by the correct number of cycles
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
        
        //control pixel
        
        // data value above zero
        if ( (dataScreenLocation - ADDITIONAL_WAVE_PIXELS)<=displayY &&
             displayY<=(dataScreenLocation + ADDITIONAL_WAVE_PIXELS) ) begin
            pixelOn <= 1;
        end else begin
            pixelOn <= 0;
        end
        
        //control address
        if (0<=displayX && displayX<=(DISPLAY_WIDTH-4)) begin
            address <= displayX - (DISPLAY_WIDTH-4);
        end else if ((REAL_DISPLAY_WIDTH-3)<=displayX && displayX<=(REAL_DISPLAY_WIDTH-1) ) begin
            address <= displayX - (REAL_DISPLAY_WIDTH + DISPLAY_WIDTH - 4);
        end else begin
            //output address is irrelevant in this case
            address <= address;
        end
    end
    
    assign pixel = pixelOn ? RGB_COLOR : 0;
    
endmodule