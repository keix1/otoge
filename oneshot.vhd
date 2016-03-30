library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity ONESHOT is
  port (
    CLK,SW,RSTN : in  std_logic;
    SWONE  : out std_logic );
end ONESHOT;

architecture RTL of ONESHOT is

--signal DIVCOUNT : std_logic_vector(1 downto 0) :="00"; --For Simulation
signal DIVCOUNT : std_logic_vector(14 downto 0);-- :="000000000000000";
signal ENABLE   : std_logic;
signal SWBEFORE : std_logic;

begin
  process (CLK,RSTN) begin
	if(RSTN = '0') then
		DIVCOUNT <= "000000000000000";
		ENABLE <= '0';
   elsif (CLK'event and CLK = '1') then
		if (DIVCOUNT = "000000000000000") then
--    if (DIVCOUNT = "00") then
          ENABLE <= '1';
      else
          ENABLE <= '0';
		end if;
      DIVCOUNT <= DIVCOUNT + 1;
   end if;
end process;
  process (CLK,RSTN) begin
   if(RSTN = '0') then
		SWONE <= '1';
		SWBEFORE <= '1';
	elsif (CLK'event and CLK = '1') then
        if ENABLE='1' then
            if (SW='0' and SWBEFORE = '1') then
                SWONE <= '0';
            else
                SWONE <= '1';
            end if;
					SWBEFORE <= SW;
        else
				SWONE <= '1';
		end if;
    end if;
  end process;
end RTL;
