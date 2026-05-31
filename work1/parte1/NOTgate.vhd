library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NOTgate is 
    port(inPort    : in std_logic;
	      outPort   : out std_logic);
end NOTgate;

architecture Behavioral of NOTgate is
begin 

   outPort <= not inPort;
   
end Behavioral;