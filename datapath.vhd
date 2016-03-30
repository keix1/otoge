library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DATAPATH is
  port (
    CLK     : in std_logic;
    RSTN    : in std_logic;
    PINC    : in std_logic;
    ENABLE  : in std_logic;
    FLASH   : in std_logic;
    LED0    : out std_logic_vector(7 downto 0);
    LED1    : out std_logic_vector(7 downto 0);
    LED2    : out std_logic_vector(7 downto 0);
    LED3    : out std_logic_vector(7 downto 0);
);
end DATAPATH;
architecture RTL of DATAPATH is

begin
	COUNT port map (
		D=>SW, CLK=>ENABLE, Q=>SWREG);

    process (CLK, RSTN) begin

    end process;

end RTL;
