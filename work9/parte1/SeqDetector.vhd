library ieee;
use ieee.std_logic_1164.all;

entity SeqDetector is
    port (CLOCK_50 : in std_logic;
	       SW : in std_logic_vector(1 downto 0);
	       LEDR : out std_logic_vector(0 downto 0);
			 LEDG : out std_logic_vector(0 downto 0));
			 
end entity;

architecture Shell of SeqDetector is

signal s_clk : std_logic;
signal s_sw : std_logic_vector(1 downto 0);

begin 

process (CLOCK_50)
begin
    if (rising_edge (CLOCK_50)) then
	     s_sw <= SW;
	 end if;
end process;

divider : entity work.ClkDividerN(Behavioral)
                  generic map(divFactor => 100000000) -- 0.5H - 2 sec
						  port map(clkIn => CLOCK_50,
						           clkOut => s_clk);


seqdetector : entity work.SeqDetFSM(Behavioral)
                    port map(reset => s_sw(1),
						           input => s_sw(0),
									  clk => s_clk,
									  output => LEDR(0));

LEDG(0) <= s_clk;


end Shell;