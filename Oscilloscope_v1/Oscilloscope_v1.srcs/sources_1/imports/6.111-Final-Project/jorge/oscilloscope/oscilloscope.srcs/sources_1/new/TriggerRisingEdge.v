`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2016 12:43:05 PM
// Design Name: 
// Module Name: TriggerRisingEdge
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


module TriggerRisingEdge
    #(parameter DATA_BITS = 12)
    (input clock,
    input signed [DATA_BITS-1:0] threshold,
    input signed [DATA_BITS-1:0] dataIn,
    input triggerDisable,
    output isTriggered
    );
    
    reg signed [DATA_BITS-1:0] previousData;

    always @(posedge clock) begin
        previousData <= dataIn;
    end
    
    assign isTriggered = (previousData<threshold && dataIn>=threshold && !triggerDisable);
        
endmodule

module TriggerRisingEdgeSteady
    #(parameter DATA_BITS = 12,
                HOLDOFF_SAMPLES = 10)
    (input clock,
    input signed [DATA_BITS-1:0] threshold,
    input signed [DATA_BITS-1:0] dataIn,
    input triggerDisable,
    output isTriggered
    );
    
    reg [4:0]samplesSinceTrigger = 0;
    
    reg signed [DATA_BITS-1:0] previousData;
    reg signed [DATA_BITS-1:0] previousData2;

    always @(posedge clock) begin
        previousData2 <= previousData;
        previousData <= dataIn;
        
        if (isTriggered)
          samplesSinceTrigger <= 0;
        else if (samplesSinceTrigger < HOLDOFF_SAMPLES)
          samplesSinceTrigger <= samplesSinceTrigger + 1;
    end
    
    assign isTriggered = (previousData2<threshold && previousData<threshold
                          && dataIn>=threshold && !triggerDisable && samplesSinceTrigger >= HOLDOFF_SAMPLES);
        
endmodule