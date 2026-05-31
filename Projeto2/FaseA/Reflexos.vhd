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


signal s_1mhertz, s_reset : std_logic;
signal s_hex7,s_hex6,s_hex5,s_hex4 : std_logic_vector(3 downto 0);
signal s_keyA, s_keyB : std_logic;
begin

-- reset
s_reset <= ((not KEY(1)) and (not KEY(2))); 

divider : entity work.ClkDividerN(Behavioral)
             generic map (divFactor => 50)
				 port map(clkIn => CLOCK_50,
				          clkOut => s_1mhertz);
							 
debouncerA : entity work.DebounceUnit(Behavioral)
            generic map(kHzClkFreq => 1000,
			               mSecMinInWidth => 100,
			               inPolarity =>  '0',
			               outPolarity => '1')
				port map(refClk => s_1mhertz,
						   dirtyIn => (not KEY(3)),
							pulsedOut => s_keyA );
							
debouncerB : entity work.DebounceUnit(Behavioral)
            generic map(kHzClkFreq => 1_000,
			               mSecMinInWidth => 100,
			               inPolarity =>  '0',
			               outPolarity => '1')
				port map(refClk =>s_1mhertz,
						   dirtyIn => (not KEY(0)),
							pulsedOut => s_keyB );
							 
							 
							 
counterA : entity work.CounterUpN(Behavioral)
             generic map(n => 7)
				 port map(enable => s_keyA,
				          clk => s_1mhertz,
							 reset => s_reset,
							 count1 =>s_hex6,
							 count2 =>s_hex7 );
							 
							 
counterB : entity work.CounterUpN(Behavioral)
             generic map(n => 7)
				 port map(enable => s_keyB,
				          clk => s_1mhertz,
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

end Shell;