/* SampleAverager
 * Daniel D. Richman
 * November 2016
 */

module SampleAverager
  #(parameter DATA_BITS = 12)
  (input clock,
   input dataReady,
   input signed [DATA_BITS-1:0] dataIn,
   output reg signed [DATA_BITS+1:0] sampleAverage);

   always @(posedge clock) begin
     if (dataReady) begin

       // what's the performance of this multiply?
       sampleAverage <= (sampleAverage >> 7) * 127 +
                         (dataIn >> 7);
     end
   end
endmodule


// More ideas: to have sliding-in-time, simply don't mark newest trigger sample; hold onto a trigger sample until we have another one at least k samples ago.
// For two channels, can support either one trigger sets both (standard scope operation) or two fully independent triggers

// Choose good sample period: count the number of peaks output by the EdgeTypeDetector and choose a period such that it is 3
