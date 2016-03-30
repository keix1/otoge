library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CONTROLL is
    port (
             CLK   : in std_logic;
             RSTN  : in std_logic;
             SW    : in std_logic;
             ENABLE: in std_logic;
             HCOUNT : out std_logic_vector(3 downto 0);
             LCOUNT : out std_logic_vector(3 downto 0)
         );
end CONTROLL;

architecture RTL of CONTROLL is
    signal REGH : std_logic_vector(3 downto 0);
    signal REGL : std_logic_vector(3 downto 0);
begin
    --	U1: DFF port map (
    --		D=>SW, CLK=>ENABLE, Q=>SWREG);

    process (CLK, RSTN) begin
        if (RSTN = '0') then
            REGL <= "0000";
            REGH <= "0000";
        elsif (CLK'event and CLK = '1' ) then
            if(SW = '0') then
                if (REGL = "1001") then
                    REGL <= "0000";
                    if(REGH = "0101") then
                        REGH <= "0000";
                    else
                        REGH <= REGH + 1;
                    end if;
                else
                    REGL <= REGL + 1;
                end if;
            end if;
        end if;
    end process;

    LCOUNT <= REGL;
    HCOUNT <= REGH;

end RTL;

