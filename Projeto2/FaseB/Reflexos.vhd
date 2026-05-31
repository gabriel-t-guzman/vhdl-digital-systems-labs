library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Reflexos is
port(CLOCK_50 : in std_logic; 
	  KEY : in std_logic_vector(3 downto 0);
	  LEDG : out std_logic_vector(6 downto 0);
	  HEX0 : out std_logic_vector(6 downto 0);
	  HEX1 : out std_logic_vector(6 downto 0);
	  HEX2 : out std_logic_vector(6 downto 0);
	  HEX3 : out std_logic_vector(6 downto 0);
	  HEX4 : out std_logic_vector(6 downto 0);
	  HEX5 : out std_logic_vector(6 downto 0);
	  HEX6 : out std_logic_vector(6 downto 0);
	  HEX7 : out std_logic_vector(6 downto 0));
end Reflexos;


architecture Shell of Reflexos is


signal s_1Mhertz, s_reset, s_TimeExp1, s_TimeExp2, s_newTime1, s_newTime2 : std_logic;
signal s_hex7,s_hex6,s_hex5,s_hex4, s_hex3, s_hex2, s_hex1, s_hex0  : std_logic_vector(3 downto 0);
signal s_free_run, s_timeval2 : std_logic_vector(11 downto 0);
signal s_ledg : std_logic_vector(6 downto 0);
begin

-- reset
s_reset <= ((not KEY(1)) and (not KEY(2))); 

divider : entity work.ClkDividerN(Behavioral)
             generic map (divFactor => 50)
				 port map(clkIn => CLOCK_50,
				          clkOut => s_1Mhertz);
							 
counterA : entity work.CounterUpN(Behavioral)
             generic map(n => 7)
				 port map(enable => '0',
				          clk => s_1Mhertz,
							 reset => s_reset,
							 count1 =>s_hex6,
							 count2 =>s_hex7 );
							 
							 
counterB : entity work.CounterUpN(Behavioral)
             generic map(n => 7)
				 port map(enable => '0',
				          clk => s_1Mhertz,
							 reset => s_reset,
							 count1 =>s_hex4, 
							 count2 =>s_hex5 );
							 
displayA1 : entity work.Bin7SegDecoder(Behavioral)
			  port map(enable => '0',
			           binInput =>s_hex7,
						  decOut_n => HEX7);
						  
displayA2 : entity work.Bin7SegDecoder(Behavioral)
			  port map(enable => '0',
			           binInput =>s_hex6,
						  decOut_n => HEX6);
						  
displayB1 : entity work.Bin7SegDecoder(Behavioral)
			  port map(enable => '0',
			           binInput =>s_hex5,
						  decOut_n => HEX5);
						  
displayB2 : entity work.Bin7SegDecoder(Behavioral)
			  port map(enable => '0',
			           binInput =>s_hex4,
						  decOut_n => HEX4);
--2000 "11111010000" --felipe fez bem, acho q nao errou
Timer1 : entity work.TimerAuxFSM(Behavioral)
                 generic map (k => 12)
					  port map(clk => s_1Mhertz,
					           newTime => s_newTime1, -- in da maquina d eestados
								  timeVal => "011111010000",
								  timeExp => s_TimeExp1, -- out para a maquina de estados
								  reset => s_reset);
								  
Timer2 : entity work.TimerAuxFSM(Behavioral)
                 generic map (k => 12)
					  port map(clk => s_1Mhertz,
					           newTime => s_newTime2,
								  timeVal => s_timeval2,
								  timeExp => s_TimeExp2,
								  reset => s_reset);
								  
Free_run : entity work.CounterM(Behavioral)
                 generic map(n => 12)
					  port map(enable => '1',
					           clk => s_1Mhertz,
								  count => s_free_run);
								  
Reg :   entity work.RegN(Behavioral)
        generic map(size => 12)
		  port map(asyncReset => s_reset,
					  clk => s_1Mhertz,
					  enable => '1',
					  syncReset => s_reset,
					  dataIn => s_free_run,
					  dataOut => s_timeval2);
					  
fsm : entity work.ControlUnit(Behavioral)
        port map(reset		=> s_reset,
		           clk			=> s_1Mhertz,
		           newTime1	=> s_newTime1,
		           newTime2	=> s_newTime2,
		           timeExp1	=> s_TimeExp1,
					  timeExp2	=> s_TimeExp2,
		           P1 => (not KEY(3)),
		           P2 => (not KEY(0)),
		      	  HE0X => s_hex0,
		           HE1X => s_hex1,
		           HE2X => s_hex2,
		           HE3X => s_hex3,
		           LEGD => s_ledg);
					  
display0 : entity work.Bin7SegDecoder(Behavioral)
			  port map(enable => '0',
			           binInput =>s_hex0,
						  decOut_n => HEX0);
					  
display1 : entity work.Bin7SegDecoder(Behavioral)
			  port map(enable => '0',
			           binInput =>s_hex1,
						  decOut_n => HEX1);

display2 : entity work.Bin7SegDecoder(Behavioral)
			  port map(enable => '0',
			           binInput =>s_hex2,
						  decOut_n => HEX2);
						  
display3 : entity work.Bin7SegDecoder(Behavioral)
			  port map(enable => '0',
			           binInput =>s_hex3,
						  decOut_n => HEX3);
		  
					  
LEDG <= s_ledg;
								  
end Shell;