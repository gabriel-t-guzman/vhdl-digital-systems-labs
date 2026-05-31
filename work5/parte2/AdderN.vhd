Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AdderN is 
      generic(n : positive := 4 );
      port (operando1 : in std_logic_vector((n-1) downto 0);
	      	operando2 : in std_logic_vector((n-1) downto 0);
		      result : out std_logic_vector((n-1) downto 0));
end AdderN;

architecture Behavioral of AdderN is

signal s_result : unsigned((n-1) downto 0);

begin	


    s_result <= (unsigned(operando1) + unsigned(operando2));
	 result <= std_logic_vector(s_result);

end Behavioral;
