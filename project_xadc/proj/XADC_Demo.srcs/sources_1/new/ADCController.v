`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2016 08:45:49 PM
// Design Name: 
// Module Name: ADCController
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


// dataOut = (dataIn - INPUT_OFFSET) << LOG_SCALE_FACTOR

module ADCController
   #(parameter IO_BITS = 12,
               INPUT_OFFSET = 1 << 10,
               LOG_SCALE_FACTOR = 3)
   (
    input clock,
    input reset,
    input sampleEnabled,
    input inputReady,
    input [IO_BITS-1:0] dataIn,
    output reg ready,
    output reg signed[IO_BITS-1:0] dataOut
    );
    
    always @(posedge clock) begin
        if (ready)
            ready <= 0;
        
        if (!reset && sampleEnabled && inputReady) begin
            ready <= 1;
            dataOut <= (dataIn - INPUT_OFFSET) << LOG_SCALE_FACTOR;
        end
        
        if (reset) begin
            ready <= 0;
            dataOut <= 0;
        end
    end
endmodule
