`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2016 01:42:05 PM
// Design Name: 
// Module Name: Text30Characters
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


module Text30Characters
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
                LIGHT_PURPLE = 12'hF6F,  //light purple
                COLOR_BITS = 12)
    (input clock,
    input [DISPLAY_X_BITS-1:0] xCharacter29,
    input [DISPLAY_Y_BITS-1:0] yCharacter29,
    input [SELECT_CHARACTER_BITS-1:0] character29,
    input [COLOR_BITS-1:0] character29Color,
    input [DISPLAY_X_BITS-1:0] xCharacter28,
    input [DISPLAY_Y_BITS-1:0] yCharacter28,
    input [SELECT_CHARACTER_BITS-1:0] character28,
    input [COLOR_BITS-1:0] character28Color,
    input [DISPLAY_X_BITS-1:0] xCharacter27,
    input [DISPLAY_Y_BITS-1:0] yCharacter27,
    input [SELECT_CHARACTER_BITS-1:0] character27,
    input [COLOR_BITS-1:0] character27Color,
    input [DISPLAY_X_BITS-1:0] xCharacter26,
    input [DISPLAY_Y_BITS-1:0] yCharacter26,
    input [SELECT_CHARACTER_BITS-1:0] character26,
    input [COLOR_BITS-1:0] character26Color,
    input [DISPLAY_X_BITS-1:0] xCharacter25,
    input [DISPLAY_Y_BITS-1:0] yCharacter25,  
    input [SELECT_CHARACTER_BITS-1:0] character25,
    input [COLOR_BITS-1:0] character25Color,
    
    input [DISPLAY_X_BITS-1:0] xCharacter24,
    input [DISPLAY_Y_BITS-1:0] yCharacter24,
    input [SELECT_CHARACTER_BITS-1:0] character24,
    input [COLOR_BITS-1:0] character24Color,
    input [DISPLAY_X_BITS-1:0] yCharacter23,
    input [DISPLAY_Y_BITS-1:0] xCharacter23,
    input [SELECT_CHARACTER_BITS-1:0] character23,
    input [COLOR_BITS-1:0] character23Color,
    input [DISPLAY_X_BITS-1:0] xCharacter22,
    input [DISPLAY_Y_BITS-1:0] yCharacter22,
    input [SELECT_CHARACTER_BITS-1:0] character22,
    input [COLOR_BITS-1:0] character22Color,
    input [DISPLAY_X_BITS-1:0] xCharacter21,
    input [DISPLAY_Y_BITS-1:0] yCharacter21,
    input [SELECT_CHARACTER_BITS-1:0] character21,
    input [COLOR_BITS-1:0] character21Color,
    input [DISPLAY_X_BITS-1:0] xCharacter20,
    input [DISPLAY_Y_BITS-1:0] yCharacter20,
    input [SELECT_CHARACTER_BITS-1:0] character20,
    input [COLOR_BITS-1:0] character20Color,
    
    input [DISPLAY_X_BITS-1:0] xCharacter19,
    input [DISPLAY_Y_BITS-1:0] yCharacter19,
    input [SELECT_CHARACTER_BITS-1:0] character19,
    input [COLOR_BITS-1:0] character19Color,
    input [DISPLAY_X_BITS-1:0] xCharacter18,
    input [DISPLAY_Y_BITS-1:0] yCharacter18,
    input [SELECT_CHARACTER_BITS-1:0] character18,
    input [COLOR_BITS-1:0] character18Color,
    input [DISPLAY_X_BITS-1:0] xCharacter17,
    input [DISPLAY_Y_BITS-1:0] yCharacter17,
    input [SELECT_CHARACTER_BITS-1:0] character17,
    input [COLOR_BITS-1:0] character17Color,
    input [DISPLAY_X_BITS-1:0] xCharacter16,
    input [DISPLAY_Y_BITS-1:0] yCharacter16,
    input [SELECT_CHARACTER_BITS-1:0] character16,
    input [COLOR_BITS-1:0] character16Color,
    input [DISPLAY_X_BITS-1:0] xCharacter15,
    input [DISPLAY_Y_BITS-1:0] yCharacter15,
    input [SELECT_CHARACTER_BITS-1:0] character15,
    input [COLOR_BITS-1:0] character15Color,
    
    input [DISPLAY_X_BITS-1:0] xCharacter14,
    input [DISPLAY_Y_BITS-1:0] yCharacter14,
    input [SELECT_CHARACTER_BITS-1:0] character14,
    input [COLOR_BITS-1:0] character14Color,
    input [DISPLAY_X_BITS-1:0] xCharacter13,
    input [DISPLAY_Y_BITS-1:0] yCharacter13,
    input [SELECT_CHARACTER_BITS-1:0] character13,
    input [COLOR_BITS-1:0] character13Color,
    input [DISPLAY_X_BITS-1:0] xCharacter12,
    input [DISPLAY_Y_BITS-1:0] yCharacter12,
    input [SELECT_CHARACTER_BITS-1:0] character12,
    input [COLOR_BITS-1:0] character12Color,
    input [DISPLAY_X_BITS-1:0] xCharacter11,
    input [DISPLAY_Y_BITS-1:0] yCharacter11,
    input [SELECT_CHARACTER_BITS-1:0] character11,
    input [COLOR_BITS-1:0] character11Color,
    input [DISPLAY_X_BITS-1:0] xCharacter10,
    input [DISPLAY_Y_BITS-1:0] yCharacter10,
    input [SELECT_CHARACTER_BITS-1:0] character10,
    input [COLOR_BITS-1:0] character10Color,
    
    input [DISPLAY_X_BITS-1:0] xCharacter9,
    input [DISPLAY_Y_BITS-1:0] yCharacter9,
    input [SELECT_CHARACTER_BITS-1:0] character9,
    input [COLOR_BITS-1:0] character9Color,
    input [DISPLAY_X_BITS-1:0] xCharacter8,
    input [DISPLAY_Y_BITS-1:0] yCharacter8,
    input [SELECT_CHARACTER_BITS-1:0] character8,
    input [COLOR_BITS-1:0] character8Color,
    input [DISPLAY_X_BITS-1:0] xCharacter7,
    input [DISPLAY_Y_BITS-1:0] yCharacter7,
    input [SELECT_CHARACTER_BITS-1:0] character7,
    input [COLOR_BITS-1:0] character7Color,
    input [DISPLAY_X_BITS-1:0] xCharacter6,
    input [DISPLAY_Y_BITS-1:0] yCharacter6,
    input [SELECT_CHARACTER_BITS-1:0] character6,
    input [COLOR_BITS-1:0] character6Color,
    input [DISPLAY_X_BITS-1:0] xCharacter5,
    input [DISPLAY_Y_BITS-1:0] yCharacter5,
    input [SELECT_CHARACTER_BITS-1:0] character5,
    input [COLOR_BITS-1:0] character5Color,
    
    input [DISPLAY_X_BITS-1:0] xCharacter4,
    input [DISPLAY_Y_BITS-1:0] yCharacter4,
    input [SELECT_CHARACTER_BITS-1:0] character4,
    input [COLOR_BITS-1:0] character4Color,
    input [DISPLAY_X_BITS-1:0] xCharacter3,
    input [DISPLAY_Y_BITS-1:0] yCharacter3,
    input [SELECT_CHARACTER_BITS-1:0] character3,
    input [COLOR_BITS-1:0] character3Color,
    input [DISPLAY_X_BITS-1:0] xCharacter2,
    input [DISPLAY_Y_BITS-1:0] yCharacter2,
    input [SELECT_CHARACTER_BITS-1:0] character2,
    input [COLOR_BITS-1:0] character2Color,
    input [DISPLAY_X_BITS-1:0] xCharacter1,
    input [DISPLAY_Y_BITS-1:0] yCharacter1,
    input [SELECT_CHARACTER_BITS-1:0] character1,
    input [COLOR_BITS-1:0] character1Color,
    input [DISPLAY_X_BITS-1:0] xCharacter0,
    input [DISPLAY_Y_BITS-1:0] yCharacter0,
    input [SELECT_CHARACTER_BITS-1:0] character0,
    input [COLOR_BITS-1:0] character0Color,
        
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
        if (xCharacter29 <= displayX && displayX < (xCharacter29 + CHARACTER_WIDTH) &&
            yCharacter29 <= displayY && displayY < (yCharacter29 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yCharacter29;
            column <= displayX - xCharacter29;
        end else if (xCharacter28 <= displayX && displayX < (xCharacter28 + CHARACTER_WIDTH) &&
            yCharacter28 <= displayY && displayY < (yCharacter28 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yCharacter28;
            column <= displayX - xCharacter28;
        end else if (xCharacter27 <= displayX && displayX < (xCharacter27 + CHARACTER_WIDTH) &&
            yCharacter27 <= displayY && displayY < (yCharacter27 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yCharacter27;
            column <= displayX - xCharacter27;
        end else if (xCharacter26 <= displayX && displayX < (xCharacter26 + CHARACTER_WIDTH) &&
            yCharacter26 <= displayY && displayY < (yCharacter26 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yCharacter26;
            column <= displayX - xCharacter26;
        end else if (xCharacter25 <= displayX && displayX < (xCharacter25 + CHARACTER_WIDTH) &&
            yCharacter25 <= displayY && displayY < (yCharacter25 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yCharacter25;
            column <= displayX - xCharacter25;
            
        end else if (xCharacter24 <= displayX && displayX < (xCharacter24 + CHARACTER_WIDTH) &&
            yCharacter24 <= displayY && displayY < (yCharacter24 + CHARACTER_HEIGHT)) begin   
            row <= displayY - yCharacter24;
            column <= displayX - xCharacter24;
        end  else if (xCharacter23 <= displayX && displayX < (xCharacter23 + CHARACTER_WIDTH) &&
           yCharacter23 <= displayY && displayY < (yCharacter23 + CHARACTER_HEIGHT)) begin   
           row <= displayY - yCharacter23;
           column <= displayX - xCharacter23;
        end else if (xCharacter22 <= displayX && displayX < (xCharacter22 + CHARACTER_WIDTH) &&
          yCharacter22 <= displayY && displayY < (yCharacter22 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter22;
          column <= displayX - xCharacter22;
        end else if (xCharacter21 <= displayX && displayX < (xCharacter21 + CHARACTER_WIDTH) &&
           yCharacter21 <= displayY && displayY < (yCharacter21 + CHARACTER_HEIGHT)) begin   
           row <= displayY - yCharacter21;
           column <= displayX - xCharacter21;
        end else if (xCharacter20 <= displayX && displayX < (xCharacter20 + CHARACTER_WIDTH) &&
          yCharacter20 <= displayY && displayY < (yCharacter20 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter20;
          column <= displayX - xCharacter20;
          
        end else if (xCharacter19 <= displayX && displayX < (xCharacter19 + CHARACTER_WIDTH) &&
          yCharacter19 <= displayY && displayY < (yCharacter19 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter19;
          column <= displayX - xCharacter19;
        end else if (xCharacter18 <= displayX && displayX < (xCharacter18 + CHARACTER_WIDTH) &&
          yCharacter18 <= displayY && displayY < (yCharacter18 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter18;
          column <= displayX - xCharacter18;
        end else if (xCharacter17 <= displayX && displayX < (xCharacter17 + CHARACTER_WIDTH) &&
          yCharacter17 <= displayY && displayY < (yCharacter17 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter17;
          column <= displayX - xCharacter17;
        end else if (xCharacter16 <= displayX && displayX < (xCharacter16 + CHARACTER_WIDTH) &&
          yCharacter16 <= displayY && displayY < (yCharacter16 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter16;
          column <= displayX - xCharacter16;
        end else if (xCharacter15 <= displayX && displayX < (xCharacter15 + CHARACTER_WIDTH) &&
          yCharacter15 <= displayY && displayY < (yCharacter15 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter15;
          column <= displayX - xCharacter15;
          
        end else if (xCharacter14 <= displayX && displayX < (xCharacter14 + CHARACTER_WIDTH) &&
          yCharacter14 <= displayY && displayY < (yCharacter14 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter14;
          column <= displayX - xCharacter14;
        end else if (xCharacter13 <= displayX && displayX < (xCharacter13 + CHARACTER_WIDTH) &&
          yCharacter13 <= displayY && displayY < (yCharacter13 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter13;
          column <= displayX - xCharacter13;
        end else if (xCharacter12 <= displayX && displayX < (xCharacter12 + CHARACTER_WIDTH) &&
          yCharacter12 <= displayY && displayY < (yCharacter12 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter12;
          column <= displayX - xCharacter12;
        end else if (xCharacter11 <= displayX && displayX < (xCharacter11 + CHARACTER_WIDTH) &&
          yCharacter11 <= displayY && displayY < (yCharacter11 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter11;
          column <= displayX - xCharacter11;
        end else if (xCharacter10 <= displayX && displayX < (xCharacter10 + CHARACTER_WIDTH) &&
          yCharacter10 <= displayY && displayY < (yCharacter10 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter10;
          column <= displayX - xCharacter10;
          
        end else if (xCharacter9 <= displayX && displayX < (xCharacter9 + CHARACTER_WIDTH) &&
          yCharacter9 <= displayY && displayY < (yCharacter9 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter9;
          column <= displayX - xCharacter9;
        end else if (xCharacter8 <= displayX && displayX < (xCharacter8 + CHARACTER_WIDTH) &&
          yCharacter8 <= displayY && displayY < (yCharacter8 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter8;
          column <= displayX - xCharacter8;
        end else if (xCharacter7 <= displayX && displayX < (xCharacter7 + CHARACTER_WIDTH) &&
          yCharacter7 <= displayY && displayY < (yCharacter7 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter7;
          column <= displayX - xCharacter7;
        end else if (xCharacter6 <= displayX && displayX < (xCharacter6 + CHARACTER_WIDTH) &&
          yCharacter6 <= displayY && displayY < (yCharacter6 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter6;
          column <= displayX - xCharacter6;
        end else if (xCharacter5 <= displayX && displayX < (xCharacter5 + CHARACTER_WIDTH) &&
          yCharacter5 <= displayY && displayY < (yCharacter5 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter5;
          column <= displayX - xCharacter5;
          
        end else if (xCharacter4 <= displayX && displayX < (xCharacter4 + CHARACTER_WIDTH) &&
          yCharacter4 <= displayY && displayY < (yCharacter4 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter4;
          column <= displayX - xCharacter4;
        end else if (xCharacter3 <= displayX && displayX < (xCharacter3 + CHARACTER_WIDTH) &&
          yCharacter3 <= displayY && displayY < (yCharacter3 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter3;
          column <= displayX - xCharacter3;
        end else if (xCharacter2 <= displayX && displayX < (xCharacter2 + CHARACTER_WIDTH) &&
          yCharacter2 <= displayY && displayY < (yCharacter2 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter2;
          column <= displayX - xCharacter2;
        end else if (xCharacter1 <= displayX && displayX < (xCharacter1 + CHARACTER_WIDTH) &&
          yCharacter1 <= displayY && displayY < (yCharacter1 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter1;
          column <= displayX - xCharacter1;
        end else if (xCharacter0 <= displayX && displayX < (xCharacter0 + CHARACTER_WIDTH) &&
          yCharacter0 <= displayY && displayY < (yCharacter0 + CHARACTER_HEIGHT)) begin   
          row <= displayY - yCharacter0;
          column <= displayX - xCharacter0;
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
        if (xCharacter29 <= displayX1 && displayX1 < (xCharacter29 + CHARACTER_WIDTH) &&
            yCharacter29 <= displayY1 && displayY1 < (yCharacter29 + CHARACTER_HEIGHT)) begin   
            addressA <= {character29, row, column};
        end else if (xCharacter28 <= displayX1 && displayX1 < (xCharacter28 + CHARACTER_WIDTH) &&
            yCharacter28 <= displayY1 && displayY1 < (yCharacter28 + CHARACTER_HEIGHT)) begin   
            addressA <= {character28, row, column};
        end else if (xCharacter27 <= displayX1 && displayX1 < (xCharacter27 + CHARACTER_WIDTH) &&
            yCharacter27 <= displayY1 && displayY1 < (yCharacter27 + CHARACTER_HEIGHT)) begin   
            addressA <= {character27, row, column};
        end else if (xCharacter26 <= displayX1 && displayX1 < (xCharacter26 + CHARACTER_WIDTH) &&
            yCharacter26 <= displayY1 && displayY1 < (yCharacter26 + CHARACTER_HEIGHT)) begin   
            addressA <= {character26, row, column};
        end else if (xCharacter25 <= displayX1 && displayX1 < (xCharacter25 + CHARACTER_WIDTH) &&
            yCharacter25 <= displayY1 && displayY1 < (yCharacter25 + CHARACTER_HEIGHT)) begin   
            addressA <= {character25, row, column};
            
        end else if (xCharacter24 <= displayX1 && displayX1 < (xCharacter24 + CHARACTER_WIDTH) &&
            yCharacter24 <= displayY1 && displayY1 < (yCharacter24 + CHARACTER_HEIGHT)) begin   
            addressA <= {character24, row, column};
        end else if (yCharacter23 <= displayX1 && displayX1 < (yCharacter23 + CHARACTER_WIDTH) &&
            xCharacter23 <= displayY1 && displayY1 < (xCharacter23 + CHARACTER_HEIGHT)) begin   
            addressA <= {character23, row, column};
        end else if (xCharacter22 <= displayX1 && displayX1 < (xCharacter22 + CHARACTER_WIDTH) &&
            yCharacter22 <= displayY1 && displayY1 < (yCharacter22 + CHARACTER_HEIGHT)) begin   
            addressA <= {character22, row, column};
        end else if (xCharacter21 <= displayX1 && displayX1 < (xCharacter21 + CHARACTER_WIDTH) &&
            yCharacter21 <= displayY1 && displayY1 < (yCharacter21 + CHARACTER_HEIGHT)) begin   
            addressA <= {character21, row, column};
        end else if (xCharacter20 <= displayX1 && displayX1 < (xCharacter20 + CHARACTER_WIDTH) &&
            yCharacter20 <= displayY1 && displayY1 < (yCharacter20 + CHARACTER_HEIGHT)) begin   
            addressA <= {character20, row, column};
            
        end else if (xCharacter19 <= displayX1 && displayX1 < (xCharacter19 + CHARACTER_WIDTH) &&
            yCharacter19 <= displayY1 && displayY1 < (yCharacter19 + CHARACTER_HEIGHT)) begin   
            addressA <= {character19, row, column};
        end else if (xCharacter18 <= displayX1 && displayX1 < (xCharacter18 + CHARACTER_WIDTH) &&
            yCharacter18 <= displayY1 && displayY1 < (yCharacter18 + CHARACTER_HEIGHT)) begin   
            addressA <= {character18, row, column};
        end else if (xCharacter17 <= displayX1 && displayX1 < (xCharacter17 + CHARACTER_WIDTH) &&
            yCharacter17 <= displayY1 && displayY1 < (yCharacter17 + CHARACTER_HEIGHT)) begin   
            addressA <= {character17, row, column};
        end else if (xCharacter16 <= displayX1 && displayX1 < (xCharacter16 + CHARACTER_WIDTH) &&
            yCharacter16 <= displayY1 && displayY1 < (yCharacter16 + CHARACTER_HEIGHT)) begin   
            addressA <= {character16, row, column};
        end else if (xCharacter15 <= displayX1 && displayX1 < (xCharacter15 + CHARACTER_WIDTH) &&
            yCharacter15 <= displayY1 && displayY1 < (yCharacter15 + CHARACTER_HEIGHT)) begin   
            addressA <= {character15, row, column};
        
        end else if (xCharacter14 <= displayX1 && displayX1 < (xCharacter14 + CHARACTER_WIDTH) &&
            yCharacter14 <= displayY1 && displayY1 < (yCharacter14 + CHARACTER_HEIGHT)) begin   
            addressA <= {character14, row, column};
        end else if (xCharacter13 <= displayX1 && displayX1 < (xCharacter13 + CHARACTER_WIDTH) &&
            yCharacter13 <= displayY1 && displayY1 < (yCharacter13 + CHARACTER_HEIGHT)) begin   
            addressA <= {character13, row, column};
        end else if (xCharacter12 <= displayX1 && displayX1 < (xCharacter12 + CHARACTER_WIDTH) &&
            yCharacter12 <= displayY1 && displayY1 < (yCharacter12 + CHARACTER_HEIGHT)) begin   
            addressA <= {character12, row, column};
        end else if (xCharacter11 <= displayX1 && displayX1 < (xCharacter11 + CHARACTER_WIDTH) &&
            yCharacter11 <= displayY1 && displayY1 < (yCharacter11 + CHARACTER_HEIGHT)) begin   
            addressA <= {character11, row, column};
        end else if (xCharacter10 <= displayX1 && displayX1 < (xCharacter10 + CHARACTER_WIDTH) &&
            yCharacter10 <= displayY1 && displayY1 < (yCharacter10 + CHARACTER_HEIGHT)) begin   
            addressA <= {character10, row, column};
            
        end else if (xCharacter9 <= displayX1 && displayX1 < (xCharacter9 + CHARACTER_WIDTH) &&
            yCharacter9 <= displayY1 && displayY1 < (yCharacter9 + CHARACTER_HEIGHT)) begin   
            addressA <= {character9, row, column};
        end else if (xCharacter8 <= displayX1 && displayX1 < (xCharacter8 + CHARACTER_WIDTH) &&
            yCharacter8 <= displayY1 && displayY1 < (yCharacter8 + CHARACTER_HEIGHT)) begin   
            addressA <= {character8, row, column};
        end else if (xCharacter7 <= displayX1 && displayX1 < (xCharacter7 + CHARACTER_WIDTH) &&
            yCharacter7 <= displayY1 && displayY1 < (yCharacter7 + CHARACTER_HEIGHT)) begin   
            addressA <= {character7, row, column};
        end else if (xCharacter6 <= displayX1 && displayX1 < (xCharacter6 + CHARACTER_WIDTH) &&
            yCharacter6 <= displayY1 && displayY1 < (yCharacter6 + CHARACTER_HEIGHT)) begin   
            addressA <= {character6, row, column};
        end else if (xCharacter5 <= displayX1 && displayX1 < (xCharacter5 + CHARACTER_WIDTH) &&
            yCharacter5 <= displayY1 && displayY1 < (yCharacter5 + CHARACTER_HEIGHT)) begin   
            addressA <= {character5, row, column};
            
        end else if (xCharacter4 <= displayX1 && displayX1 < (xCharacter4 + CHARACTER_WIDTH) &&
            yCharacter4 <= displayY1 && displayY1 < (yCharacter4 + CHARACTER_HEIGHT)) begin   
            addressA <= {character4, row, column};
        end else if (xCharacter3 <= displayX1 && displayX1 < (xCharacter3 + CHARACTER_WIDTH) &&
            yCharacter3 <= displayY1 && displayY1 < (yCharacter3 + CHARACTER_HEIGHT)) begin   
            addressA <= {character3, row, column};
        end else if (xCharacter2 <= displayX1 && displayX1 < (xCharacter2 + CHARACTER_WIDTH) &&
            yCharacter2 <= displayY1 && displayY1 < (yCharacter2 + CHARACTER_HEIGHT)) begin   
            addressA <= {character2, row, column};
        end else if (xCharacter1 <= displayX1 && displayX1 < (xCharacter1 + CHARACTER_WIDTH) &&
            yCharacter1 <= displayY1 && displayY1 < (yCharacter1 + CHARACTER_HEIGHT)) begin   
            addressA <= {character1, row, column};
        end else if (xCharacter0 <= displayX1 && displayX1 < (xCharacter0 + CHARACTER_WIDTH) &&
            yCharacter0 <= displayY1 && displayY1 < (yCharacter0 + CHARACTER_HEIGHT)) begin   
            addressA <= {character0, row, column};
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
        if (xCharacter29 <= displayX4 && displayX4 < (xCharacter29 + CHARACTER_WIDTH) &&
                yCharacter29 <= displayY4 && displayY4 < (yCharacter29 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character29Color;
        end else if (xCharacter28 <= displayX4 && displayX4 < (xCharacter28 + CHARACTER_WIDTH) &&
                yCharacter28 <= displayY4 && displayY4 < (yCharacter28 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character28Color;
        end else if (xCharacter27 <= displayX4 && displayX4 < (xCharacter27 + CHARACTER_WIDTH) &&
                yCharacter27 <= displayY4 && displayY4 < (yCharacter27 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character27Color;
        end else if (xCharacter26 <= displayX4 && displayX4 < (xCharacter26 + CHARACTER_WIDTH) &&
                yCharacter26 <= displayY4 && displayY4 < (yCharacter26 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character26Color;
        end else if (xCharacter25 <= displayX4 && displayX4 < (xCharacter25 + CHARACTER_WIDTH) &&
                yCharacter25 <= displayY4 && displayY4 < (yCharacter25 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character25Color;
            
        end else if (xCharacter24 <= displayX4 && displayX4 < (xCharacter24 + CHARACTER_WIDTH) &&
                yCharacter24 <= displayY4 && displayY4 < (yCharacter24 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character24Color;
        end else if (yCharacter23 <= displayX4 && displayX4 < (yCharacter23 + CHARACTER_WIDTH) &&
                xCharacter23 <= displayY4 && displayY4 < (xCharacter23 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character23Color;
        end else if (xCharacter22 <= displayX4 && displayX4 < (xCharacter22 + CHARACTER_WIDTH) &&
                yCharacter22 <= displayY4 && displayY4 < (yCharacter22 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character22Color;
        end else if (xCharacter21 <= displayX4 && displayX4 < (xCharacter21 + CHARACTER_WIDTH) &&
                yCharacter21 <= displayY4 && displayY4 < (yCharacter21 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character21Color;
        end else if (xCharacter20 <= displayX4 && displayX4 < (xCharacter20 + CHARACTER_WIDTH) &&
                yCharacter20 <= displayY4 && displayY4 < (yCharacter20 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character20Color;
            
        end else if (xCharacter19 <= displayX4 && displayX4 < (xCharacter19 + CHARACTER_WIDTH) &&
                yCharacter19 <= displayY4 && displayY4 < (yCharacter19 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character19Color;
        end else if (xCharacter18 <= displayX4 && displayX4 < (xCharacter18 + CHARACTER_WIDTH) &&
                yCharacter18 <= displayY4 && displayY4 < (yCharacter18 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character18Color;
        end else if (xCharacter17 <= displayX4 && displayX4 < (xCharacter17 + CHARACTER_WIDTH) &&
                yCharacter17 <= displayY4 && displayY4 < (yCharacter17 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character17Color;
        end else if (xCharacter16 <= displayX4 && displayX4 < (xCharacter16 + CHARACTER_WIDTH) &&
                yCharacter16 <= displayY4 && displayY4 < (yCharacter16 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character16Color;
        end else if (xCharacter15 <= displayX4 && displayX4 < (xCharacter15 + CHARACTER_WIDTH) &&
                yCharacter15 <= displayY4 && displayY4 < (yCharacter15 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character15Color;
        
        end else if (xCharacter14 <= displayX4 && displayX4 < (xCharacter14 + CHARACTER_WIDTH) &&
                yCharacter14 <= displayY4 && displayY4 < (yCharacter14 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character14Color;
        end else if (xCharacter13 <= displayX4 && displayX4 < (xCharacter13 + CHARACTER_WIDTH) &&
                yCharacter13 <= displayY4 && displayY4 < (yCharacter13 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character13Color;    
        end else if (xCharacter12 <= displayX4 && displayX4 < (xCharacter12 + CHARACTER_WIDTH) &&
                yCharacter12 <= displayY4 && displayY4 < (yCharacter12 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character12Color;
        end else if (xCharacter11 <= displayX4 && displayX4 < (xCharacter11 + CHARACTER_WIDTH) &&
                yCharacter11 <= displayY4 && displayY4 < (yCharacter11 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character11Color;
        end else if (xCharacter10 <= displayX4 && displayX4 < (xCharacter10 + CHARACTER_WIDTH) &&
                yCharacter10 <= displayY4 && displayY4 < (yCharacter10 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character10Color;
            
        end else if (xCharacter9 <= displayX4 && displayX4 < (xCharacter9 + CHARACTER_WIDTH) &&
                yCharacter9 <= displayY4 && displayY4 < (yCharacter9 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character9Color;
        end else if (xCharacter8 <= displayX4 && displayX4 < (xCharacter8 + CHARACTER_WIDTH) &&
                yCharacter8 <= displayY4 && displayY4 < (yCharacter8 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character8Color;
        end else if (xCharacter7 <= displayX4 && displayX4 < (xCharacter7 + CHARACTER_WIDTH) &&
                yCharacter7 <= displayY4 && displayY4 < (yCharacter7 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character7Color;
        end else if (xCharacter6 <= displayX4 && displayX4 < (xCharacter6 + CHARACTER_WIDTH) &&
                yCharacter6 <= displayY4 && displayY4 < (yCharacter6 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character6Color;
        end else if (xCharacter5 <= displayX4 && displayX4 < (xCharacter5 + CHARACTER_WIDTH) &&
                yCharacter5 <= displayY4 && displayY4 < (yCharacter5 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character5Color;
        
        end else if (xCharacter4 <= displayX4 && displayX4 < (xCharacter4 + CHARACTER_WIDTH) &&
                yCharacter4 <= displayY4 && displayY4 < (yCharacter4 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character4Color;
        end else if (xCharacter3 <= displayX4 && displayX4 < (xCharacter3 + CHARACTER_WIDTH) &&
                yCharacter3 <= displayY4 && displayY4 < (yCharacter3 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character3Color;
        end else if (xCharacter2 <= displayX4 && displayX4 < (xCharacter2 + CHARACTER_WIDTH) &&
                yCharacter2 <= displayY4 && displayY4 < (yCharacter2 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character2Color;
        end else if (xCharacter1 <= displayX4 && displayX4 < (xCharacter1 + CHARACTER_WIDTH) &&
                yCharacter1 <= displayY4 && displayY4 < (yCharacter1 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character1Color;
        end else if (xCharacter0 <= displayX4 && displayX4 < (xCharacter0 + CHARACTER_WIDTH) &&
                yCharacter0 <= displayY4 && displayY4 < (yCharacter0 + CHARACTER_HEIGHT) &&
                dataOutA == 1) begin
            pixel <= character0Color;
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
    CharactersROM characterBRAM2 (
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
