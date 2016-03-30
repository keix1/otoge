library ieee;
use ieee.std_logic_1164.all;

entity OTOGE is
    port(
        CLK     :in std_logic;
        RSTN    :in std_logic;
        SW      :in std_logic;
        LEDH    :out std_logic_vector(7 downto 0);
        LEDL    :out std_logic_vector(7 downto 0)
  );
end OTOGE;

architecture RTL of OTOGE is
    component CLKDOWN
        port (
            CLK : in std_logic;
            RSTN : in std_logic;
            ENABLE : out std_logic );
    end component;

    component COUNT
        port (
            CLK : in std_logic;
            RSTN : in std_logic;
           -- ENABLE : in std_logic;
            HCOUNT : out std_logic_vector(3 downto 0);
            LCOUNT : out std_logic_vector(3 downto 0);
            SW: in std_logic );
    end component;

    component LEDDEC
        port (
            HDATA : in std_logic_vector(3 downto 0);
            LDATA : in std_logic_vector(3 downto 0);
            HLEDOUT : out std_logic_vector(7 downto 0);
            LLEDOUT : out std_logic_vector(7 downto 0) );
    end component;

    component ONESHOT port (
        CLK, SW, RSTN : in std_logic;
        SWONE : out std_logic );
    end component;
	 
    component DFFZ port (
		D,CLK,RS: in std_logic;
		Q: out std_logic
	 );
    end component;
	 
    signal HCOUNT : std_logic_vector(3 downto 0);
    signal LCOUNT : std_logic_vector(3 downto 0);
    signal TENABLE : std_logic; --ENABLEというようりはCLOCKDOWNしたやつ
    signal SWONE : std_logic;
    signal WQ : std_logic;

begin
    U1 : LEDDEC port map (
         HDATA=>HCOUNT, LDATA=>LCOUNT, HLEDOUT=>LEDH, LLEDOUT=>LEDL);
    U2 : CLKDOWN port map (
         CLK=>CLK, RSTN=>RSTN, ENABLE=>TENABLE);
    U3 : COUNT port map (
         CLK=>TENABLE, RSTN=>RSTN,  HCOUNT=>HCOUNT, LCOUNT=>LCOUNT, --ENABLE=>TENABLE
         SW=>WQ );
    U4 : ONESHOT port map (
			CLK=>CLK, SW=>SW, SWONE=>SWONE, RSTN=>RSTN);
	U5 : DFFZ port map(
			CLK=>CLK, D=>SWONE, Q=>WQ,RS=>RSTN);
end RTL;
