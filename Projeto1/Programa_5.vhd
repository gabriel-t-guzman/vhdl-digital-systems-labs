library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Programa_5 is
port(clock : in std_logic;
	  enable : in std_logic;
	  pulso1H : in std_logic;
	  pulso8H : in std_logic;
	  pulso4secs : in std_logic;
	  output1 : out std_logic_vector(17 downto 0);
	  output2 : out std_logic_vector(7 downto 0));
end Programa_5;

architecture Behavioral of Programa_5 is

signal cnt : unsigned(2 downto 0);
signal s_switch : std_logic;

begin 
   process (clock,enable)
	    begin 
		    if (rising_edge(clock)) then
			     if (enable = '1') then
				  
				        if (pulso4secs = '1') then
						 -- PISCAM OS DOIS 8H
						    if (pulso8H = '1') then
							     output1 <= (others => '1');
									output2 <= (others => '1');
						    else  
							     output1 <= (others => '0');
							     output2 <= (others => '0');
						    end if;
						  else -- PISCAM OS DOIS 1H
							 if (pulso1H = '1') then
							     output1 <= (others => '1');
							     output2 <= (others => '1');
						    else  
							     output1 <= (others => '0');
							     output2 <= (others => '0'); 
							 end if; 
                   end if; 
              end if;
			 end if;
	end process;
	
end Behavioral;