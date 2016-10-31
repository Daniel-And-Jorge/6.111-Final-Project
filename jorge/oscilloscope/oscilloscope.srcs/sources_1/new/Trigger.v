`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2016 02:02:47 PM
// Design Name: 
// Module Name: Trigger
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: checks if incoming data crosses trigger threshold.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
// Inputs:
//   -Threshold
//   -dataIn
//   -triggerDisable
// Outputs:
//   -isTriggered: asserted when incoming data crosses the trigger threshold
//                 isTriggered remains low if triggerDisable signal is high
// 
//////////////////////////////////////////////////////////////////////////////////


module Trigger
    #(parameter DATA_BITS = 8)
    (input clock,
    input [DATA_BITS-1:0] threshold,
    input [DATA_BITS-1:0] dataIn,
    input triggerDisable,
    output reg isTriggered
    );
    
    reg [DATA_BITS-1:0] previousData;

    always @(posedge clock) begin
        previousData <= dataIn;
        if ((previousData<threshold && dataIn>=threshold) ||
            previousData>threshold && dataIn<=threshold) begin
            if (triggerDisable!=1) begin
                isTriggered <= 1;
            end else begin
                isTriggered <= 0;
            end
        end else begin
            isTriggered <= 0;
        end
    end
        
endmodule