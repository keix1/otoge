library ieee;
use ieee.std_logic_1164.all;

entity DISP_CTL is
    port (
        POINTUP   : in std_logic(3 downto 0);
--        SHOW    : in std_logic;
--        KYOKU   : in std_logic_vector(3 downto 0);
--        DISP0   : out std_logic_vector(7 downto 0);
--        DISP1   : out std_logic_vector(7 downto 0);
--        DISP2   : out std_logic_vector(7 downto 0);
--        DISP3   : out std_logic_vector(7 downto 0);
        LG0     : out std_logic;
        LG1     : out std_logic;
        LG2     : out std_logic;
        LG3     : out std_logic;
        LG4     : out std_logic;
        LG5     : out std_logic;
        LG6     : out std_logic;
        LG7     : out std_logic;
        LG8     : out std_logic;
        LG9     : out std_logic );

end  DISP_CTL;

architecture RTL of DISP_CTL is
begin
    process(POINTUP) begin
        case POINTUP is
            when "0000" => LG0 <='1';
            when "0001" => LG1 <='1';
            when "0010" => LG2 <='1';
            when "0011" => LG3 <='1';
            when "0100" => LG4 <='1';
            when "0101" => LG5 <='1';
            when "0110" => LG6 <='1';
            when "0111" => LG7 <='1';
            when "1000" => LG8 <='1';
            when "1001" => LG9 <='1';
        end case;
    end process;
end RTL;
