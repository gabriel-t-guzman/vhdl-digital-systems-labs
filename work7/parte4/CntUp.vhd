Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CntUp is
      port(clk : in std_logic;
		   reset : in std_logic;
			enabe : in std_logic;
			cntVal : out std_logic_vector(29 downto 0));
end CntUp;

architecture Behavioral of CntUp is 

      signal s_cntVal : unsigned(20 downto 0)