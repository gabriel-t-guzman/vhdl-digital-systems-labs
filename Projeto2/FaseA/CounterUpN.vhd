library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CounterUpN is
     generic(n : positive := 1);
      port(enable : in std_logic;
		     reset : in std_logic;
			  clk : in std_logic;
	        count1 : out std_logic_vector(3 downto 0);
			  count2 : out std_logic_vector(3 downto 0));
end CounterUpN;

architecture Behavioral of CounterUpN is

signal s_count : unsigned((n-1) downto 0) := (others => '0');
signal s_result, s_mod : unsigned (6 downto 0);

begin
     process(clk)
     begin
          if (rising_edge(clk)) then
			     if (reset = '1') then
				     s_count <= (others => '0');
				  else
                if (enable = '1') then  
					     if (s_count = to_unsigned(99,7)) then
			               s_count <= (others => '0');
						  else 
						      s_count <= s_count + 1;
						  end if;
					  end if;
			     end if;
			 end if;
     end process;
	  --TRANFORMAR SAIDA
	  s_result <= (s_count/"1010");
	  s_mod <= (s_count mod 10);
	  
	  
	  count2 <= std_logic_vector(s_result(3 downto 0));
	  count1 <= std_logic_vector(s_mod(3 downto 0));
end Behavioral;