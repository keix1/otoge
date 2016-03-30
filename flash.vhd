library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all; -- for and_reduce()

entity FLASH is
 port (
 CLK : in std_logic; -- global clock
 RSTN : in std_logic; -- global reset
 EN100MSEC : in std_logic; -- enable every 0.1sec(100msec)
 FLASH : in std_logic; -- flash
 ALLON : out std_logic; -- all LED on request
 FLASH_END : out std_logic -- 10 times flash finished
 );
end FLASH;

architecture RTL of FLASH is

 constant TWENTY : std_logic_vector(4 downto 0) := "10100"; -- 14(HEX) = 20(DEC)
 constant ZERO : std_logic_vector(4 downto 0) := "00000";

 signal COUNTER: std_logic_vector(4 downto 0);

begin

 process (CLK, RESET_N) begin
 if (RSTN = '0') then
     COUNTER <= TWENTY;
 elsif (CLK'event and CLK = '1') then
     if (FLASH = '0') then
         COUNTER <= TWENTY;
     elsif (FLASH = '1' and EN100MSEC = '1') then
         COUNTER <= COUNTER - 1;
     end if;
 end if;
 end process;

 ALLON <= COUNTER(0);
--FLASH_END <= COUNTER(0) and COUNTER(1) and COUNTER(2) and COUNTER(3) and COUNTER(4);
 FLASH_END <= and_reduce(COUNTER);
end RTL; 
