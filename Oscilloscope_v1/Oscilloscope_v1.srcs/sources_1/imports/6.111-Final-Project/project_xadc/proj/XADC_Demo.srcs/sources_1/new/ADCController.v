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


// dataOut = (dataIn - INPUT_OFFSET)

module ADCController
   #(parameter IO_BITS = 12,
               INPUT_OFFSET = 2048)
   (
    input clock,
    input reset,
    input sampleEnabled,
    input inputReady,
    input [5:0]samplePeriod,
    input [IO_BITS-1:0] dataIn,
    output reg requestConversion,
    output reg ready,
    output reg signed[IO_BITS-1:0] dataOut
    );
    
    reg [15:0]sampleClock = 0;
    
    always @(posedge clock) begin
        // check whether it's time to request another sample
        if (!reset && sampleEnabled && inputReady) begin
            if (sampleClock >= samplePeriod) begin
                ready <= 1;
                dataOut <= (dataIn - INPUT_OFFSET); 
                sampleClock <= 0;
            end else
                sampleClock <= sampleClock + 1;
        end
    
        if (ready)
            ready <= 0;
        
        if (reset) begin
            ready <= 0;
            dataOut <= 0;
        end
    end
endmodule
