library ieee;
use ieee.std_logic_1164.all;
entity LEDDEC is
  port (
    HDATA    : in std_logic_vector(3 downto 0);
    LDATA    : in std_logic_vector(3 downto 0);
    HLEDOUT  : out std_logic_vector(7 downto 0);
    LLEDOUT  : out std_logic_vector(7 downto 0) );
end LEDDEC;
architecture RTL of LEDDEC is
  begin
  process ( HDATA, LDATA ) begin
    case LDATA is
      when "0000" => LLEDOUT <= "11000000";
      when "0001" => LLEDOUT <= "11111001";
      when "0010" => LLEDOUT <= "10100100";
      when "0011" => LLEDOUT <= "10110000";
      when "0100" => LLEDOUT <= "10011001";
      when "0101" => LLEDOUT <= "10010010";
      when "0110" => LLEDOUT <= "10000010";
      when "0111" => LLEDOUT <= "11011000";
      when "1000" => LLEDOUT <= "10000000";
      when "1001" => LLEDOUT <= "10010000";
      when others => LLEDOUT <= "10110110";
    end case;
	 
    case HDATA is
      when "0000" => HLEDOUT <= "11000000";
      when "0001" => HLEDOUT <= "11111001";
      when "0010" => HLEDOUT <= "10100100";
      when "0011" => HLEDOUT <= "10110000";
      when "0100" => HLEDOUT <= "10011001";
      when "0101" => HLEDOUT <= "10010010";
      when "0110" => HLEDOUT <= "10000010";
      when others => HLEDOUT <= "10110110";
    end case;
  end process;
end RTL;
