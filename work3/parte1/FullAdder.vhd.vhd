Library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is 
      generic(n : positive);
      port (a, b, cin : in std_logic_vector(n-1 downto 0);
		      cout, s : out std_logic_vector(n-1 downto 0));
end FullAdder;

architecture Behavioral of FullAdder is
begin	
    s <= ((b xor a) xor cin);
	 cout <= (a and cin) or (b and cin) or (a and b); 
end Behavioral;
