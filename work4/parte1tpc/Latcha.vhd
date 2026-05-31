library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Latcha is
     port(R : in std_logic;
	       S : in std_logic;
			 Q : out std_logic;
			Q_N: out std_logic);
end Latcha;


architecture Behavioral of Latcha is

signal s_r, s_s : std_logic;

begin
    
	 s_r <= (R nor s_s);
	 s_s <= (S nor s_r);

    Q_N <= s_s;
    
    Q <= s_r;

end Behavioral;