library verilog;
use verilog.vl_types.all;
entity lab4_adders_toplevel is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        LoadB           : in     vl_logic;
        Run             : in     vl_logic;
        SW              : in     vl_logic_vector(15 downto 0);
        CO              : out    vl_logic;
        Sum             : out    vl_logic_vector(15 downto 0);
        Ahex0           : out    vl_logic_vector(6 downto 0);
        Ahex1           : out    vl_logic_vector(6 downto 0);
        Ahex2           : out    vl_logic_vector(6 downto 0);
        Ahex3           : out    vl_logic_vector(6 downto 0);
        Bhex0           : out    vl_logic_vector(6 downto 0);
        Bhex1           : out    vl_logic_vector(6 downto 0);
        Bhex2           : out    vl_logic_vector(6 downto 0);
        Bhex3           : out    vl_logic_vector(6 downto 0)
    );
end lab4_adders_toplevel;
