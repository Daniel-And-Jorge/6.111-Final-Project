// Daniel D. Richman
// Substitute for fixed-point arithmetic using a signed scale factor, where negative represents shrinking

`define VERTICAL_SCALE(x, factor) ((factor >= 0) ? (x) <<< (factor) : (x) >>> (0 - (factor)))
`define ABS(x) ((x) > 0 ? (x) : (0 - (x)))