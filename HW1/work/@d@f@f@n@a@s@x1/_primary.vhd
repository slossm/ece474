library verilog;
use verilog.vl_types.all;
entity DFFNASX1 is
    port(
        D               : in     vl_logic;
        CLK             : in     vl_logic;
        SETB            : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end DFFNASX1;
