// MeasureSignal
// Daniel D. Richman
// November 2016

module MeasureSignal
    #(parameter DATA_BITS = 12,
      parameter MAX_MIN_RESET_DATA_CYCLES = 2000000)
    (
    input clock,
    input dataReady,
    input signed [DATA_BITS-1:0]dataIn,
    input isTrigger,
    output reg signed [DATA_BITS-1:0] signalMax = -1024, // change this to be bit-dependent
    output reg signed [DATA_BITS-1:0] signalMin = 1024,
    output reg [DATA_BITS-1:0] signalPeriod = 0,
    output reg signed [DATA_BITS-1:0] signalAverage = 0
    );

    reg [25:0] timeSinceMax = 0;
    reg [25:0] timeSinceMin = 0;    
    reg [29:0] triggerClock = 0;
    
    always @(posedge clock) begin
        if (dataReady) begin
            // detect signal maxes and mins
            if (dataIn > signalMax) begin
                signalMax <= dataIn;
                timeSinceMax <= 0;
            end else
                timeSinceMax <= timeSinceMax + 1;
            
            if (dataIn < signalMin) begin
                signalMin <= dataIn;
                timeSinceMin <= 0;
            end else
                timeSinceMin <= timeSinceMin + 1;
            
            // if it's been too long since we saw our last max or min, reset it to whatever we see
            if (timeSinceMin > MAX_MIN_RESET_DATA_CYCLES) begin
                signalMin <= dataIn;
            end
            
            if (timeSinceMax > MAX_MIN_RESET_DATA_CYCLES) begin
                signalMax <= dataIn;
            end
            
            // compute averaged statistics
            signalAverage <= ('sd7 * signalAverage + dataIn) / 'sd8;
            
            if (isTrigger) begin
                signalPeriod <= triggerClock; //(7 * signalPeriod + triggerClock) / 8;
                triggerClock <= 0;
            end else
                triggerClock <= triggerClock + 1;
        end
    end
endmodule
