// Daniel D. Richman
// 14 Nov 2016

// Input: a signal, such as from a button. 
// Output: a signal that is HIGH for one clock cycle when the input goes HIGH, then goes LOW. 
// The output cannot go HIGH again until the input has returned to LOW. 

module ButtonSinglePulse(
    input clock,
    input btn,
    output reg btn1pulse
    );
    
    reg pulsedon = 0;
    
    always @(posedge clock) begin
        if (!pulsedon && btn) begin
            btn1pulse <= 1;
            pulsedon <= 1;
        end else begin
            btn1pulse <= 0;
            
            if (!btn)
                pulsedon <= 0;
        end
    end
endmodule
