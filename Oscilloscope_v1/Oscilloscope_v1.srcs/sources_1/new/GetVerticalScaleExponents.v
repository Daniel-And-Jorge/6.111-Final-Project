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
        if (verticalScaleFactorTimes8Channel1 == 10'd1) verticalScaleExponentChannel1 <= 4'd0;
        else if (verticalScaleFactorTimes8Channel1 == 10'd2) verticalScaleExponentChannel1 <= 4'd1;
        else if (verticalScaleFactorTimes8Channel1 == 10'd4) verticalScaleExponentChannel1 <= 4'd2;
        else if (verticalScaleFactorTimes8Channel1 == 10'd8) verticalScaleExponentChannel1 <= 4'd3;
        else if (verticalScaleFactorTimes8Channel1 == 10'd16) verticalScaleExponentChannel1 <= 4'd4;
        else if (verticalScaleFactorTimes8Channel1 == 10'd32) verticalScaleExponentChannel1 <= 4'd5;
        else if (verticalScaleFactorTimes8Channel1 == 10'd64) verticalScaleExponentChannel1 <= 4'd6;
        else if (verticalScaleFactorTimes8Channel1 == 10'd128) verticalScaleExponentChannel1 <= 4'd7;
        else if (verticalScaleFactorTimes8Channel1 == 10'd256) verticalScaleExponentChannel1 <= 4'd8;
        else if (verticalScaleFactorTimes8Channel1 == 10'd512) verticalScaleExponentChannel1 <= 4'd9;
        else if (verticalScaleFactorTimes8Channel1 == 10'd1024) verticalScaleExponentChannel1 <= 4'd10;
        
        //channel 2
        if (verticalScaleFactorTimes8Channel2 == 10'd1) verticalScaleExponentChannel2 <= 4'd0;
        else if (verticalScaleFactorTimes8Channel2 == 10'd2) verticalScaleExponentChannel2 <= 4'd1;
        else if (verticalScaleFactorTimes8Channel2 == 10'd4) verticalScaleExponentChannel2 <= 4'd2;
        else if (verticalScaleFactorTimes8Channel2 == 10'd8) verticalScaleExponentChannel2 <= 4'd3;
        else if (verticalScaleFactorTimes8Channel2 == 10'd16) verticalScaleExponentChannel2 <= 4'd4;
        else if (verticalScaleFactorTimes8Channel2 == 10'd32) verticalScaleExponentChannel2 <= 4'd5;
        else if (verticalScaleFactorTimes8Channel2 == 10'd64) verticalScaleExponentChannel2 <= 4'd6;
        else if (verticalScaleFactorTimes8Channel2 == 10'd128) verticalScaleExponentChannel2 <= 4'd7;
        else if (verticalScaleFactorTimes8Channel2 == 10'd256) verticalScaleExponentChannel2 <= 4'd8;
        else if (verticalScaleFactorTimes8Channel2 == 10'd512) verticalScaleExponentChannel2 <= 4'd9;
        else if (verticalScaleFactorTimes8Channel2 == 10'd1024) verticalScaleExponentChannel2 <= 4'd10;
    end
    
endmodule
