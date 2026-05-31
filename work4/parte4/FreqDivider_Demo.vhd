library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FreqDivider_Demo is
        port (CLOCK_50 : in std_logic; 
		        SW : in std_logic_vector (2 downto 0);
				  LEDR : out std_logic_vector(0 downto 0);
				  HEX0 : out std_logic_vector(6 downto 0));
		        		
end FreqDivider_Demo;

architecture Shell of FreqDivider_demo is

signal s_k : std_logic_vector(31 downto 0);
signal s_clkOut : std_logic;
signal s_count : std_logic_vector(3 downto 0);

begin
 
    s_k <= x"02FAF080"; --50*10^6 em hexa
	 core : entity work.FreqDivider(Behavioral)
	                    port map(clkIn => CLOCK_50,
							           clkOut=> s_clkOut,
										   k => s_k);
	 LEDR(0) <= s_clkOut;
	 
	 counter : entity work.CounterUpDown4(Behavioral)
	                     port map(clk => s_clkOut,
								         reset => SW(0), -- SW(0)
											upDown => SW(1),  -- SW(1)
											count => s_count);
											
	 seg7decoder : entity work.Bin7SegDecoder(Behavioral)
                       port map(enable => SW(2), -- SW(2)
							           binInput => s_count,
										  decOut_n => HEX0(6 downto 0)); 	 
	 

end Shell;