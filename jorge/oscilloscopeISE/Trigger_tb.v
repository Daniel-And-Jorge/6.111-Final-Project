`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:25:38 10/21/2016
// Design Name:   Trigger
// Module Name:   /afs/athena.mit.edu/user/j/a/jatron/Documents/6.111/FinalProject/oscilloscopeISE/Trigger_tb.v
// Project Name:  oscilloscopeISE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Trigger
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Trigger_tb;

	// Inputs
	reg clock;
	reg [7:0] threshold;
	reg [7:0] dataIn;
	reg triggerDisable;

	// Outputs
	wire isTriggered;
	wire [7:0] previousData;

	// Instantiate the Unit Under Test (UUT)
	Trigger uut (
		.clock(clock), 
		.threshold(threshold), 
		.dataIn(dataIn), 
		.triggerDisable(triggerDisable), 
		.isTriggered(isTriggered),
		.previousData(previousData)
	);
	
	always #5 clock=~clock;

	initial begin
		// Initialize Inputs
		clock = 0;
		threshold = 0;
		dataIn = 0;
		triggerDisable = 0;

		// Wait 100 ns for global reset to finish
		#105;
        
		// Add stimulus here
		threshold = 8'b1000_0001;
		triggerDisable = 0;
		#1
		dataIn = 8'b1000_0000;
		
		#10;
		dataIn = 8'b1000_0001;
		
		#10;
		dataIn = 8'b1000_0001;
		
		#10;
		dataIn = 8'b1000_0010;
		
		#10
		dataIn = 8'b1000_0011;

	end
      
endmodule

