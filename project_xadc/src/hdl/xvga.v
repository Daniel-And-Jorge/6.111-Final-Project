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
            output reg [10:0] displayx, // pixel number on current line
            output reg [9:0]  displayy, // line number
            output reg 	      vsync,hsync,blank);

   // horizontal: 1344 pixels total
   // display 1024 pixels per line
   reg 			      hblank,vblank;
   wire 		      hsyncon,hsyncoff,hreset,hblankon;
   assign hblankon = (hcount == 1023);
   assign hsyncon = (hcount == 1047);
   assign hsyncoff = (hcount == 1183);
   assign hreset = (hcount == 1343);

   // vertical: 806 lines total
   // display 768 lines
   wire 		      vsyncon,vsyncoff,vreset,vblankon;
   assign vblankon = hreset & (vcount == 767);
   assign vsyncon = hreset & (vcount == 776);
   assign vsyncoff = hreset & (vcount == 782);
   assign vreset = hreset & (vcount == 805);

   // sync and blanking
   wire 		      next_hblank,next_vblank;
   assign next_hblank = hreset ? 0 : hblankon ? 1 : hblank;
   assign next_vblank = vreset ? 0 : vblankon ? 1 : vblank;
   always @(posedge vclock) begin
      hcount <= hreset ? 0 : hcount + 1;
      hblank <= next_hblank;
      hsync <= hsyncon ? 0 : hsyncoff ? 1 : hsync;  // active low

      vcount <= hreset ? (vreset ? 0 : vcount + 1) : vcount;
      vblank <= next_vblank;
      vsync <= vsyncon ? 0 : vsyncoff ? 1 : vsync;  // active low

      blank <= next_vblank | (next_hblank & ~hreset);
   end
endmodule

module xvga_signal_delayer(input vclock,
                           input [10:0] hcount_in, // pixel number on current line
                           input [9:0]  vcount_in, // line number
                           input 	      vsync_in,hsync_in,blank_in,

                           output reg [10:0] hcount_out, // pixel number on current line
                           output reg [9:0]  vcount_out, // line number
                           output reg 	     vsync_out,hsync_out,blank_out);
  always @(posedge vclock) begin
    hcount_out <= hcount_in;
    vcount_out <= vcount_in;
    vsync_out <= vsync_in;
    hsync_out <= hsync_in;
    blank_out <= blank_in;
  end
endmodule

// This is the
// Instantiate a whole array of these boys in one go.
module xvga_delayed_group #(parameter NUM_DELAYS=1)
  (input vclock,
   output wire [10:0] hcount[NUM_DELAYS:0],
   output wire [9:0] vcount[NUM_DELAYS:0],
   output wire vsync[NUM_DELAYS:0],
   output wire hsync[NUM_DELAYS:0],
   output wire blank[NUM_DELAYS:0]);

  xvga x(.vclock(vclock), .hcount(hcount[0]), .vcount(vcount[0]),
         .vsync(vsync[0]), .hsync(hsync[0]), .blank(blank[0]));

  genvar i;
  generate for (i = 1; i <= NUM_DELAYS; i++) begin
    xvga_signal_delayer sig_delay_group (.vclock(vclock),
      .hcount_in(hcount[i-1]), .vcount_in(vcount[i-1]),
      .vsync_in(vsync[i-1]), .hsync_in(hsync[i-1]), .blank_in(blank[i-1]),
      .hcount_out(hcount[i]), .vcount_out(vcount[i]),
      .vsync_out(vsync[i]), .hsync_out(hsync[i]), .blank_out(blank[i]));
  endgenerate
endmodule
