-- Bibliotecas 
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Interface (portos)

entity and2gate is
    port(inPort0 : in std_logic;
	      inPort1 : in std_logic;
			outport : out std_logic);

end and2gate;

-- Implementacao (Descricao da funcionalidade)
architecture Behavioral of AND2Gate is
begin 

   outPort <= inPort0 and inPort1;
	
end Behavioral;	
