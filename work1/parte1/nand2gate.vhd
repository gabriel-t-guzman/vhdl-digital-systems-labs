library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nand2gate is 
    port(inPort0  : in std_logic;
	      inPort1  : in std_logic;
			outPort  : out std_logic);
end nand2gate;

architecture Structural of nand2gate is
 
     signal s_andout : std_logic; -- sinal intermedia
 
begin 
    and_gate : entity work.AND2Gate(Behavioral)
	                   port map(inPort0 => inPort0,
							          inPort1 => inPort1,
							          outPort => s_andout);
					
	 not_gate : entity work.NOTgate(Behavioral)
	                     port map (inPort => s_andout,
								          outPort => outPort);
										 
end Structural;