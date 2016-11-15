`timescale 1ns / 1ps


// This module manages the Buffer's two buffers
// and selects which should be active and which locked, based on
// the drawStarting signal. 


module BufferSelector(
    input clock,
    input drawStarting,
    output reg activeBramSelect
    );
    
    always @(posedge clock) begin
        if (drawStarting)
            activeBramSelect <= ~activeBramSelect;
    end
endmodule
