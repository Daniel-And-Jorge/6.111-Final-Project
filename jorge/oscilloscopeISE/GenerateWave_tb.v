`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:15:22 10/28/2016
// Design Name:   GenerateWave
// Module Name:   /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/FinalProject/oscilloscopeISE/GenerateWave_tb.v
// Project Name:  oscilloscopeISE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GenerateWave
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GenerateWave_tb;

	// Inputs
	reg clock;
	reg [11:0] dataIn;
	reg [10:0] displayX;
	reg [9:0] displayY;
	reg hsync;
	reg vsync;
	reg blank;

	// Outputs
	wire pixel;
	wire [23:0] RGBColor;
	wire drawStarting;
	wire [10:0] address;
	wire wHsync;
	wire wVsync;
	wire wBlank;

	// Instantiate the Unit Under Test (UUT)
	GenerateWave uut (
		.clock(clock), 
		.dataIn(dataIn), 
		.displayX(displayX), 
		.displayY(displayY), 
		.hsync(hsync), 
		.vsync(vsync), 
		.blank(blank), 
		.pixel(pixel), 
		.RGBColor(RGBColor), 
		.drawStarting(drawStarting), 
		.address(address), 
		.wHsync(wHsync), 
		.wVsync(wVsync), 
		.wBlank(wBlank)
	);

	always #5 clock = ~clock;

	initial begin
		// Initialize Inputs
		clock = 0;
		dataIn = 0;
		displayX = 0;
		displayY = 0;
		hsync = 0;
		vsync = 0;
		blank = 0;

		// Wait 100 ns for global reset to finish
		#105;
        
		// Add stimulus here
		
		# 1;
		//Test wHsync, wVsync, wBlank, RGBColor
		hsync = 1;
		vsync = 1;
		blank = 1;
		#10;
		hsync = 0;
		vsync = 0;
		blank = 0;
		#10;
		
		#20
		//Test drawStarting
		displayX = 1023;
		displayY = 767;
		#10;
		displayX=1024;
		displayY=767;
		#10;
		
		#20
		//Test pixel
		dataIn = 80;
		displayY = 384-82;
		#10;
		displayY = 384-81;
		#10;
		displayY = 384-80;
		#10;
		displayY = 384-79;
		#10;
		displayY = 384-78;
		#10;
		
		#20
		//Test address
		displayX = 1021;
		#10;
		displayX = 1020;
		#10;
		displayX = 1342;
		#10;
		displayX = 1343;
		#10;
		displayX = 0;
		#10;
		displayX = 1;
		#10;

	end
      
endmodule

