library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity pulse_gen is
   generic(P1_max : positive := 50_000_000;
	        p2_max : positive := 12_500_000;
			  p3_max : positive := 6_250_000;
			  p4_max : positive := 200_000_000);
	      port( clk :  in STD_LOGIC;
			     pulse_4 : out Std_logic;
				  pulse_1 : out STD_LOGIC;
				  pulse_2 : out std_logic;
				  pulse_3 : out std_logic);
end pulse_gen;


architecture Behavioral of pulse_gen is

signal s4_cnt : natural range 0 to p4_max - 1;
signal s1_cnt : natural range 0 to p1_max - 1;
signal s2_cnt : natural range 0 to p2_max - 1;
signal s3_cnt : natural range 0 to p3_max - 1;

begin
   process (clk, s2_cnt, s1_cnt, s3_cnt, s4_cnt)
       begin
		    if (rising_edge(clk)) then
			   -- pulso longo 4 secs
             if (s4_cnt >= (p4_max) - 1) then
				    s4_cnt <= 0; 
			    else 
				    s4_cnt <= s4_cnt + 1; 		 

             end if;
				
				  
             --- puslo longo 1H
				 if (s1_cnt >= (p1_max) - 1) then
				    s1_cnt <= 0; 
			    else 
				    s1_cnt <= s1_cnt + 1; 		 

             end if;
				 --- puslo longo 4h
				 if (s2_cnt >= (p2_max) - 1) then
				    s2_cnt <= 0; 
			    else 
				    s2_cnt <= s2_cnt + 1; 		 

             end if;
				  
				  --- puslo longo 8h
				 if (s3_cnt >= (p3_max) - 1) then
				    s3_cnt <= 0; 
			    else 
				    s3_cnt <= s3_cnt + 1; 		 

             end if;
			 end if;
		end process;
		pulse_1 <= '1' when s1_cnt >= (p1_max/2) else '0';
      pulse_2 <= '1' when s2_cnt >= (p2_max/2) else '0';
      pulse_3 <= '1' when s3_cnt >= (p3_max/2) else '0';
      pulse_4 <= '1' when s4_cnt >= (p4_max/2) else '0';
		
end Behavioral;























