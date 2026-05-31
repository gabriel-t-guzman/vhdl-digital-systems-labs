Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_1P_Demo is
port (CLOCK_50 : in std_logic;
      SW : in std_logic_vector(11 downto 0);
		KEY : in std_logic_vector(0 downto 0);
		LEDR : out std_logic_vector(7 downto 0));

end RAM_1P_Demo;

architecture Shell of RAM_1P_Demo is

signal s_1hClk : std_logic;
signal s_key : std_logic := not(KEY(0));

begin

RAM_prova : entity work.RAM_1P_16_8(Behavioral)
               port map(writeClk => CLOCK_50,
					         writeEnable => s_key,
								writeData => SW(11 downto 4),
								address => SW(3 downto 0),
								readData => LEDR(7 downto 0));
							
end Shell;