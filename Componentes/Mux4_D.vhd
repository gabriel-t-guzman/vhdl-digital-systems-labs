library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- MUX 8:1
entity Mux4_D is
generic (n : positive := 4);
port(sel : in std_logic_vector(2 downto 0);
     input0 : in std_logic_vector((n-1) downto 0);
     input1 : in std_logic_vector((n-1) downto 0);
	  input2 : in std_logic_vector((n-1) downto 0);
	  input3 : in std_logic_vector((n-1) downto 0);
	  input4 : in std_logic_vector((n-1) downto 0);
	  output : out std_logic_vector((n-1) downto 0));
end Mux4_D;

architecture Behavioral of Mux4_D is

begin 
   with sel select
		  output <= input0 when "001",
		            input1 when "010",
					   input2 when "011",
					   input3 when "100",
					   input4 when "101",
					   (others => '0') when others;
	
end Behavioral;