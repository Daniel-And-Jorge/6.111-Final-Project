`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2016 11:13:27 AM
// Design Name: 
// Module Name: Text
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


module Text
    #(parameter DISPLAY_X_BITS = 12,
                DISPLAY_Y_BITS = 12,
                CHARACTER_WIDTH = 18,
                CHARACTER_WIDTH_BITS = 5,
                CHARACTER_HEIGHT = 32,
                CHARACTER_HEIGHT_BITS = 5,
                SELECT_CHARACTER_BITS = 7,
                BRAM_ADDRESS_BITS = 17,
                CHARACTER_COLOR = 12'h0F0,  //green
                CURSOR_1_COLOR = 12'hF0F,  //purple
                COLOR_BITS = 12)
    (input clock,
    input [DISPLAY_X_BITS-1:0] xMiddleVoltage4,
    input [DISPLAY_Y_BITS-1:0] yMiddleVoltage4,
    input [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter4,
    input [DISPLAY_X_BITS-1:0] xMiddleVoltage3,
    input [DISPLAY_Y_BITS-1:0] yMiddleVoltage3,
    input [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter3,
    input [DISPLAY_X_BITS-1:0] xMiddleVoltage2,
    input [DISPLAY_Y_BITS-1:0] yMiddleVoltage2,
    input [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter2,
    input [DISPLAY_X_BITS-1:0] xMiddleVoltage1,
    input [DISPLAY_Y_BITS-1:0] yMiddleVoltage1,
    input [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter1,
    input [DISPLAY_X_BITS-1:0] xMiddleVoltage0,
    input [DISPLAY_Y_BITS-1:0] yMiddleVoltage0,  
    input [SELECT_CHARACTER_BITS-1:0] middleVoltageCharacter0,
    
    input [DISPLAY_X_BITS-1:0] xTimePerDivision4,
    input [DISPLAY_Y_BITS-1:0] yTimePerDivision4,
    input [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter4,
    input [DISPLAY_X_BITS-1:0] xTimePerDivision3,
    input [DISPLAY_Y_BITS-1:0] yTimePerDivision3,
    input [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter3,
    input [DISPLAY_X_BITS-1:0] xTimePerDivision2,
    input [DISPLAY_Y_BITS-1:0] yTimePerDivision2,
    input [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter2,
    input [DISPLAY_X_BITS-1:0] xTimePerDivision1,
    input [DISPLAY_Y_BITS-1:0] yTimePerDivision1,
    input [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter1,
    input [DISPLAY_X_BITS-1:0] xTimePerDivision0,
    input [DISPLAY_Y_BITS-1:0] yTimePerDivision0,
    input [SELECT_CHARACTER_BITS-1:0] timePerDivisionCharacter0,
    
    input [DISPLAY_X_BITS-1:0] xVoltagePerDivision4,
    input [DISPLAY_Y_BITS-1:0] yVoltagePerDivision4,
    input [SELECT_CHARACTER_BITS-1:0] voltagePerDivisionCharacter4,
    input [DISPLAY_X_BITS-1:0] xVoltagePerDivision3,
    input [DISPLAY_Y_BITS-1:0] yVoltagePerDivision3,
    input [SELECT_CHARACTER_BITS-1:0] voltagePerDivisionCharacter3,
    input [DISPLAY_X_BITS-1:0] xVoltagePerDivision2,
    input [DISPLAY_Y_BITS-1:0] yVoltagePerDivision2,
    input [SELECT_CHARACTER_BITS-1:0] voltagePerDivisionCharacter2,
    input [DISPLAY_X_BITS-1:0] xVoltagePerDivision1,
    input [DISPLAY_Y_BITS-1:0] yVoltagePerDivision1,
    input [SELECT_CHARACTER_BITS-1:0] voltagePerDivisionCharacter1,
    input [DISPLAY_X_BITS-1:0] xVoltagePerDivision0,
    input [DISPLAY_Y_BITS-1:0] yVoltagePerDivision0,
    input [SELECT_CHARACTER_BITS-1:0] voltagePerDivisionCharacter0,
    
    input [DISPLAY_X_BITS-1:0] xMax9,
    input [DISPLAY_Y_BITS-1:0] yMax9,
    input [SELECT_CHARACTER_BITS-1:0] maxCharacter9,
    input [DISPLAY_X_BITS-1:0] xMax8,
    input [DISPLAY_Y_BITS-1:0] yMax8,
    input [SELECT_CHARACTER_BITS-1:0] maxCharacter8,
    input [DISPLAY_X_BITS-1:0] xMax7,
    input [DISPLAY_Y_BITS-1:0] yMax7,
    input [SELECT_CHARACTER_BITS-1:0] maxCharacter7,
    input [DISPLAY_X_BITS-1:0] xMax6,
    input [DISPLAY_Y_BITS-1:0] yMax6,
    input [SELECT_CHARACTER_BITS-1:0] maxCharacter6,
    input [DISPLAY_X_BITS-1:0] xMax5,
    input [DISPLAY_Y_BITS-1:0] yMax5,
    input [SELECT_CHARACTER_BITS-1:0] maxCharacter5,
    input [DISPLAY_X_BITS-1:0] xMax4,
    input [DISPLAY_Y_BITS-1:0] yMax4,
    input [SELECT_CHARACTER_BITS-1:0] maxCharacter4,
    input [DISPLAY_X_BITS-1:0] xMax3,
    input [DISPLAY_Y_BITS-1:0] yMax3,
    input [SELECT_CHARACTER_BITS-1:0] maxCharacter3,
    input [DISPLAY_X_BITS-1:0] xMax2,
    input [DISPLAY_Y_BITS-1:0] yMax2,
    input [SELECT_CHARACTER_BITS-1:0] maxCharacter2,
    input [DISPLAY_X_BITS-1:0] xMax1,
    input [DISPLAY_Y_BITS-1:0] yMax1,
    input [SELECT_CHARACTER_BITS-1:0] maxCharacter1,
    input [DISPLAY_X_BITS-1:0] xMax0,
    input [DISPLAY_Y_BITS-1:0] yMax0,
    input [SELECT_CHARACTER_BITS-1:0] maxCharacter0,
    
    input [DISPLAY_X_BITS-1:0] xCursor1_15,
    input [DISPLAY_Y_BITS-1:0] yCursor1_15,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character15,
    input [DISPLAY_X_BITS-1:0] xCursor1_14,
    input [DISPLAY_Y_BITS-1:0] yCursor1_14,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character14,
    input [DISPLAY_X_BITS-1:0] xCursor1_13,
    input [DISPLAY_Y_BITS-1:0] yCursor1_13,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character13,
    input [DISPLAY_X_BITS-1:0] xCursor1_12,
    input [DISPLAY_Y_BITS-1:0] yCursor1_12,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character12,
    input [DISPLAY_X_BITS-1:0] xCursor1_11,
    input [DISPLAY_Y_BITS-1:0] yCursor1_11,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character11,
    input [DISPLAY_X_BITS-1:0] xCursor1_10,
    input [DISPLAY_Y_BITS-1:0] yCursor1_10,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character10,
    input [DISPLAY_X_BITS-1:0] xCursor1_9,
    input [DISPLAY_Y_BITS-1:0] yCursor1_9,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character9,
    input [DISPLAY_X_BITS-1:0] xCursor1_8,
    input [DISPLAY_Y_BITS-1:0] yCursor1_8,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character8,
    input [DISPLAY_X_BITS-1:0] xCursor1_7,
    input [DISPLAY_Y_BITS-1:0] yCursor1_7,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character7,
    input [DISPLAY_X_BITS-1:0] xCursor1_6,
    input [DISPLAY_Y_BITS-1:0] yCursor1_6,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character6,
    input [DISPLAY_X_BITS-1:0] xCursor1_5,
    input [DISPLAY_Y_BITS-1:0] yCursor1_5,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character5,
    input [DISPLAY_X_BITS-1:0] xCursor1_4,
    input [DISPLAY_Y_BITS-1:0] yCursor1_4,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character4,
    input [DISPLAY_X_BITS-1:0] xCursor1_3,
    input [DISPLAY_Y_BITS-1:0] yCursor1_3,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character3,
    input [DISPLAY_X_BITS-1:0] xCursor1_2,
    input [DISPLAY_Y_BITS-1:0] yCursor1_2,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character2,
    input [DISPLAY_X_BITS-1:0] xCursor1_1,
    input [DISPLAY_Y_BITS-1:0] yCursor1_1,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character1,
    input [DISPLAY_X_BITS-1:0] xCursor1_0,
    input [DISPLAY_Y_BITS-1:0] yCursor1_0,
    input [SELECT_CHARACTER_BITS-1:0] cursor1Character0,
        
    input [DISPLAY_X_BITS-1:0] displayX,
    input [DISPLAY_Y_BITS-1:0] displayY,
    input hsync,
    input vsync,
    input blank,
    input [COLOR_BITS-1:0] previousPixel,
    output reg [DISPLAY_X_BITS-1:0] displayXOut,
    output reg [DISPLAY_Y_BITS-1:0] displayYOut,
    output reg hsyncOut,
    output reg vsyncOut,
    output reg blankOut,
    output reg [COLOR_BITS-1:0] pixel,
    output reg [BRAM_ADDRESS_BITS-1:0] addressA = 0);
    
    //reg [BRAM_ADDRESS_BITS-1:0] addressA = 0;
    wire dataOutA;
    
    //delay registers for hsync, vsync, blank, displayX, displayY
    reg [DISPLAY_X_BITS-1:0] displayX1 = 0;
    reg [DISPLAY_Y_BITS-1:0] displayY1 = 0;
    reg [DISPLAY_X_BITS-1:0] displayX2 = 0;
    reg [DISPLAY_Y_BITS-1:0] displayY2 = 0;
    reg [DISPLAY_X_BITS-1:0] displayX3 = 0;
    reg [DISPLAY_Y_BITS-1:0] displayY3 = 0;
    reg [DISPLAY_X_BITS-1:0] displayX4 = 0;
    reg [DISPLAY_Y_BITS-1:0] displayY4 = 0;
    
    reg hsync1 = 0;
    reg vsync1 = 0;
    reg blank1 = 0;
    reg [COLOR_BITS-1:0] previousPixel1 = 0;
    reg hsync2 = 0;
    reg vsync2 = 0;
    reg blank2 = 0;
    reg [COLOR_BITS-1:0] previousPixel2 = 0;
    reg hsync3 = 0;
    reg vsync3 = 0;
    reg blank3 = 0;
    reg [COLOR_BITS-1:0] previousPixel3 = 0;
    reg hsync4 = 0;
    reg vsync4 = 0;
    reg blank4 = 0;
    reg [COLOR_BITS-1:0] previousPixel4 = 0;
    
    reg [CHARACTER_HEIGHT_BITS-1:0] row = 0;
    reg [CHARACTER_WIDTH_BITS-1:0] column = 0;
    
    always @(posedge clock) begin
        //edge 0
        if (xMiddleVoltage4 <= displayX && displayX < (xMiddleVoltage4 + CHARACTER_WIDTH) &&
            yMiddleVoltage4 <= displayY && displayY < (yMiddleVoltage4 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yMiddleVoltage4;
            column <= displayX - xMiddleVoltage4;
        end else if (xMiddleVoltage3 <= displayX && displayX < (xMiddleVoltage3 + CHARACTER_WIDTH) &&
            yMiddleVoltage3 <= displayY && displayY < (yMiddleVoltage3 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yMiddleVoltage3;
            column <= displayX - xMiddleVoltage3;
        end else if (xMiddleVoltage2 <= displayX && displayX < (xMiddleVoltage2 + CHARACTER_WIDTH) &&
            yMiddleVoltage2 <= displayY && displayY < (yMiddleVoltage2 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yMiddleVoltage2;
            column <= displayX - xMiddleVoltage2;
        end else if (xMiddleVoltage1 <= displayX && displayX < (xMiddleVoltage1 + CHARACTER_WIDTH) &&
            yMiddleVoltage1 <= displayY && displayY < (yMiddleVoltage1 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yMiddleVoltage1;
            column <= displayX - xMiddleVoltage1;
        end else if (xMiddleVoltage0 <= displayX && displayX < (xMiddleVoltage0 + CHARACTER_WIDTH) &&
            yMiddleVoltage0 <= displayY && displayY < (yMiddleVoltage0 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yMiddleVoltage0;
            column <= displayX - xMiddleVoltage0;
            
        end else if (xTimePerDivision4 <= displayX && displayX < (xTimePerDivision4 + CHARACTER_WIDTH) &&
            yTimePerDivision4 <= displayY && displayY < (yTimePerDivision4 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yTimePerDivision4;
            column <= displayX - xTimePerDivision4;
        end  else if (xTimePerDivision3 <= displayX && displayX < (xTimePerDivision3 + CHARACTER_WIDTH) &&
           yTimePerDivision3 <= displayY && displayY < (yTimePerDivision3 + CHARACTER_HEIGHT)) begin   
           row <= displayY - yTimePerDivision3;
           column <= displayX - xTimePerDivision3;
        end else if (xTimePerDivision2 <= displayX && displayX < (xTimePerDivision2 + CHARACTER_WIDTH) &&
          yTimePerDivision2 <= displayY && displayY < (yTimePerDivision2 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yTimePerDivision2;
          column <= displayX - xTimePerDivision2;
        end else if (xTimePerDivision1 <= displayX && displayX < (xTimePerDivision1 + CHARACTER_WIDTH) &&
           yTimePerDivision1 <= displayY && displayY < (yTimePerDivision1 + CHARACTER_HEIGHT)) begin   
           row <= displayY - yTimePerDivision1;
           column <= displayX - xTimePerDivision1;
        end else if (xTimePerDivision0 <= displayX && displayX < (xTimePerDivision0 + CHARACTER_WIDTH) &&
          yTimePerDivision0 <= displayY && displayY < (yTimePerDivision0 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yTimePerDivision0;
          column <= displayX - xTimePerDivision0;
          
        end else if (xVoltagePerDivision4 <= displayX && displayX < (xVoltagePerDivision4 + CHARACTER_WIDTH) &&
          yVoltagePerDivision4 <= displayY && displayY < (yVoltagePerDivision4 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yVoltagePerDivision4;
          column <= displayX - xVoltagePerDivision4;
        end else if (xVoltagePerDivision3 <= displayX && displayX < (xVoltagePerDivision3 + CHARACTER_WIDTH) &&
          yVoltagePerDivision3 <= displayY && displayY < (yVoltagePerDivision3 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yVoltagePerDivision3;
          column <= displayX - xVoltagePerDivision3;
        end else if (xVoltagePerDivision2 <= displayX && displayX < (xVoltagePerDivision2 + CHARACTER_WIDTH) &&
          yVoltagePerDivision2 <= displayY && displayY < (yVoltagePerDivision2 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yVoltagePerDivision2;
          column <= displayX - xVoltagePerDivision2;
        end else if (xVoltagePerDivision1 <= displayX && displayX < (xVoltagePerDivision1 + CHARACTER_WIDTH) &&
          yVoltagePerDivision1 <= displayY && displayY < (yVoltagePerDivision1 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yVoltagePerDivision1;
          column <= displayX - xVoltagePerDivision1;
        end else if (xVoltagePerDivision0 <= displayX && displayX < (xVoltagePerDivision0 + CHARACTER_WIDTH) &&
          yVoltagePerDivision0 <= displayY && displayY < (yVoltagePerDivision0 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yVoltagePerDivision0;
          column <= displayX - xVoltagePerDivision0;
          
        end else if (xMax9 <= displayX && displayX < (xMax9 + CHARACTER_WIDTH) &&
          yMax9 <= displayY && displayY < (yMax9 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yMax9;
          column <= displayX - xMax9;
        end else if (xMax8 <= displayX && displayX < (xMax8 + CHARACTER_WIDTH) &&
          yMax8 <= displayY && displayY < (yMax8 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yMax8;
          column <= displayX - xMax8;
        end else if (xMax7 <= displayX && displayX < (xMax7 + CHARACTER_WIDTH) &&
          yMax7 <= displayY && displayY < (yMax7 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yMax7;
          column <= displayX - xMax7;
        end else if (xMax6 <= displayX && displayX < (xMax6 + CHARACTER_WIDTH) &&
          yMax6 <= displayY && displayY < (yMax6 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yMax6;
          column <= displayX - xMax6;
        end else if (xMax5 <= displayX && displayX < (xMax5 + CHARACTER_WIDTH) &&
          yMax5 <= displayY && displayY < (yMax5 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yMax5;
          column <= displayX - xMax5;
        end else if (xMax4 <= displayX && displayX < (xMax4 + CHARACTER_WIDTH) &&
          yMax4 <= displayY && displayY < (yMax4 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yMax4;
          column <= displayX - xMax4;
        end else if (xMax3 <= displayX && displayX < (xMax3 + CHARACTER_WIDTH) &&
          yMax3 <= displayY && displayY < (yMax3 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yMax3;
          column <= displayX - xMax3;
        end else if (xMax2 <= displayX && displayX < (xMax2 + CHARACTER_WIDTH) &&
          yMax2 <= displayY && displayY < (yMax2 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yMax2;
          column <= displayX - xMax2;
        end else if (xMax1 <= displayX && displayX < (xMax1 + CHARACTER_WIDTH) &&
          yMax1 <= displayY && displayY < (yMax1 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yMax1;
          column <= displayX - xMax1;
        end else if (xMax0 <= displayX && displayX < (xMax0 + CHARACTER_WIDTH) &&
          yMax0 <= displayY && displayY < (yMax0 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yMax0;
          column <= displayX - xMax0;
          
        end else if (xCursor1_15 <= displayX && displayX < (xCursor1_15 + CHARACTER_WIDTH) &&
          yCursor1_15 <= displayY && displayY < (yCursor1_15 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_15;
          column <= displayX - xCursor1_15;
        end else if (xCursor1_14 <= displayX && displayX < (xCursor1_14 + CHARACTER_WIDTH) &&
          yCursor1_14 <= displayY && displayY < (yCursor1_14 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_14;
          column <= displayX - xCursor1_14;
        end else if (xCursor1_13 <= displayX && displayX < (xCursor1_13 + CHARACTER_WIDTH) &&
          yCursor1_13 <= displayY && displayY < (yCursor1_13 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_13;
          column <= displayX - xCursor1_13;
        end else if (xCursor1_12 <= displayX && displayX < (xCursor1_12 + CHARACTER_WIDTH) &&
          yCursor1_12 <= displayY && displayY < (yCursor1_12 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_12;
          column <= displayX - xCursor1_12;
        end else if (xCursor1_11 <= displayX && displayX < (xCursor1_11 + CHARACTER_WIDTH) &&
          yCursor1_11 <= displayY && displayY < (yCursor1_11 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_11;
          column <= displayX - xCursor1_11;
        end else if (xCursor1_10 <= displayX && displayX < (xCursor1_10 + CHARACTER_WIDTH) &&
          yCursor1_10 <= displayY && displayY < (yCursor1_10 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_10;
          column <= displayX - xCursor1_10;
        end else if (xCursor1_9 <= displayX && displayX < (xCursor1_9 + CHARACTER_WIDTH) &&
          yCursor1_9 <= displayY && displayY < (yCursor1_9 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_9;
          column <= displayX - xCursor1_9;
        end else if (xCursor1_8 <= displayX && displayX < (xCursor1_8 + CHARACTER_WIDTH) &&
          yCursor1_8 <= displayY && displayY < (yCursor1_8 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_8;
          column <= displayX - xCursor1_8;
        end else if (xCursor1_7 <= displayX && displayX < (xCursor1_7 + CHARACTER_WIDTH) &&
          yCursor1_7 <= displayY && displayY < (yCursor1_7 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_7;
          column <= displayX - xCursor1_7;
        end else if (xCursor1_6 <= displayX && displayX < (xCursor1_6 + CHARACTER_WIDTH) &&
          yCursor1_6 <= displayY && displayY < (yCursor1_6 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_6;
          column <= displayX - xCursor1_6;
        end else if (xCursor1_5 <= displayX && displayX < (xCursor1_5 + CHARACTER_WIDTH) &&
          yCursor1_5 <= displayY && displayY < (yCursor1_5 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_5;
          column <= displayX - xCursor1_5;
        end else if (xCursor1_4 <= displayX && displayX < (xCursor1_4 + CHARACTER_WIDTH) &&
          yCursor1_4 <= displayY && displayY < (yCursor1_4 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_4;
          column <= displayX - xCursor1_4;
        end else if (xCursor1_3 <= displayX && displayX < (xCursor1_3 + CHARACTER_WIDTH) &&
          yCursor1_3 <= displayY && displayY < (yCursor1_3 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_3;
          column <= displayX - xCursor1_3;
        end else if (xCursor1_2 <= displayX && displayX < (xCursor1_2 + CHARACTER_WIDTH) &&
          yCursor1_2 <= displayY && displayY < (yCursor1_2 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_2;
          column <= displayX - xCursor1_2;
        end else if (xCursor1_1 <= displayX && displayX < (xCursor1_1 + CHARACTER_WIDTH) &&
          yCursor1_1 <= displayY && displayY < (yCursor1_1 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_1;
          column <= displayX - xCursor1_1;
        end else if (xCursor1_0 <= displayX && displayX < (xCursor1_0 + CHARACTER_WIDTH) &&
          yCursor1_0 <= displayY && displayY < (yCursor1_0 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCursor1_0;
          column <= displayX - xCursor1_0;
        end else begin
          row <= 0;
          column <= 0;
        end
        displayX1 <= displayX;
        displayY1 <= displayY;
        hsync1 <= hsync;
        vsync1 <= vsync;
        blank1 <= blank;
        previousPixel1 <= previousPixel;
        
        
        //edge 1
        if (xMiddleVoltage4 <= displayX1 && displayX1 < (xMiddleVoltage4 + CHARACTER_WIDTH) &&
            yMiddleVoltage4 <= displayY1 && displayY1 < (yMiddleVoltage4 + CHARACTER_HEIGHT)) begin   
            addressA <= {middleVoltageCharacter4, row, column};
        end else if (xMiddleVoltage3 <= displayX1 && displayX1 < (xMiddleVoltage3 + CHARACTER_WIDTH) &&
            yMiddleVoltage3 <= displayY1 && displayY1 < (yMiddleVoltage3 + CHARACTER_HEIGHT)) begin   
            addressA <= {middleVoltageCharacter3, row, column};
        end else if (xMiddleVoltage2 <= displayX1 && displayX1 < (xMiddleVoltage2 + CHARACTER_WIDTH) &&
            yMiddleVoltage2 <= displayY1 && displayY1 < (yMiddleVoltage2 + CHARACTER_HEIGHT)) begin   
            addressA <= {middleVoltageCharacter2, row, column};
        end else if (xMiddleVoltage1 <= displayX1 && displayX1 < (xMiddleVoltage1 + CHARACTER_WIDTH) &&
            yMiddleVoltage1 <= displayY1 && displayY1 < (yMiddleVoltage1 + CHARACTER_HEIGHT)) begin   
            addressA <= {middleVoltageCharacter1, row, column};
        end else if (xMiddleVoltage0 <= displayX1 && displayX1 < (xMiddleVoltage0 + CHARACTER_WIDTH) &&
            yMiddleVoltage0 <= displayY1 && displayY1 < (yMiddleVoltage0 + CHARACTER_HEIGHT)) begin   
            addressA <= {middleVoltageCharacter0, row, column};
            
        end else if (xTimePerDivision4 <= displayX1 && displayX1 < (xTimePerDivision4 + CHARACTER_WIDTH) &&
            yTimePerDivision4 <= displayY1 && displayY1 < (yTimePerDivision4 + CHARACTER_HEIGHT)) begin   
            addressA <= {timePerDivisionCharacter4, row, column};
        end else if (xTimePerDivision3 <= displayX1 && displayX1 < (xTimePerDivision3 + CHARACTER_WIDTH) &&
            yTimePerDivision3 <= displayY1 && displayY1 < (yTimePerDivision3 + CHARACTER_HEIGHT)) begin   
            addressA <= {timePerDivisionCharacter3, row, column};
        end else if (xTimePerDivision2 <= displayX1 && displayX1 < (xTimePerDivision2 + CHARACTER_WIDTH) &&
            yTimePerDivision2 <= displayY1 && displayY1 < (yTimePerDivision2 + CHARACTER_HEIGHT)) begin   
            addressA <= {timePerDivisionCharacter2, row, column};
        end else if (xTimePerDivision1 <= displayX1 && displayX1 < (xTimePerDivision1 + CHARACTER_WIDTH) &&
            yTimePerDivision1 <= displayY1 && displayY1 < (yTimePerDivision1 + CHARACTER_HEIGHT)) begin   
            addressA <= {timePerDivisionCharacter1, row, column};
        end else if (xTimePerDivision0 <= displayX1 && displayX1 < (xTimePerDivision0 + CHARACTER_WIDTH) &&
            yTimePerDivision0 <= displayY1 && displayY1 < (yTimePerDivision0 + CHARACTER_HEIGHT)) begin   
            addressA <= {timePerDivisionCharacter0, row, column};
            
        end else if (xVoltagePerDivision4 <= displayX1 && displayX1 < (xVoltagePerDivision4 + CHARACTER_WIDTH) &&
            yVoltagePerDivision4 <= displayY1 && displayY1 < (yVoltagePerDivision4 + CHARACTER_HEIGHT)) begin   
            addressA <= {voltagePerDivisionCharacter4, row, column};
        end else if (xVoltagePerDivision3 <= displayX1 && displayX1 < (xVoltagePerDivision3 + CHARACTER_WIDTH) &&
            yVoltagePerDivision3 <= displayY1 && displayY1 < (yVoltagePerDivision3 + CHARACTER_HEIGHT)) begin   
            addressA <= {voltagePerDivisionCharacter3, row, column};
        end else if (xVoltagePerDivision2 <= displayX1 && displayX1 < (xVoltagePerDivision2 + CHARACTER_WIDTH) &&
            yVoltagePerDivision2 <= displayY1 && displayY1 < (yVoltagePerDivision2 + CHARACTER_HEIGHT)) begin   
            addressA <= {voltagePerDivisionCharacter2, row, column};
        end else if (xVoltagePerDivision1 <= displayX1 && displayX1 < (xVoltagePerDivision1 + CHARACTER_WIDTH) &&
            yVoltagePerDivision1 <= displayY1 && displayY1 < (yVoltagePerDivision1 + CHARACTER_HEIGHT)) begin   
            addressA <= {voltagePerDivisionCharacter1, row, column};
        end else if (xVoltagePerDivision0 <= displayX1 && displayX1 < (xVoltagePerDivision0 + CHARACTER_WIDTH) &&
            yVoltagePerDivision0 <= displayY1 && displayY1 < (yVoltagePerDivision0 + CHARACTER_HEIGHT)) begin   
            addressA <= {voltagePerDivisionCharacter0, row, column};
        
        end else if (xMax9 <= displayX1 && displayX1 < (xMax9 + CHARACTER_WIDTH) &&
            yMax9 <= displayY1 && displayY1 < (yMax9 + CHARACTER_HEIGHT)) begin   
            addressA <= {maxCharacter9, row, column};
        end else if (xMax8 <= displayX1 && displayX1 < (xMax8 + CHARACTER_WIDTH) &&
            yMax8 <= displayY1 && displayY1 < (yMax8 + CHARACTER_HEIGHT)) begin   
            addressA <= {maxCharacter8, row, column};
        end else if (xMax7 <= displayX1 && displayX1 < (xMax7 + CHARACTER_WIDTH) &&
            yMax7 <= displayY1 && displayY1 < (yMax7 + CHARACTER_HEIGHT)) begin   
            addressA <= {maxCharacter7, row, column};
        end else if (xMax6 <= displayX1 && displayX1 < (xMax6 + CHARACTER_WIDTH) &&
            yMax6 <= displayY1 && displayY1 < (yMax6 + CHARACTER_HEIGHT)) begin   
            addressA <= {maxCharacter6, row, column};
        end else if (xMax5 <= displayX1 && displayX1 < (xMax5 + CHARACTER_WIDTH) &&
            yMax5 <= displayY1 && displayY1 < (yMax5 + CHARACTER_HEIGHT)) begin   
            addressA <= {maxCharacter5, row, column};
        end else if (xMax4 <= displayX1 && displayX1 < (xMax4 + CHARACTER_WIDTH) &&
            yMax4 <= displayY1 && displayY1 < (yMax4 + CHARACTER_HEIGHT)) begin   
            addressA <= {maxCharacter4, row, column};
        end else if (xMax3 <= displayX1 && displayX1 < (xMax3 + CHARACTER_WIDTH) &&
            yMax3 <= displayY1 && displayY1 < (yMax3 + CHARACTER_HEIGHT)) begin   
            addressA <= {maxCharacter3, row, column};
        end else if (xMax2 <= displayX1 && displayX1 < (xMax2 + CHARACTER_WIDTH) &&
            yMax2 <= displayY1 && displayY1 < (yMax2 + CHARACTER_HEIGHT)) begin   
            addressA <= {maxCharacter2, row, column};
        end else if (xMax1 <= displayX1 && displayX1 < (xMax1 + CHARACTER_WIDTH) &&
            yMax1 <= displayY1 && displayY1 < (yMax1 + CHARACTER_HEIGHT)) begin   
            addressA <= {maxCharacter1, row, column};
        end else if (xMax0 <= displayX1 && displayX1 < (xMax0 + CHARACTER_WIDTH) &&
            yMax0 <= displayY1 && displayY1 < (yMax0 + CHARACTER_HEIGHT)) begin   
            addressA <= {maxCharacter0, row, column};
            
        end else if (xCursor1_15 <= displayX1 && displayX1 < (xCursor1_15 + CHARACTER_WIDTH) &&
            yCursor1_15 <= displayY1 && displayY1 < (yCursor1_15 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character15, row, column};
        end else if (xCursor1_14 <= displayX1 && displayX1 < (xCursor1_14 + CHARACTER_WIDTH) &&
            yCursor1_14 <= displayY1 && displayY1 < (yCursor1_14 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character14, row, column};
        end else if (xCursor1_13 <= displayX1 && displayX1 < (xCursor1_13 + CHARACTER_WIDTH) &&
            yCursor1_13 <= displayY1 && displayY1 < (yCursor1_13 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character13, row, column};
        end else if (xCursor1_12 <= displayX1 && displayX1 < (xCursor1_12 + CHARACTER_WIDTH) &&
            yCursor1_12 <= displayY1 && displayY1 < (yCursor1_12 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character12, row, column};
        end else if (xCursor1_11 <= displayX1 && displayX1 < (xCursor1_11 + CHARACTER_WIDTH) &&
            yCursor1_11 <= displayY1 && displayY1 < (yCursor1_11 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character11, row, column};
        end else if (xCursor1_10 <= displayX1 && displayX1 < (xCursor1_10 + CHARACTER_WIDTH) &&
            yCursor1_10 <= displayY1 && displayY1 < (yCursor1_10 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character10, row, column};
        end else if (xCursor1_9 <= displayX1 && displayX1 < (xCursor1_9 + CHARACTER_WIDTH) &&
            yCursor1_9 <= displayY1 && displayY1 < (yCursor1_9 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character9, row, column};
        end else if (xCursor1_8 <= displayX1 && displayX1 < (xCursor1_8 + CHARACTER_WIDTH) &&
            yCursor1_8 <= displayY1 && displayY1 < (yCursor1_8 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character8, row, column};
        end else if (xCursor1_7 <= displayX1 && displayX1 < (xCursor1_7 + CHARACTER_WIDTH) &&
            yCursor1_7 <= displayY1 && displayY1 < (yCursor1_7 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character7, row, column};
        end else if (xCursor1_6 <= displayX1 && displayX1 < (xCursor1_6 + CHARACTER_WIDTH) &&
            yCursor1_6 <= displayY1 && displayY1 < (yCursor1_6 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character6, row, column};
        end else if (xCursor1_5 <= displayX1 && displayX1 < (xCursor1_5 + CHARACTER_WIDTH) &&
            yCursor1_5 <= displayY1 && displayY1 < (yCursor1_5 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character5, row, column};
        end else if (xCursor1_4 <= displayX1 && displayX1 < (xCursor1_4 + CHARACTER_WIDTH) &&
            yCursor1_4 <= displayY1 && displayY1 < (yCursor1_4 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character4, row, column};
        end else if (xCursor1_3 <= displayX1 && displayX1 < (xCursor1_3 + CHARACTER_WIDTH) &&
            yCursor1_3 <= displayY1 && displayY1 < (yCursor1_3 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character3, row, column};
        end else if (xCursor1_2 <= displayX1 && displayX1 < (xCursor1_2 + CHARACTER_WIDTH) &&
            yCursor1_2 <= displayY1 && displayY1 < (yCursor1_2 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character2, row, column};
        end else if (xCursor1_1 <= displayX1 && displayX1 < (xCursor1_1 + CHARACTER_WIDTH) &&
            yCursor1_1 <= displayY1 && displayY1 < (yCursor1_1 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character1, row, column};
        end else if (xCursor1_0 <= displayX1 && displayX1 < (xCursor1_0 + CHARACTER_WIDTH) &&
            yCursor1_0 <= displayY1 && displayY1 < (yCursor1_0 + CHARACTER_HEIGHT)) begin   
            addressA <= {cursor1Character0, row, column};
        end
        displayX2 <= displayX1;
        displayY2 <= displayY1;
        hsync2 <= hsync1;
        vsync2 <= vsync1;
        blank2 <= blank1;
        previousPixel2 <= previousPixel1;
        
        
        //edge 2
        //addressA will be available to BRAM on edge 2
        displayX3 <= displayX2;
        displayY3 <= displayY2;
        hsync3 <= hsync2;
        vsync3 <= vsync2;
        blank3 <= blank2;
        previousPixel3 <= previousPixel2;
        
        
        //edge 3
        //BRAM takes 1 extra clock cycle before producing output
        displayX4 <= displayX3;
        displayY4 <= displayY3;
        hsync4 <= hsync3;
        vsync4 <= vsync3;
        blank4 <= blank3;
        previousPixel4 <= previousPixel3;
        
        
        //edge 4
        //dataOutA is available on edge 4
        if (xMiddleVoltage4 <= displayX4 && displayX4 < (xMiddleVoltage4 + CHARACTER_WIDTH) &&
                yMiddleVoltage4 <= displayY4 && displayY4 < (yMiddleVoltage4 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMiddleVoltage3 <= displayX4 && displayX4 < (xMiddleVoltage3 + CHARACTER_WIDTH) &&
                yMiddleVoltage3 <= displayY4 && displayY4 < (yMiddleVoltage3 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMiddleVoltage2 <= displayX4 && displayX4 < (xMiddleVoltage2 + CHARACTER_WIDTH) &&
                yMiddleVoltage2 <= displayY4 && displayY4 < (yMiddleVoltage2 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMiddleVoltage1 <= displayX4 && displayX4 < (xMiddleVoltage1 + CHARACTER_WIDTH) &&
                yMiddleVoltage1 <= displayY4 && displayY4 < (yMiddleVoltage1 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMiddleVoltage0 <= displayX4 && displayX4 < (xMiddleVoltage0 + CHARACTER_WIDTH) &&
                yMiddleVoltage0 <= displayY4 && displayY4 < (yMiddleVoltage0 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
            
        end else if (xTimePerDivision4 <= displayX4 && displayX4 < (xTimePerDivision4 + CHARACTER_WIDTH) &&
                yTimePerDivision4 <= displayY4 && displayY4 < (yTimePerDivision4 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xTimePerDivision3 <= displayX4 && displayX4 < (xTimePerDivision3 + CHARACTER_WIDTH) &&
                yTimePerDivision3 <= displayY4 && displayY4 < (yTimePerDivision3 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xTimePerDivision2 <= displayX4 && displayX4 < (xTimePerDivision2 + CHARACTER_WIDTH) &&
                yTimePerDivision2 <= displayY4 && displayY4 < (yTimePerDivision2 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xTimePerDivision1 <= displayX4 && displayX4 < (xTimePerDivision1 + CHARACTER_WIDTH) &&
                yTimePerDivision1 <= displayY4 && displayY4 < (yTimePerDivision1 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xTimePerDivision0 <= displayX4 && displayX4 < (xTimePerDivision0 + CHARACTER_WIDTH) &&
                yTimePerDivision0 <= displayY4 && displayY4 < (yTimePerDivision0 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
            
        end else if (xVoltagePerDivision4 <= displayX4 && displayX4 < (xVoltagePerDivision4 + CHARACTER_WIDTH) &&
                yVoltagePerDivision4 <= displayY4 && displayY4 < (yVoltagePerDivision4 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xVoltagePerDivision3 <= displayX4 && displayX4 < (xVoltagePerDivision3 + CHARACTER_WIDTH) &&
                yVoltagePerDivision3 <= displayY4 && displayY4 < (yVoltagePerDivision3 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xVoltagePerDivision2 <= displayX4 && displayX4 < (xVoltagePerDivision2 + CHARACTER_WIDTH) &&
                yVoltagePerDivision2 <= displayY4 && displayY4 < (yVoltagePerDivision2 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xVoltagePerDivision1 <= displayX4 && displayX4 < (xVoltagePerDivision1 + CHARACTER_WIDTH) &&
                yVoltagePerDivision1 <= displayY4 && displayY4 < (yVoltagePerDivision1 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xVoltagePerDivision0 <= displayX4 && displayX4 < (xVoltagePerDivision0 + CHARACTER_WIDTH) &&
                yVoltagePerDivision0 <= displayY4 && displayY4 < (yVoltagePerDivision0 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        
        end else if (xMax9 <= displayX4 && displayX4 < (xMax9 + CHARACTER_WIDTH) &&
                yMax9 <= displayY4 && displayY4 < (yMax9 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMax8 <= displayX4 && displayX4 < (xMax8 + CHARACTER_WIDTH) &&
                yMax8 <= displayY4 && displayY4 < (yMax8 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;    
        end else if (xMax7 <= displayX4 && displayX4 < (xMax7 + CHARACTER_WIDTH) &&
                yMax7 <= displayY4 && displayY4 < (yMax7 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMax6 <= displayX4 && displayX4 < (xMax6 + CHARACTER_WIDTH) &&
                yMax6 <= displayY4 && displayY4 < (yMax6 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMax5 <= displayX4 && displayX4 < (xMax5 + CHARACTER_WIDTH) &&
                yMax5 <= displayY4 && displayY4 < (yMax5 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMax4 <= displayX4 && displayX4 < (xMax4 + CHARACTER_WIDTH) &&
                yMax4 <= displayY4 && displayY4 < (yMax4 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMax3 <= displayX4 && displayX4 < (xMax3 + CHARACTER_WIDTH) &&
                yMax3 <= displayY4 && displayY4 < (yMax3 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMax2 <= displayX4 && displayX4 < (xMax2 + CHARACTER_WIDTH) &&
                yMax2 <= displayY4 && displayY4 < (yMax2 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMax1 <= displayX4 && displayX4 < (xMax1 + CHARACTER_WIDTH) &&
                yMax1 <= displayY4 && displayY4 < (yMax1 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        end else if (xMax0 <= displayX4 && displayX4 < (xMax0 + CHARACTER_WIDTH) &&
                yMax0 <= displayY4 && displayY4 < (yMax0 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CHARACTER_COLOR;
        
        end else if (xCursor1_15 <= displayX4 && displayX4 < (xCursor1_15 + CHARACTER_WIDTH) &&
                yCursor1_15 <= displayY4 && displayY4 < (yCursor1_15 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_14 <= displayX4 && displayX4 < (xCursor1_14 + CHARACTER_WIDTH) &&
                yCursor1_14 <= displayY4 && displayY4 < (yCursor1_14 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_13 <= displayX4 && displayX4 < (xCursor1_13 + CHARACTER_WIDTH) &&
                yCursor1_13 <= displayY4 && displayY4 < (yCursor1_13 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_12 <= displayX4 && displayX4 < (xCursor1_12 + CHARACTER_WIDTH) &&
                yCursor1_12 <= displayY4 && displayY4 < (yCursor1_12 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_11 <= displayX4 && displayX4 < (xCursor1_11 + CHARACTER_WIDTH) &&
                yCursor1_11 <= displayY4 && displayY4 < (yCursor1_11 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_10 <= displayX4 && displayX4 < (xCursor1_10 + CHARACTER_WIDTH) &&
                yCursor1_10 <= displayY4 && displayY4 < (yCursor1_10 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_9 <= displayX4 && displayX4 < (xCursor1_9 + CHARACTER_WIDTH) &&
                yCursor1_9 <= displayY4 && displayY4 < (yCursor1_9 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_8 <= displayX4 && displayX4 < (xCursor1_8 + CHARACTER_WIDTH) &&
                yCursor1_8 <= displayY4 && displayY4 < (yCursor1_8 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_7 <= displayX4 && displayX4 < (xCursor1_7 + CHARACTER_WIDTH) &&
                yCursor1_7 <= displayY4 && displayY4 < (yCursor1_7 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_6 <= displayX4 && displayX4 < (xCursor1_6 + CHARACTER_WIDTH) &&
                yCursor1_6 <= displayY4 && displayY4 < (yCursor1_6 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_5 <= displayX4 && displayX4 < (xCursor1_5 + CHARACTER_WIDTH) &&
                yCursor1_5 <= displayY4 && displayY4 < (yCursor1_5 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_4 <= displayX4 && displayX4 < (xCursor1_4 + CHARACTER_WIDTH) &&
                yCursor1_4 <= displayY4 && displayY4 < (yCursor1_4 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_3 <= displayX4 && displayX4 < (xCursor1_3 + CHARACTER_WIDTH) &&
                yCursor1_3 <= displayY4 && displayY4 < (yCursor1_3 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_2 <= displayX4 && displayX4 < (xCursor1_2 + CHARACTER_WIDTH) &&
                yCursor1_2 <= displayY4 && displayY4 < (yCursor1_2 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_1 <= displayX4 && displayX4 < (xCursor1_1 + CHARACTER_WIDTH) &&
                yCursor1_1 <= displayY4 && displayY4 < (yCursor1_1 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else if (xCursor1_0 <= displayX4 && displayX4 < (xCursor1_0 + CHARACTER_WIDTH) &&
                yCursor1_0 <= displayY4 && displayY4 < (yCursor1_0 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= CURSOR_1_COLOR;
        end else begin
            pixel <= previousPixel4;
        end
        displayXOut <= displayX4;
        displayYOut <= displayY4;
        hsyncOut <= hsync4;
        vsyncOut <= vsync4;
        blankOut <= blank4;
    end
    
    wire enableA;
    assign enableA = 1;
    CharactersROM characterBRAM (
      .clka(clock),    // input wire clka
      .ena(enableA),      // input wire ena
      .addra(addressA),  // input wire [16 : 0] addra
      .douta(dataOutA),  // output wire [0 : 0] douta
      .clkb(),    // input wire clkb
      .enb(0),      // input wire enb
      .addrb(0),  // input wire [16 : 0] addrb
      .doutb()  // output wire [0 : 0] doutb
    );
    
endmodule