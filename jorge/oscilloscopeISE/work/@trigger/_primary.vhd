library verilog;
use verilog.vl_types.all;
entity Trigger is
    generic(
        DATA_BITS       : integer := 8
    );
    port(
        clock           : in     vl_logic;
        threshold       : in     vl_logic_vector;
        dataIn          : in     vl_logic_vector;
        triggerDisable  : in     vl_logic;
        isTriggered     : out    vl_logic;
        previousData    : out    vl_logic_vector
    );
end Trigger;
