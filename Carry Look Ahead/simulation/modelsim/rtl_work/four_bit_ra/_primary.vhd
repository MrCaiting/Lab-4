library verilog;
use verilog.vl_types.all;
entity four_bit_ra is
    port(
        x               : in     vl_logic_vector(3 downto 0);
        y               : in     vl_logic_vector(3 downto 0);
        cin             : in     vl_logic;
        s               : out    vl_logic_vector(3 downto 0);
        g_4             : out    vl_logic;
        p_4             : out    vl_logic
    );
end four_bit_ra;
