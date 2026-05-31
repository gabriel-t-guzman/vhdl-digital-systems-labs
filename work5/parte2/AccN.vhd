library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AccN is
    generic(n : positive := 4);
    port(dataIn : in std_logic_vector ((n-1) downto 0);
	      enable : in std_logic;
			 reset: in std_logic;
		   clk : in std_logic;
		   dataOut: out std_logic_vector((n-1) downto 0));
	 
end AccN;

architecture Shell of AccN is

signal s_adderOut, s_regOut : std_logic_vector((n-1) downto 0);

begin
   
 
   Adder : entity work.AdderN(Behavioral)
	         generic map(n => n) 
	         port map(operando1 => dataIn,
				         operando2 => s_regOut,
							result => s_adderOut);
						-- ADDERN      AccN
							
	RegisteN : entity work.RegisterN(Behavioral)
	          generic map(n => n)
				   port map(enable => enable,
					         reset => reset,
								clk => clk,
							   dataIn => s_adderOut,
								dataOut => s_regOut);
							   
	dataOut <= s_regOut;
	


end Shell;
