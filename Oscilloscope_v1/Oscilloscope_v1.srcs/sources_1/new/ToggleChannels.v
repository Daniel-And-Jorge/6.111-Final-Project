`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:20 11/26/2016 
// Design Name: 
// Module Name:    ToggleChannels 
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

module ToggleChannels
    #(parameter SAMPLE_BITS = 12,
                IDLE = 2'b00,
                READ_CHANNEL_1 = 2'b01,
                READ_CHANNEL_2 = 2'b10,
                INVALID_STATE = 2'b11,
                STATE_BITS =2,
                DRP_ADDRESS_BITS = 7,
                CHANNEL_1_ADDRESS = 7'h13,
                CHANNEL_2_ADDRESS = 7'h1B)
(
    input clock,
    input endOfConversion,
    input DRPReady,
    input signed [SAMPLE_BITS-1:0] DRPDataOut,
    
    output reg DRPEnable = 0,
    output reg DRPWriteEnable = 0,
    output reg signed [SAMPLE_BITS-1:0] channel1 = 0,
    output reg signed [SAMPLE_BITS-1:0] channel2 = 0,
    output reg [DRP_ADDRESS_BITS-1:0] DRPAddress = 0,
    output reg channelDataReady = 0,
    output reg [STATE_BITS-1:0] state = IDLE,
    output reg [STATE_BITS-1:0] previousState = IDLE
    );
    
    //TODO
    
    //reg [STATE_BITS-1:0] state = IDLE;
    //reg [STATE_BITS-1:0] previousState = IDLE;
    
    always @(posedge clock) begin
        DRPWriteEnable <= 0;
        case (state)
            IDLE: begin
                previousState <= IDLE;
                DRPEnable <= 0;
                channel1 <= channel1;
                channel2 <= channel2;
                DRPAddress <= DRPAddress;
                channelDataReady <= 0;
                if (endOfConversion) begin
                    state <= READ_CHANNEL_1;
                end else begin
                    state <= state;
                end
            end READ_CHANNEL_1: begin
                previousState <= READ_CHANNEL_1;
                channelDataReady <= 0;
                if (previousState == IDLE) begin
                    state <= state;
                    DRPEnable <= 1;
                    channel1 <= channel1;
                    channel2 <= channel2;
                    DRPAddress <= CHANNEL_1_ADDRESS;
                end else if (DRPReady) begin
                    state <= READ_CHANNEL_2;
                    DRPEnable <= 0;
                    channel1 <= DRPDataOut;
                    channel2 <= channel2;
                    DRPAddress <= DRPAddress;
                end else if (endOfConversion) begin
                    //not expecting endOfConversion
                    //return to IDLE and start all over
                    state <= IDLE;
                    DRPEnable <= 0;
                    channel1 <= channel1;
                    channel2 <= channel2;
                    DRPAddress <= DRPAddress;
                end else begin
                    state <= state;
                    DRPEnable <= 0;
                    channel1 <= channel1;
                    channel2 <= channel2;
                    DRPAddress <= DRPAddress;
                end
            end READ_CHANNEL_2: begin
                previousState <= READ_CHANNEL_2;
                if (previousState == READ_CHANNEL_1) begin
                    state <= state;
                    DRPEnable <= 1;
                    channel1 <= channel1;
                    channel2 <= channel2;
                    DRPAddress <= CHANNEL_2_ADDRESS;
                    channelDataReady <= 0;
                end else if (DRPReady) begin
                    state <= IDLE;
                    DRPEnable <= 0;
                    channel1 <= channel1;
                    channel2 <= DRPDataOut;
                    DRPAddress <= DRPAddress;
                    channelDataReady <= 1;
                end else if (endOfConversion) begin
                    //not expecting endOfConversion
                    //return to IDLE and start all over
                    state <= IDLE;
                    DRPEnable <= 0;
                    channel1 <= channel1;
                    channel2 <= channel2;
                    DRPAddress <= DRPAddress;
                    channelDataReady <= 0;
                end else begin
                    state <= state;
                    DRPEnable <= 0;
                    channel1 <= channel1;
                    channel2 <= channel2;
                    DRPAddress <= DRPAddress;
                    channelDataReady <= 0;
                end
            end default: begin
                //should never reach here
                previousState <= INVALID_STATE;
                state <= state;
                DRPEnable <= 0;
                channel1 <= channel1;
                channel2 <= channel2;
                DRPAddress <= DRPAddress;
                channelDataReady <= 0;
            end
        endcase
    end
endmodule