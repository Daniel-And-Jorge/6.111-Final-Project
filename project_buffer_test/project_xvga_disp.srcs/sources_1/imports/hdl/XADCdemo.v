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
   output reg [3:0] VGA_R, output [3:0] VGA_G, output [3:0] VGA_B
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
               
   reg ready;
   reg [11:0] dataIn;
   reg isTrigger;
   reg lockTrigger;
   reg [9:0] readAddress;
   wire [11:0] dataOut;
   buffer_simple mybuf
                             (.clock(CLK60MHZ), .ready(ready), .dataIn(dataIn),
                              .isTrigger(isTrigger), .disableCollection(0), .lockTrigger(lockTrigger),
                              .reset(0),
                              .readTriggerRelative(1),
                              .readAddress(readAddress),
                              .dataOut(dataOut));
   
   reg [30:0] clk_counter;
  /* always @(posedge CLK60MHZ) begin
     clk_counter <= clk_counter + 1;
     dataIn <= dataIn + 1;
     isTrigger <= 1;
     
     if (clk_counter > 'd65000000) begin
       clk_counter <= 0;
     end
     
     if (clk_counter == 0) begin
       lockTrigger <= 1;
       readAddress <= 0;
     end
     
     if (displayY < dataOut) begin
       VGA_R <= 4'b1111;
     end else
       VGA_R <= 0;
   end
    */
   
   assign VGA_HS = hsync;
   assign VGA_VS = vsync;
   
 //  assign VGA_R = vga_r;
   assign VGA_G = vga_g;
   assign VGA_B = vga_b;
   
   
     
   reg [32:0] decimal;   
   reg [3:0] dig0;
   reg [3:0] dig1;
   reg [3:0] dig2;
   reg [3:0] dig3;
   reg [3:0] dig4;
   reg [3:0] dig5;
   reg [3:0] dig6;
      
     reg [32:0] count; 
     //binary to decimal conversion
      always @ (posedge(CLK60MHZ))
      begin
      
      ready <= 1;
      readAddress <= 0;
      dataIn = (count % 25); //count;
      isTrigger = 1;
      
        if(count == 6000000)begin
        
        decimal = dataOut;
            
            
            dig0 = decimal % 10;
            decimal = decimal / 10;
            
            dig1 = decimal % 10;
            decimal = decimal / 10;
                   
            dig2 = decimal % 10;
            decimal = decimal / 10;
            
            dig3 = decimal % 10;
            decimal = decimal / 10;
            
            dig4 = decimal % 10;
            decimal = decimal / 10;
                   
            dig5 = decimal % 10;
            decimal = decimal / 10; 
            
            dig6 = decimal % 10;
            decimal = decimal / 10; 
            
            count = 0;
       end
       
      count = count + 1;
      
      if (count == 6000000 * 5)
        lockTrigger = !lockTrigger;
               
      end
      
      DigitToSeg segment1(.in1(dig0),
                         .in2(dig1),
                         .in3(dig2),
                         .in4(dig3),
                         .in5(dig4),
                         .in6(dig5),
                         .in7(dig6),
                         .in8(),
                         .mclk(CLK60MHZ),
                         .an(an),
                         .dp(dp),
                         .seg(seg));   
   
   
endmodule
