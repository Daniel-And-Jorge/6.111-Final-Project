`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2015 03:26:51 PM
// Design Name: 
// Module Name: // Project Name: 
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
 

module XADCdemo(
   input CLK100MHZ,
   input vauxp2,
   input vauxn2,
   input vauxp3,
   input vauxn3,
   input vauxp10,
   input vauxn10,
   input vauxp11,
   input vauxn11,
   input [1:0] sw,
   output reg [15:0] LED,
   output [7:0] an,
   output dp,
   output [6:0] seg,
   output VGA_HS,
   output VGA_VS,
   output [3:0] VGA_R, output [3:0] VGA_G, output [3:0] VGA_B
 );
 
   clk_wiz_0 instance_name
  (
  // Clock in ports
   .clk_in1(CLK100MHZ),      // input clk_in1
   // Clock out ports
   .clk_out1(CLK60MHZ),     // output clk_out1
   // Status and control signals
   .reset(0), // input reset
   .locked(locked));      // output locked
   
   
   wire [10:0] displayX;
   wire [9:0] displayY;
   wire [3:0] vga_r;
   wire [3:0] vga_g;
   wire [3:0] vga_b;
   wire vsync;
   wire hsync;
   wire blank;
   xvga x(CLK60MHZ,
             displayX, // pixel number on current line
             displayY, // line number
             vsync,hsync,blank);
   
   mysprite ms(displayX, displayY, vsync, hsync, blank,
               vga_r, vga_g, vga_b);
   
   assign VGA_HS = hsync;
   assign VGA_VS = vsync;
   assign VGA_R = vga_r;
   assign VGA_G = vga_g;
   assign VGA_B = vga_b;
   
endmodule
