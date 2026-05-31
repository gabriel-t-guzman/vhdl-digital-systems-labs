library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ShiftRegister4 is
     port(clock : in std_logic;
	       sin   : in std_logic;
	      dataOut: out std_logic_vector(3 downto 0));
		
end ShiftRegister4;

architecture Behavioral of ShiftRegister4 is

signal s_dataOut : std_logic_vector(3 downto 0);

begin


   process(clock)
	  begin
       if (rising_edge(clock)) then
		     s_dataOut <= s_dataOut(2 downto 0) & sin;
			  dataOut <= s_dataOut;


        end if;
   end process;
end Behavioral;	