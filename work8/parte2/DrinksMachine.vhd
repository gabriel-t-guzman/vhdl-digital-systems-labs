library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DrinksMachine is
    port (CLOCK_50 : in std_logic;
	       KEY0 : in std_logic;
	       SW : in std_logic_vector(1 downto 0);
			 LEDG : OUT std_logic_vector(0 downto 0));
end DrinksMachine;

Architecture Shell of DrinksMachine is	

signal clk_s : std_logic; -- n preciso
signal reset_s : std_logic;
signal s_enable : std_logic; -- novo

begin 
   
	 reset_s <= not(KEY0); 
    
	 -- UM PULSO GENERATOR -- porem tenha nome de divider
	 divider : entity work.ClkDividerN(Behavioral)
	             generic map(MAX => 50000000)
					    port map(clk => CLOCK_50,
						          reset => reset_s,
									 pulse => s_enable); -- enable de 1 sec
									 
	 drink_mind : entity work.DrinksFSM(Behavioral)
	                 port map(reset => reset_s,
						           v => SW(0),
						           c => SW(1),
									  clk => CLOCK_50, -- mudou
									  enable => s_enable,
									  abrir => LEDG(0));
end Shell;