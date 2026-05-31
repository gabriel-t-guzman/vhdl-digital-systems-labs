library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ControlUnit is
	port(reset		: in  std_logic; -- flip
		  clk			: in  std_logic; -- flop
		  newTime1	: out std_logic; -- sinal que vai iniciar os timer 2000ms
		  newTime2	: out std_logic; -- pseudo aleatorio
		  timeExp1	: in  std_logic; -- sinal que indica que acabou o timer
		  timeExp2	: in  std_logic;
		  P1 : in std_logic; -- keys 
		  P2 : in std_logic; -- para iniciar e passar de S4 a S1
		  --hex
		  HE0X : out std_logic_vector(3 downto 0);
		  HE1X : out std_logic_vector(3 downto 0);
		  HE2X : out std_logic_vector(3 downto 0);
		  HE3X : out std_logic_vector(3 downto 0);
		  LEGD : out std_logic_vector(6 downto 0));
		  
		 
end ControlUnit;

architecture Behavioral of ControlUnit is
                                                  ---TUDO 32 bits 
--	constant RED_TIME				: std_logic_vector(31 downto 0) := x"0bebc200"; -- 4 s

	type TState is (S0, S1, S2, S3, S4);
	signal s_currentState, s_nextState	: TState := S0;

begin
	sync_proc : process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_currentState <= S0;				
			else
				s_currentState	<= s_nextState;
			end if;
		end if;
	end process;

	comb_proc : process(s_currentState, timeExp1, timeExp2)
	
	begin
	
		case (s_currentState) is
		
		when S0 =>
		   
			HE0X <= (others => '0');
		   HE1X <= "0000";
		   HE2X <= (others => '0');
		   HE3X <= (others => '0');
		   LEGD <= (others => '0');
				 
		   if ((P1 and P2) = '1') then 
			    s_nextState <= S1;
		   end if;
				 
		when S1 => 
		
			HE0X <= (others => '0');
		   HE1X <= "0001";
		   HE2X <= (others => '0');
		   HE3X <= (others => '0');
		   LEGD <= (others => '0');
				 
		
		       newTime1 <= '1';
				 newTime2 <= '0';
		
		       s_nextState <= S2;
			
			
      when S2 => 
		
		       newTime1 <= '0';
				 newTime2 <= '0';
				 
				 HE0X <= "1010";
		       HE1X <= "0010";
		       HE2X <= (others => '0');
		       HE3X <= "1010";
		       LEGD <= (others => '0');
		  
		
		       if (timeExp1 = '1') then --podian ser dois?
				    s_nextState <= S3;
				 end if;

		
		when S3 => 
		
		       newTime1 <= '0';
				 newTime2 <= '1';
				 
				 HE0X <= (others => '0');
		       HE1X <= "0011";
		       HE2X <= (others => '0');
		       HE3X <= (others => '0');
		       LEGD <= (others => '0');
		  
		
		      if (timeExp2 = '1') then
				    s_nextState <= S4;
				end if;
				 
				 
		when S4 =>
		
		       newTime1 <= '0';
				 newTime2 <= '0';
				 
				 HE0X <= (others => '0');
		       HE1X <= "0100";
		       HE2X <= (others => '0');
		       HE3X <= (others => '0');
		       LEGD <= (others => '1');
				 
				 if ((P1 or P2) = '1') then
				    s_nextState <= S1;
				 end if;

					 
		end case;
	end process;
end Behavioral;
