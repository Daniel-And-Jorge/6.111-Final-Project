`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// SignalFFT
// Code based on Mitchell Gu's FFT implementation
//////////////////////////////////////////////////////////////////////////////////


module SignalFFT #(parameter DATA_BITS = 12, LOG_FFT_BINS=10)
    (
    input clock,
    // input samples from the ADC
    (*mark_debug = "true"*) input sampleReady,
    (*mark_debug = "true"*) input signed [DATA_BITS-1:0] dataIn,
    // interface to get FFT results
    (*mark_debug = "true"*) input [LOG_FFT_BINS-1:0]readAddress, // FFT bin
    (*mark_debug = "true"*) output [DATA_BITS-1:0]dataOut // FFT magnitude
    );
    
    // This is the FFT module, implemented as a block design with a 4096pt, 16bit FFT
    // that outputs in magnitude by doing sqrt(Re^2 + Im^2) on the FFT result.
    // It's fully pipelined (configured from FFT generator), so it streams 4096-wide
    // frames of frequency data as fast as
    // you stream in 4096-wide frames of time-domain samples.
    wire last_missing;
    (*mark_debug = "true"*) wire [31:0] frame_tdata;
    
    (*mark_debug = "true"*) reg frame_tlast, frame_tvalid;
    (*mark_debug = "true"*) wire frame_tready;
    (*mark_debug = "true"*) wire [23:0] magnitude_tdata; // This output bus has the FFT magnitude for the current index
    (*mark_debug = "true"*) wire [11:0] magnitude_tuser; // This represents the current index being output, from 0 to 4096
    (*mark_debug = "true"*) wire magnitude_tlast, magnitude_tvalid;
    
    fft_mag fft_mag_i(
        .clk(clock),
        .event_tlast_missing(last_missing),
        .frame_tdata(frame_tdata),
        .frame_tlast(frame_tlast),
        .frame_tready(frame_tready),
        .frame_tvalid(frame_tvalid),
        .scaling('d4),
        .magnitude_tdata(magnitude_tdata),
        .magnitude_tlast(magnitude_tlast),
        .magnitude_tuser(magnitude_tuser),
        .magnitude_tvalid(magnitude_tvalid));
        
    // Let's only care about the range from index 0 to 1023, which represents frequencies 0 to omega/2
    // where omega is the nyquist frequency (sample rate / 2)
    wire in_range = ~|magnitude_tuser[11:10]; // When 13 and 12 are 0, we're on indexes 0 to 1023
    (*mark_debug = "true"*) wire wea;
    assign wea = in_range & magnitude_tvalid;
    
    // INSTANTIATE HISTOGRAM BLOCK RAM 
    // This 16x1024 bram stores the histogram data.
    // The write port is written by process_fft.
    // The read port is read by the video outputter or the SD care saver
    // Assign histogram bram read address to histogram module unless saving
    (*mark_debug = "true"*) wire [9:0] haddr; // The read port address
    (*mark_debug = "true"*) wire [15:0] hdata; // The read port data
    assign haddr = readAddress;
    assign dataOut = hdata[11:0];
    blk_mem_fft bram2 (
        .clka(clock),
        .ena(1),
        .wea(wea),  // Only save FFT output if in range and output is valid
        .addra(magnitude_tuser[9:0]),       // The FFT output index, 0 to 1023
        .dina(magnitude_tdata[15:0]),       // The actual FFT magnitude
        .clkb(clock),  // input wire clkb
        .enb(1),
        .addrb(readAddress),     // input wire [9 : 0] addrb
        .doutb(hdata)      // output wire [15 : 0] doutb: read only the high 12 bits
    );

    // SENDING LOGIC
    // Once our oversampling is done,
    // Start at the frame bram head and send all 1024 buckets of bram.
    // Hopefully every time this happens, the FFT core is ready
    reg sending = 0;
    reg [9:0] send_count = 0;
    
    assign frame_tdata[31:16] = {16'b0}; // no imag part
    assign frame_tdata[15:0] = {dataIn}; // real part has only 12 bits

    always @(posedge clock) begin
        frame_tvalid <= 0; // Normally do not send
        frame_tlast <= 0; // Normally not the end of a frame
        
        if (sampleReady) begin
            if (!sending) begin
                sending <= 1;
                send_count <= 0;
            end
            
            if (sending && last_missing) begin
                // If core thought the frame ended
                sending <= 0; // reset to state 0
            end

            frame_tvalid <= 1; // Signal to fft a sample is ready
        end else begin
            if (frame_tready) begin // If the fft module was ready
                frame_tvalid <= 0;
                send_count <= send_count + 1; // increment send_count 
            end
            if (&send_count) begin
                // We're at last sample
                frame_tlast <= 1; // Tell the core
                if (frame_tready) sending <= 0; // Reset to state 0
            end
        end
    end

endmodule
