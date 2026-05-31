library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux2_1 is
    port (selects : in std_logic;
	       inputs : in std_logic_vector(1 downto 0);
			 output : out std_logic);
end Mux2_1;

architecture Behavioral of Mux2_1 is 
begin 
    process(selects, inputs)
	 begin 
	    if (selects = '0') then 
		     output <= inputs(0);
	     else 
		     output <= inputs(1);
		  end if;
	  end process;
end Behavioral;

		 