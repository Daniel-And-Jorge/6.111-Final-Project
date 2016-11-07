`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2016 10:45:10 PM
// Design Name: 
// Module Name: TriggerLevelSprite
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


module TriggerLevelSprite
    #(parameter DATA_IN_BITS = 12,
                DISPLAY_X_BITS = 12,
                DISPLAY_Y_BITS = 12,
                RGB_BITS = 12,
                RGB_COLOR = 12'hF00,  // red
                DISPLAY_WIDTH = 1280,
                DISPLAY_HEIGHT = 1024,
                HEIGHT_ZERO_PIXEL = DISPLAY_HEIGHT/2,
                ADDITIONAL_LINE_PIXELS = 1  //number of colored pixels below and on top of the actual wave
                )
    (input clock,
    input signed [DATA_IN_BITS-1:0] threshold,
    input [DISPLAY_X_BITS-1:0] displayX,
    input [DISPLAY_Y_BITS-1:0] displayY,
    input hsync,
    input vsync,
    input blank,
    input [RGB_BITS-1:0] previousPixel,
    output reg [RGB_BITS-1:0] pixel,
    output reg spriteHsync,
    output reg spriteVsync,
    output reg spriteBlank
    );
    
    // figure out horiz location on screen
    // this has to be unsigned!
    wire [DATA_IN_BITS-1:0] dataScreenLocation;
    assign dataScreenLocation = HEIGHT_ZERO_PIXEL - threshold;
    
    always @(posedge clock) begin
        if (displayY - ADDITIONAL_LINE_PIXELS <= dataScreenLocation &&
            dataScreenLocation <= displayY + ADDITIONAL_LINE_PIXELS)
            pixel <= RGB_COLOR;
        else
            pixel <= previousPixel;
            
        spriteHsync <= hsync;
        spriteVsync <= vsync;
        spriteBlank <= blank;
    end   
endmodule
