////////////////////////////////////////////////////////////////////////////////
//
// xvga: Generate XVGA display signals (1024 x 768 @ 60Hz)
// xvga_delayed_group: Includes an xvga module and a series of shift registers
//   so video signals can be connected to a set of sprites with different delay
//   pipelines.
//
// Modified by Daniel Richman from Lab 3 code
// October 2016
////////////////////////////////////////////////////////////////////////////////


// Most modules generate their output on the clock cycle after the input is generated.
// Modules that take n more clock cycles (by pipelining output generation) are also fine.

// Don't instantiate this: instantiate an xvga_delayed_group
module xvga(input vclock,
            output reg [10:0] displayX, // pixel number on current line
            output reg [9:0]  displayY, // line number
            output reg 	      vsync,hsync,blank);

   // horizontal: 1344 pixels total
   // display 1024 pixels per line
   reg 			      hblank,vblank;
   wire 		      hsyncon,hsyncoff,hreset,hblankon;
   assign hblankon = (displayX == 1023);
   assign hsyncon = (displayX == 1047);
   assign hsyncoff = (displayX == 1183);
   assign hreset = (displayX == 1343);

   // vertical: 806 lines total
   // display 768 lines
   wire 		      vsyncon,vsyncoff,vreset,vblankon;
   assign vblankon = hreset & (displayY == 767);
   assign vsyncon = hreset & (displayY == 776);
   assign vsyncoff = hreset & (displayY == 782);
   assign vreset = hreset & (displayY == 805);

   // sync and blanking
   wire 		      next_hblank,next_vblank;
   assign next_hblank = hreset ? 0 : hblankon ? 1 : hblank;
   assign next_vblank = vreset ? 0 : vblankon ? 1 : vblank;
   always @(posedge vclock) begin
      displayX <= hreset ? 0 : displayX + 1;
      hblank <= next_hblank;
      hsync <= hsyncon ? 0 : hsyncoff ? 1 : hsync;  // active low

      displayY <= hreset ? (vreset ? 0 : displayY + 1) : displayY;
      vblank <= next_vblank;
      vsync <= vsyncon ? 0 : vsyncoff ? 1 : vsync;  // active low

      blank <= next_vblank | (next_hblank & ~hreset);
   end
endmodule

module mysprite(input [10:0]displayX, input [9:0]displayY, input vsync, input hsync, input blank,
  output [3:0]vga_r, output [3:0]vga_g, output [3:0] vga_b);

    assign vga_r = 4'b0;
    assign vga_b = blank ? 4'b0 : 4'b1111;
    assign vga_g = 4'b0;
endmodule

module xvga_signal_delayer(input vclock,
                           input [10:0] displayX_in, // pixel number on current line
                           input [9:0]  displayY_in, // line number
                           input 	      vsync_in,hsync_in,blank_in,

                           output reg [10:0] displayX_out, // pixel number on current line
                           output reg [9:0]  displayY_out, // line number
                           output reg 	     vsync_out,hsync_out,blank_out);
  always @(posedge vclock) begin
    displayX_out <= displayX_in;
    displayY_out <= displayY_in;
    vsync_out <= vsync_in;
    hsync_out <= hsync_in;
    blank_out <= blank_in;
  end
endmodule

// This is the
// Instantiate a whole array of these boys in one go.
/*
module xvga_delayed_group #(parameter NUM_DELAYS=1)
  (input vclock,
   output wire [10:0] displayX[NUM_DELAYS:0],
   output wire [9:0] displayY[NUM_DELAYS:0],
   output wire vsync[NUM_DELAYS:0],
   output wire hsync[NUM_DELAYS:0],
   output wire blank[NUM_DELAYS:0]);

  xvga x(.vclock(vclock), .displayX(displayX[0]), .displayY(displayY[0]),
         .vsync(vsync[0]), .hsync(hsync[0]), .blank(blank[0]));

  genvar i;
  generate for (i = 1; i <= NUM_DELAYS; i = i + 1) begin
    xvga_signal_delayer sig_delay_group (.vclock(vclock),
      .displayX_in(displayX[i-1]), .displayY_in(displayY[i-1]),
      .vsync_in(vsync[i-1]), .hsync_in(hsync[i-1]), .blank_in(blank[i-1]),
      .displayX_out(displayX[i]), .displayY_out(displayY[i]),
      .vsync_out(vsync[i]), .hsync_out(hsync[i]), .blank_out(blank[i]));
  end
  endgenerate
endmodule
*/