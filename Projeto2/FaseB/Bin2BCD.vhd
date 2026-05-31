library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Bin2BCD is
    port(Input : in std_logic_vector(7 downto 0);
	      decimalOut : out std_logic_vector(11 downto 0));
end Bin2BCD;

architecture Behavioral of Bin2BCD is

signal input_u : unsigned(7 downto 0);
signal input_result,input_result2 : unsigned(7 downto 0);
signal input_u_mod : unsigned(3 downto 0);

begin
    input_u <= unsigned(Input);
    input_result <= (input_u/"1010");
	 input_u_mod <= (input_u mod "1010");
    input_result2 <= (input_result/"1010");
	 

      --8 bits unsigned
    process (input_u, Input)
	 begin
	 if (Input < "01100110") then
	       
	       decimalOut <= "0000" & (std_logic_vector(input_result(3 downto 0))) & (std_logic_vector(input_u_mod));
	 else
 	       decimalOut <= (std_logic_vector(input_result2(3 downto 0))) & (std_logic_vector((input_result mod "1010"))(3 downto 0)) & (std_logic_vector(input_u_mod));
			 end if;
		end process;
	 
end Behavioral;
