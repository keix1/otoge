library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity POINTER is
  port (
    CLK     : in std_logic;
    RSTN    : in std_logic;
    PINC    : in std_logic;
    KYOKU   : in std_logic_vector(2 downto 0);
);

end POINTER;
architecture RTL of POINTER is

begin
    process (CLK, RSTN) begin

    end process;

end RTL;

