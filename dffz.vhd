library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DFFZ is
  port (
    D,CLK, RS: in std_logic;
	 Q: out std_logic
	 );
end DFFZ;
architecture RTL of DFFZ is

	signal W0 : std_logic;
					
begin

	process(CLK,RS) begin
		if(RS = '0') then
			W0 <='1';
		elsif ( CLK'event and CLK = '1') then
			if(D = '0') then
				if(W0 = '1') then
					W0 <= '0';
				elsif( W0 = '0') then
					W0 <= '1';
				end if;
			end if;
		end if;
		
	Q <= W0;
	end process;
end RTL;