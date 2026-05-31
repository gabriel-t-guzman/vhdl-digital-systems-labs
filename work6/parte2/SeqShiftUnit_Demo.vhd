Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SeqShiftUnit_Demo is
    port (CLOCK_50 : in std_logic;
          SW : in std_logic_vector(13 downto 0);	    
		    LEDR : out std_Logic_vector(7 downto 0));
end SeqShiftUnit_Demo;

architecture Shell of SeqShiftUnit_Demo is

signal s_clock : std_logic;

begin 


     divider : entity work.ClkDividerN(Behavioral)
	            generic map(DivFactor => 50_000_000)
					 port map(clkIn => CLOCK_50,
					          clkOut => s_clock);
  
     Shifter : entity work.SeqShiftUnit(Behavioral)
	             port map(clk => s_clock,
							 dataIn => SW(7 downto 0),
                      siLeft => SW(8),
		               siRight => SW(9),
		                loadEn => SW(10),
		                rotate => SW(11),
		               dirLeft => SW(12),
		               shArith => SW(13),
		               dataOut => LEDR(7 downto 0));
							
end Shell;