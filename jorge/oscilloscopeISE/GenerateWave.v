`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:16 10/28/2016 
// Design Name: 
// Module Name:    GenerateWave 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module GenerateWave                                                                                         
    #(parameter DATA_IN_BITS = 12,                                                                          
                DISPLAY_X_BITS = 11,                                                                        
                DISPLAY_Y_BITS = 10,                                                                        
                RGB_COLOR = 24'hFFFF00,  //yellow                                                           
                RGB_BITS = 24,                                                                              
                DISPLAY_WIDTH = 1024,                                                                       
                DISPLAY_HEIGHT = 768,                                                                       
                REAL_DISPLAY_WIDTH = 1344,                                                                  
                REAL_DISPLAY_HEIGHT = 806,                                                                  
                HEIGHT_ZERO_PIXEL = DISPLAY_HEIGHT/2,                                                       
                ADDITIONAL_WAVE_PIXELS = 1,  //number of colored pixels below and on top of the actual wave 
                SCALING_SHIFTS = 0,
					 ADDRESS_BITS = 11
                )                                                                                           
    (input clock,                                                                                           
    input [DATA_IN_BITS-1:0] dataIn,                                                                        
    input [DISPLAY_X_BITS-1:0] displayX,                                                                    
    input [DISPLAY_Y_BITS-1:0] displayY,                                                                    
    input hsync,                                                                                            
    input vsync,                                                                                            
    input blank,                                                                                            
    output reg pixel,                                                                                       
    output [RGB_BITS-1:0] RGBColor,                                                                         
    output reg drawStarting,                                                                                
    output reg [ADDRESS_BITS-1:0] address,                                                                                     
    output wHsync,                                                                                         
    output wVsync,                                                                                          
    output wBlank
    );
	 
	 assign wHsync = hsync;
    assign wVsync = vsync;                                                                                  
    assign wBlank = blank;  	 
                                                                                                            
    assign RGBColor = RGB_COLOR;                                                                            
                                                                                                            
    //scale dataIn                                                                                          
    wire [DATA_IN_BITS-1:0] scaledDataIn;                                                                   
    assign scaledDataIn = dataIn >> SCALING_SHIFTS;                                                         
                                                                                                            
    always @(posedge clock) begin                                                                           
        //control drawStarting                                                                              
        if (displayX==(DISPLAY_WIDTH-1) && displayY==(DISPLAY_HEIGHT-1)) begin                              
            drawStarting <= 1;                                                                              
        end else begin                                                                                      
            drawStarting <= 0;                                                                              
        end                                                                                                 
                                                                                                            
        //control pixel                                                                                     
        if ( (HEIGHT_ZERO_PIXEL-scaledDataIn-ADDITIONAL_WAVE_PIXELS)<=displayY &&                           
             displayY<=(HEIGHT_ZERO_PIXEL-scaledDataIn+ADDITIONAL_WAVE_PIXELS) ) begin                      
            pixel <= 1;                                                                                     
        end else begin                                                                                      
            pixel <= 0;                                                                                     
        end                                                                                                 
                                                                                                            
        //control address                                                                                   
        if (0<=displayX && displayX<=(DISPLAY_WIDTH-3)) begin                                               
            address <= displayX - (DISPLAY_WIDTH-3);                                                        
        end else if (displayX==(REAL_DISPLAY_WIDTH-2) || displayX==(REAL_DISPLAY_WIDTH-1) ) begin           
            address <= displayX - (REAL_DISPLAY_WIDTH + DISPLAY_WIDTH - 3);                                 
        end else begin                                                                                      
            //output address is irrelevant in this case                                                     
            address <= address;                                                                             
        end                                                                                                 
    end                                                                                                     
                                                                                                            
endmodule                                                                                                   