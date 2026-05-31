Library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DrinksFSM is
     port (reset : in std_logic;
	        clk : in std_logic;
			  enable : in std_logic;
	        v : in std_logic;
			  c : in std_logic;
			  abrir : out std_logic);
end DrinksFSM;


architecture Behavioral of DrinksFSM is

Type Tstate is (E0, E1, E2, E3, E4, E5);
signal Pstate, Nstate : Tstate;

begin 

sync_proc : process(clk)
begin
if (rising_edge(clk)) then
   if (enable = '1') then --
     	if (reset = '1') then
	       Pstate <= E0;
	   else 
	       Pstate <= Nstate;
	   end if;
	end if;
end if;
end process;

comb_proc : process(PState, v, c)

begin 


case (Pstate) is



when E0 => 
     abrir <= '0';
     if (v = '1') then
	      Nstate <= E1;
		elsif (c = '1') then
		   Nstate <= E3;
		else 
		   Nstate <= E0;
		end if;
			
when E1 => 
        abrir <= '0';
     if (v = '1') then
	      Nstate <= E2;
	  elsif (c = '1') then
	      Nstate <= E4;
	  else 
		   Nstate <= E1;
	  end if;
	  
when E2 => 
     abrir <= '0';
     if (v = '1') then
	      Nstate <= E3;
	  elsif (c = '1') then
	      Nstate <= E5;
	  else 
		   Nstate <= E2;
	  end if;
	  
when E3 => 
          abrir <= '0';

	  if (v = '1') then
	      Nstate <= E4;
	  elsif (c = '1') then
	      Nstate <= E5;
	  else 
		   Nstate <= E3;
	  end if;
	  
when E4 => 
          abrir <= '0';

     if (v = '1' or c = '1') then
	      Nstate <= E5;
	  else 
		   Nstate <= E4;						
	  end if;
			
when E5 => 
     abrir <= '1';
	  Nstate <= E0;  		
	  
end case;
end process;
end Behavioral;