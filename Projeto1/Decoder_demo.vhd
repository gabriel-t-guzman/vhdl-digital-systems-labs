library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- DECODER
entity Decoder_demo is
generic (n : positive := 8);
port(input : in std_logic_vector(2 downto 0);
	  output : out std_logic_vector((n-1) downto 0));
end Decoder_demo;

architecture Behavioral of Decoder_demo is

begin 
   with input select--76543210
	    output <= "00000001" when "000",
		           "00000010" when "001",
					  "00000100" when "010",
					  "00001000" when "011",
					  "00010000" when "100",
		           "00100000" when "101",
					  "01000000" when "110",
					  "10000000" when "111",
					  (others => '0') when others;
					  
					 
	
end Behavioral;