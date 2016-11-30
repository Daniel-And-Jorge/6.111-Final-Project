`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2016 09:18:50 PM
// Design Name: 
// Module Name: GetVerticalScaleExponents
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


module GetVerticalScaleExponents
    #(parameter SCALE_FACTOR_SIZE = 10,
                SCALE_EXPONENT_BITS = 4)
    (input clock,
    input [SCALE_FACTOR_SIZE-1:0] verticalScaleFactorTimes8Channel1,
    input [SCALE_FACTOR_SIZE-1:0] verticalScaleFactorTimes8Channel2,
    output reg [SCALE_EXPONENT_BITS-1:0] verticalScaleExponentChannel1,
    output reg [SCALE_EXPONENT_BITS-1:0] verticalScaleExponentChannel2
    );
    
    always @ (posedge clock) begin
        //channel 1
        if (verticalScaleFactorTimes8Channel1 == 1) verticalScaleExponentChannel1 <= 0;
        else if (verticalScaleFactorTimes8Channel1 == 2) verticalScaleExponentChannel1 <= 1;
        else if (verticalScaleFactorTimes8Channel1 == 4) verticalScaleExponentChannel1 <= 2;
        else if (verticalScaleFactorTimes8Channel1 == 8) verticalScaleExponentChannel1 <= 3;
        else if (verticalScaleFactorTimes8Channel1 == 16) verticalScaleExponentChannel1 <= 4;
        else if (verticalScaleFactorTimes8Channel1 == 32) verticalScaleExponentChannel1 <= 5;
        else if (verticalScaleFactorTimes8Channel1 == 64) verticalScaleExponentChannel1 <= 6;
        else if (verticalScaleFactorTimes8Channel1 == 128) verticalScaleExponentChannel1 <= 7;
        else if (verticalScaleFactorTimes8Channel1 == 256) verticalScaleExponentChannel1 <= 8;
        else if (verticalScaleFactorTimes8Channel1 == 512) verticalScaleExponentChannel1 <= 9;
        else if (verticalScaleFactorTimes8Channel1 == 1024) verticalScaleExponentChannel1 <= 10;
        
        //channel 2
        if (verticalScaleFactorTimes8Channel2 == 1) verticalScaleExponentChannel2 <= 0;
        else if (verticalScaleFactorTimes8Channel2 == 2) verticalScaleExponentChannel2 <= 1;
        else if (verticalScaleFactorTimes8Channel2 == 4) verticalScaleExponentChannel2 <= 2;
        else if (verticalScaleFactorTimes8Channel2 == 8) verticalScaleExponentChannel2 <= 3;
        else if (verticalScaleFactorTimes8Channel2 == 16) verticalScaleExponentChannel2 <= 4;
        else if (verticalScaleFactorTimes8Channel2 == 32) verticalScaleExponentChannel2 <= 5;
        else if (verticalScaleFactorTimes8Channel2 == 64) verticalScaleExponentChannel2 <= 6;
        else if (verticalScaleFactorTimes8Channel2 == 128) verticalScaleExponentChannel2 <= 7;
        else if (verticalScaleFactorTimes8Channel2 == 256) verticalScaleExponentChannel2 <= 8;
        else if (verticalScaleFactorTimes8Channel2 == 512) verticalScaleExponentChannel2 <= 9;
        else if (verticalScaleFactorTimes8Channel2 == 1024) verticalScaleExponentChannel2 <= 10;
    end
    
endmodule
