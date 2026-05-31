library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Programa_3 is
port(clock : in std_logic;
	  enable : in std_logic;
	  pulso : in std_logic;
	  output1 : out std_logic_vector(17 downto 0);
	  output2 : out std_logic_vector(7 downto 0));
end Programa_3;

architecture Behavioral of Programa_3 is

begin 
   process (clock,enable)
	    begin 
		    if (rising_edge(clock)) then
			     if (enable = '1') then
						 output1 <= (others => '0');
						 if (pulso = '1') then 
							  output2 <= (others => '1');
						 else  
						     output2 <= (others => '0');
						 end if;
				   end if;
			 end if;
	end process;
end Behavioral;	