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
    