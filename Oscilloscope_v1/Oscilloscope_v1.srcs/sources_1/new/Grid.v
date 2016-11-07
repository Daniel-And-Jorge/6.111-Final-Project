`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2016 03:36:50 PM
// Design Name: 
// Module Name: Grid
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
// Assumptions:
//////////////////////////////////////////////////////////////////////////////////


module Grid
    #(parameter //HORIZONTAL_PIXELS_PER_DIVISION = 100,
                //VERTICAL_PIXELS_PER_DIVISION = 100,
                //DISPLAY_WIDTH = 1280,
                //DISPLAY_HEIGHT = 1024,
                //HEIGHT_ZERO_PIXEL = DISPLAY_HEIGHT/2,
                DISPLAY_X_BITS = 12,
                DISPLAY_Y_BITS = 12,
                GRID_COLOR = 12'hCCC,    //grey
                COLOR_PIXELS = 100,
                ADDITIONAL_LINE_PIXELS = 0,
                ADDITIONAL_ZERO_LINE_PIXELS = 1)
    (input clock,
    input [DISPLAY_X_BITS-1:0] displayX,
    input [DISPLAY_Y_BITS-1:0] displayY,
    input hsync,
    input vsync,
    input blank,
    output reg [DISPLAY_X_BITS-1:0] gridDisplayX,
    output reg [DISPLAY_X_BITS-1:0] gridDisplayY,
    output reg gridHsync,
    output reg gridVsync,
    output reg gridBlank,
    output reg [COLOR_PIXELS-1:0] pixel);
    
    always @(posedge clock) begin
        
        // draw horizontal grid lines
        if ((100 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (100 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((200 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (200 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((300 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (300 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((400 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (400 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((500 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (500 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((600 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (600 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((700 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (700 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((800 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (800 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((900 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (900 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((1000 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (1000 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((1100 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (1100 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((1200 - ADDITIONAL_LINE_PIXELS) <= displayX && displayX <= (1200 + ADDITIONAL_LINE_PIXELS)) begin
             pixel <= GRID_COLOR;
        
        // draw vertical grid lines
        end else if ((12 - ADDITIONAL_LINE_PIXELS) <= displayY && displayY <= (12 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((112 - ADDITIONAL_LINE_PIXELS) <= displayY && displayY <= (112 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((212 - ADDITIONAL_LINE_PIXELS) <= displayY && displayY <= (212 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((312 - ADDITIONAL_LINE_PIXELS) <= displayY && displayY <= (312 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((412 - ADDITIONAL_LINE_PIXELS) <= displayY && displayY <= (412 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((512 - ADDITIONAL_ZERO_LINE_PIXELS) <= displayY && displayY <= (512 + ADDITIONAL_ZERO_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((612 - ADDITIONAL_LINE_PIXELS) <= displayY && displayY <= (612 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((712 - ADDITIONAL_LINE_PIXELS) <= displayY && displayY <= (712 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((812 - ADDITIONAL_LINE_PIXELS) <= displayY && displayY <= (812 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((912 - ADDITIONAL_LINE_PIXELS) <= displayY && displayY <= (912 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else if ((1012 - ADDITIONAL_LINE_PIXELS) <= displayY && displayY <= (1012 + ADDITIONAL_LINE_PIXELS)) begin
            pixel <= GRID_COLOR;
        end else begin
            pixel <= 12'h000;
        end
        
        // forward VGA signals to next module
        gridDisplayX <= displayX;
        gridDisplayY <= displayY;
        gridHsync <= hsync;
        gridVsync <= vsync;
        gridBlank <= blank;
        
    end
    
endmodule
