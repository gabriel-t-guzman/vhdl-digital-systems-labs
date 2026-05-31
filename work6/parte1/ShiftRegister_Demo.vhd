library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ShiftRegister_Demo is
      generic (size : positive := 8);
      port (CLOCK_50 : in std_logic;
		      SW       : in std_logic_vector(0 downto 0);
				LEDR     : out std_logic_vector((size - 1) downto 0));

end ShiftRegister_Demo;

architecture Shell of ShiftRegister_Demo is

signal s_1hertz : std_logic;
signal Hertz50 : std_logic_vector(31 downto 0);

begin 
    Hertz50 <= x"02FAF080";

    divider : entity work.FreqDivider(Behavioral)
	                  port map(clkIn  => CLOCK_50,
							         k => Hertz50,
							         clkOut =>s_1hertz);
	
	 shift : entity work.ShiftRegisterN(Behavioral)
	             generic map(size => size)
						 port map(clock => s_1hertz,
						            sin => SW(0),
								  dataOut => LEDR((size -1 ) downto 0));
end Shell;