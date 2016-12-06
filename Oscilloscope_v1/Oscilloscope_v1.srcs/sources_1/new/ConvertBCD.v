`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2016 01:40:36 PM
// Design Name: 
// Module Name: ConvertBCD
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


module ConvertBCD
    #(parameter COMPUTING_BCD = 1'b1,
					 IDLE = 1'b0)
	(input clock,
    input [9:0] data,
    output reg [3:0] d = 0,
    output reg [3:0] d10 = 0,
    output reg [3:0] d100 = 0
    );

	reg state = IDLE;
	reg [6:0] remainingData10 = 0;
	reg [9:0] previousData;

	always @(posedge clock) begin
		previousData <= data;
		case (state)
			IDLE: begin
				if (previousData != data) begin
					state <= COMPUTING_BCD;
					d10 <= d10;
					d <= d;
					//compute d100
					if (data >= 900) begin
						d100 <= 9;
						remainingData10 <= data - 900;
					end else if (data >=800) begin
						d100 <= 8;
						remainingData10 <= data - 800;
					end else if (data >=700) begin
						d100 <= 7;
						remainingData10 <= data - 700;
					end else if (data >=600) begin
						d100 <= 6;
						remainingData10 <= data - 600;
					end else if (data >=500) begin
						d100 <= 5;
						remainingData10 <= data - 500;
					end else if (data >=400) begin
						d100 <= 4;
						remainingData10 <= data - 400;
					end else if (data >=300) begin
						d100 <= 3;
						remainingData10 <= data - 300;
					end else if (data >=200) begin
						d100 <= 2;
						remainingData10 <= data - 200;
					end else if (data >=100) begin
						d100 <= 1;
						remainingData10 <= data - 100;
					end else begin
						d100 <= 0;
						remainingData10 <= data;
					end
				end else begin
					state <= IDLE;
					d100 <= d100;
					d10 <= d10;
					d <= d;
					remainingData10 <= remainingData10;
				end
			end COMPUTING_BCD: begin
				state <= IDLE;
				d100 <= d100;
				remainingData10 <= remainingData10;
				if (remainingData10 >= 90) begin
					d10 <= 9;
					d <= remainingData10 - 90;
				end else if (remainingData10 >=80) begin
					d10 <= 8;
					d <= remainingData10 - 80;
				end else if (remainingData10 >=70) begin
					d10 <= 7;
					d <= remainingData10 - 70;
				end else if (remainingData10 >=60) begin
					d10 <= 6;
					d <= remainingData10 - 60;
				end else if (remainingData10 >=50) begin
					d10 <= 5;
					d <= remainingData10 - 50;
				end else if (remainingData10 >=40) begin
					d10 <= 4;
					d <= remainingData10 - 40;
				end else if (remainingData10 >=30) begin
					d10 <= 3;
					d <= remainingData10 - 30;
				end else if (remainingData10 >=20) begin
					d10 <= 2;
					d <= remainingData10 - 20;
				end else if (remainingData10 >=10) begin
					d10 <= 1;
					d <= remainingData10 - 10;
				end else begin
					d10 <= 0;
					d <= remainingData10;
				end
			end default: begin
				state <= IDLE;
				d100 <= d100;
				d10 <= 10;
				d <= d;
				remainingData10 <= remainingData10;
			end
		endcase
	end
endmodule