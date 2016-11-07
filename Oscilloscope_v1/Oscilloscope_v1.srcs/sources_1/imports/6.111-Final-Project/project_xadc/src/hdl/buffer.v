/* buffer.v
 * Digital Storage Oscilloscope
 * 6.111
 * Daniel D. Richman
 * October 2016
 *
 * This module stores samples.
 * Behavior:
 *   It assumes access to an external memory management module
 *   of size 2^LOG_SAMPLES. Each sample has SAMPLE_SIZE bits.
 *
 *   On posedge clock, the buffer reads a sample from dataIn if
 *     - ready is HIGH and
 *     - disableCollection is LOW
 *   It then stores the sample in the buffer.
 *   To assist in sample retrieval, the buffer stores the address of the most recent trigger sample (stored when isTrigger is HIGH).
 *   If lockTrigger is high, the address of the most recent trigger sample is
 *      stored as the active trigger sample.
 *
 *   Data retrieval:
 *     - readAddress specifies a sample ID to be read.
 *     - if readTriggerRelative is HIGH, the sample ID is relative to the active
 *        trigger sample. If readTriggerRelative is LOW, the sample ID is relative
 *        to the most recent sample
 */



// discuss naming convention (snake or camel) with Jorge

module buffer #(parameter LOG_SAMPLES=12, SAMPLE_SIZE=12)
              (input clock, input ready, input signed [SAMPLE_SIZE-1:0]dataIn,
               input isTrigger, input disableCollection, input activeBramSelect, // 0 if BRAM 0 is active
               input reset,
               input readTriggerRelative,
               input signed [LOG_SAMPLES-1:0]readAddress,
               output reg signed [SAMPLE_SIZE-1:0]dataOut);

    reg [LOG_SAMPLES-1:0] pointer0; // points to the next open slot in the BRAM
    reg [LOG_SAMPLES-1:0] pointer1;
    reg [LOG_SAMPLES-1:0] trigger_address0;
    reg [LOG_SAMPLES-1:0] trigger_address1;
    
    wire [LOG_SAMPLES-1:0] addressAllOnes;
    assign addressAllOnes = 'hFFFFFFFFFFF; // more one bits than allOnes will possibly need

    // Need the IP for this
    reg ram0_we;
    reg [LOG_SAMPLES-1:0] ram0_addra;
    reg [SAMPLE_SIZE-1:0] ram0_din;
    reg [LOG_SAMPLES-1:0] ram0_addrb;
    wire [SAMPLE_SIZE-1:0] ram0_dout;
    
    blk_mem_gen_0 bram0 (
      .clka(clock),    // input wire clka
      .ena(1),      // input wire ena
      .wea(ram0_we),      // input wire [0 : 0] wea
      .addra(ram0_addra),  // input wire [9 : 0] addra
      .dina(ram0_din),    // input wire [11 : 0] dina
      .douta(),  // output wire [11 : 0] douta
      .clkb(clock),    // input wire clkb
      .enb(1),      // input wire enb
      .web(0),      // input wire [0 : 0] web
      .addrb(ram0_addrb),  // input wire [9 : 0] addrb
      .dinb(),    // input wire [11 : 0] dinb
      .doutb(ram0_dout)  // output wire [11 : 0] doutb
    );
    
    reg ram1_we;
    reg [LOG_SAMPLES-1:0] ram1_addra;
    reg [SAMPLE_SIZE-1:0] ram1_din;
    reg [LOG_SAMPLES-1:0] ram1_addrb;
    wire [SAMPLE_SIZE-1:0] ram1_dout;
    blk_mem_gen_1 bram1 (
          .clka(clock),    // input wire clka
          .ena(1),      // input wire ena
          .wea(ram1_we),      // input wire [0 : 0] wea
          .addra(ram1_addra),  // input wire [9 : 0] addra
          .dina(ram1_din),    // input wire [11 : 0] dina
          .douta(),  // output wire [11 : 0] douta
          .clkb(clock),    // input wire clkb
          .enb(1),      // input wire enb
          .web(0),      // input wire [0 : 0] web
          .addrb(ram1_addrb),  // input wire [9 : 0] addrb
          .dinb(),    // input wire [11 : 0] dinb
          .doutb(ram1_dout)  // output wire [11 : 0] doutb
        );

  always @(posedge clock) begin
    if (reset) begin
      trigger_address0 <= 0;
      trigger_address1 <= 0;

      pointer0 <= 0;
      pointer1 <= 0;

    end else begin
      if (ready && !disableCollection) begin
        // store dataIn to pointer
        ram0_addra <= pointer0;
        ram1_addra <= pointer1;
        ram0_din <= dataIn;
        ram1_din <= dataIn;

        // only write to the active BRAM
        if (activeBramSelect == 0) begin
          ram0_we <= 1;
          ram1_we <= 0;
          pointer0 <= pointer0 + 1;
        end else begin
          ram0_we <= 0;
          ram1_we <= 1;
          pointer1 <= pointer1 + 1;
        end

        if (isTrigger) begin
          if (activeBramSelect == 0) begin
            trigger_address0 <= pointer0;
          end else begin
            trigger_address1 <= pointer1;
          end
        end
      end

      // read data
      if (readTriggerRelative) begin
        ram0_addrb <= (trigger_address0 + readAddress) & addressAllOnes;
        ram1_addrb <= (trigger_address1 + readAddress) & addressAllOnes;
      end else begin
        ram0_addrb <= (pointer0 + readAddress) & addressAllOnes;
        ram1_addrb <= (pointer1 + readAddress) & addressAllOnes;
      end

      // the bram we actually output is the locked (non-active) one
      if (activeBramSelect == 0)
        dataOut <= ram1_dout;
      else
        dataOut <= ram0_dout;
    end
  end
endmodule
