module CurveFFT
    #(parameter DATA_IN_BITS = 12,
                SCALE_FACTOR_BITS = 10,
                DISPLAY_X_BITS = 12,
                DISPLAY_Y_BITS = 12,
                RGB_COLOR = 12'hF80,  // orange
                RGB_BITS = 12,
                DISPLAY_WIDTH = 1280,
                DISPLAY_HEIGHT = 1024,
                REAL_DISPLAY_WIDTH = 1688,
                REAL_DISPLAY_HEIGHT = 1066,
                ADDITIONAL_WAVE_PIXELS = 1,  //number of colored pixels below and on top of the actual wave
                ADDRESS_BITS = 12
                )
    (input clock,
    input [DATA_IN_BITS-1:0] dataIn,
    input [DISPLAY_X_BITS-1:0] displayX,
    input [DISPLAY_Y_BITS-1:0] displayY,
    input hsync,
    input vsync,
    input blank,
    input [RGB_BITS-1:0] previousPixel,
    output [RGB_BITS-1:0] pixel,
    output reg [ADDRESS_BITS-1:0] address = 0,
    output reg [DISPLAY_X_BITS-1:0] curveDisplayX,
    output reg [DISPLAY_Y_BITS-1:0] curveDisplayY,
    output reg curveHsync,
    output reg curveVsync,
    output reg curveBlank
    );

    // 1 bin per pixel, with the selected range
    wire [DISPLAY_Y_BITS-1:0]dataScreenLocation = DISPLAY_HEIGHT - (dataIn >> 4);
    reg pixelOn;
    
    always @(posedge clock) begin
        // TODO delay these by the correct number of cycles
        curveHsync <= hsync;
        curveVsync <= vsync;
        curveBlank <= blank;
        curveDisplayX <= displayX;
        curveDisplayY <= displayY;
        
        
        //control pixel
        if (displayX == REAL_DISPLAY_WIDTH-2) address <= 0;
        else address <= address + 1;
        
        // data value above zero
        if ( dataScreenLocation <=displayY ) begin
            pixelOn <= 1;
        end else begin
            pixelOn <= 0;
        end
    end
    
    assign pixel = pixelOn ? RGB_COLOR : previousPixel;

endmodule