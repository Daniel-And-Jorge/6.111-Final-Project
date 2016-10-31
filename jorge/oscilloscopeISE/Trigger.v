`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:44 10/21/2016 
// Design Name: 
// Module Name:    Trigger 
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
module Trigger
    #(parameter DATA_BITS = 8)
    (input clock,
    input [DATA_BITS-1:0] threshold,
    input [DATA_BITS-1:0] dataIn,
    input triggerDisable,
    output reg isTriggered,
	 output reg [DATA_BITS-1:0] previousData
    );
    
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
