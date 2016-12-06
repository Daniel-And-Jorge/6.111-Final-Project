`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2016 04:52:54 PM
// Design Name: 
// Module Name: SamplePeriodToTimePerDivision
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


module SamplePeriodToTimePerDivision
    #(parameter SAMPLE_PERIOD_BITS = 6,
                SAMPLE_PERIOD_BITS_PLUS_ONE = 7,
                TIME_PER_DIVISION_BITS = 10)
    (input clock,
    input [SAMPLE_PERIOD_BITS-1:0] samplePeriod,
    output reg [TIME_PER_DIVISION_BITS-1:0] timePerDivision
    );
    
    reg [SAMPLE_PERIOD_BITS_PLUS_ONE-1:0] samplePeriodPlusOne;
    
    
    always @ (posedge clock) begin
        //cycle 0
        samplePeriodPlusOne <= samplePeriod + 1;
        
        //cycle 1
        timePerDivision <= samplePeriodPlusOne * 10;
    end
    
endmodule
