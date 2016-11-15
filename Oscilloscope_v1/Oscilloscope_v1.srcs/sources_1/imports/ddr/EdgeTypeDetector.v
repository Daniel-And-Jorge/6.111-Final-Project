/* EdgeTypeDetector
 * Daniel D. Richman
 * November 2016
 */

module EdgeTypeDetector
  #(parameter DATA_BITS = 12)
  (input clock,
   input dataReady,
   input signed [DATA_BITS-1:0] dataIn,
   output reg risingEdgeReady,
   output reg risingEdge);

   reg signed [DATA_BITS-1:0] previousSamples[5:0];
   reg signed [DATA_BITS+1:0] estimatedSlope; // try not to saturate

   genvar i;
   generate for (i = 1; i <= 5; i = i + 1) begin
       always @(posedge clock)
          previousSamples[i] <= previousSamples[i-1];
   end
   endgenerate

   always @(posedge clock) begin
     if (dataReady) begin
       // estimatedSlope = oldEstimatedSlope * .5 + currentSlope * .5
       estimatedSlope <= (estimatedSlope >> 2) + (estimatedSlope >> 1) +
                         ((dataIn - previousSamples[5]) >> 2);
       risingEdgeReady <= 1;
       risingEdge <= estimatedSlope > 0 ? 1 : 0;
     end else begin
       risingEdgeReady <= 0;
     end
   end

endmodule


// More ideas: to have sliding-in-time, simply don't mark newest trigger sample; hold onto a trigger sample until we have another one at least k samples ago.
