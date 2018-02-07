library verilog;
use verilog.vl_types.all;
entity carry_lookahead_adder is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        Sum             : out    vl_logic_vector(15 downto 0);
        CO              : out    vl_logic
    );
end carry_lookahead_adder;
