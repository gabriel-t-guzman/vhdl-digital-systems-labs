library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ALU4 is
     port(a, b : in std_logic_vector(3 downto 0);
	       op : in std_logic_vector(2 downto 0);
			 r, m : out std_logic_vector(3 downto 0));
end ALU4;

architecture Behavioral of ALU4 is

  signal s_a, s_b, s_r : unsigned(3 downto 0);
  signal s_m : unsigned(7 downto 0);

begin
   s_a <= unsigned(a);
	s_b <= unsigned(b);
	s_m <= s_a * s_b;
	

	-- with op select <- o que e' aquilo
	process (s_a, s_b, s_m, op)
	begin
	    case op is
	        when "000" =>
			       s_r <= s_a + s_b; --0
			  when "001" =>
			       s_r <= s_a - s_b;  --1
		     when "010" =>
			       s_r <= (s_m(3 downto 0)); --2
			  when "011" =>
			       s_r <= s_a / s_b;  --3
		     when "100" =>
			       s_r <= s_a rem s_b; --4
			  when "101" =>
			       s_r <= s_a and s_b;  --5
		     when "110" =>
			       s_r <= s_a or s_b; --6
			  when others =>
			       s_r <= s_a xor s_b;  --7
		  
			end case;
		end process;
	r <= std_logic_vector(s_r);
	m <= std_logic_vector(s_m(7 downto 4)) when (op = "010") else (others => '0');
end Behavioral;