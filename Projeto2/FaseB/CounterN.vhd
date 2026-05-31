library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CounterM is
     generic(n : positive := 1);
      port(enable : in std_logic;
			  clk : in std_logic;
	        count : out std_logic_vector((n-1) downto 0));
			  
end CounterM;

architecture Behavioral of CounterM is

signal s_count : unsigned((n-1) downto 0) := "000011110100"; --500

begin
     process(clk)
     begin
          if (rising_edge(clk)) then
                if (enable = '1') then  
					     if (s_count = "111110100000") then
						      s_count <= "000011110100";
						  end if;
			           s_count <= s_count + 1;
					 end if;
			     
			 end if;
     end process;
	  count <= std_logic_vector(s_count);
end Behavioral;