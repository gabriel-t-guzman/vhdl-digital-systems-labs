library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Projeto1_Demo is
   generic (n : positive := 50_000_000); -- n 
    port(CLOCK_50 : in std_logic;
	      SW : in std_logic_vector(2 downto 0);
	      LEDR: out std_logic_vector(17 downto 0);
			LEDG: out std_logic_vector(7 downto 0);
			HEX1: out std_logic_vector(6 downto 0));
end Projeto1_Demo;

architecture Shell of Projeto1_Demo is

signal s_enable : std_logic_vector(7 downto 0);
signal pulso_1Hertz, pulso_4Hertz, pulso_8Hertz, pulso_c : std_logic;
signal s_sw : std_logic_vector(2 downto 0);
signal s0_ledg, s1_ledg, s2_ledg, s3_ledg, s4_ledg, s_ledg : std_logic_vector(7 downto 0); 
signal s0_ledr, s1_ledr, s2_ledr, s3_ledr, s4_ledr, s_ledr : std_logic_vector(17 downto 0);


-- PARTE SINCRONIZADORA
begin
   process(CLOCK_50)
    begin
	     if (rising_edge (CLOCK_50)) then
          s_sw <= SW(2 downto 0);
		  end if;          			
	end process;
	
-- DECODER

deco : entity work.Decoder_demo(Behavioral)
                    port map(input => s_sw(2 downto 0),
						           output => s_enable(7 downto 0));	
	
	

-- GERADOR DE PULSO

pulse_gen : entity work.pulse_gen(Behavioral)
                  port map(clk => CLOCK_50,
						         pulse_1 => pulso_1Hertz,
									pulse_2 => pulso_4Hertz,
									pulse_3 => pulso_8Hertz,
									pulse_4 => pulso_c);
-- MUX 4:1 (LEDR)

mux_1 : entity work.Mux4_D(Behavioral)
                 generic map(n => 18)
                 port map(sel => s_sw(2 downto 0),
					           input0 => s0_ledr(17 downto 0),
								  input1 => s1_ledr(17 downto 0),
								  input2 => s2_ledr(17 downto 0),
								  input3 => s3_ledr(17 downto 0),
								  input4 => s4_ledr(17 downto 0),
					           output => s_ledr(17 downto 0));
								  
-- MUX 4 : 1 (LEDG)
								  
mux_2 : entity work.Mux4_D(Behavioral)
                 generic map(n => 8)
                 port map(sel => s_sw(2 downto 0),
					           input0 => s0_ledg(7 downto 0),
								  input1 => s1_ledg(7 downto 0),
								  input2 => s2_ledg(7 downto 0),
								  input3 => s3_ledg(7 downto 0),
								  input4 => s4_ledg(7 downto 0),
					           output => s_ledg(7 downto 0));
						-- ta		  
programa_1 : entity work.Programa_1(Behavioral)
						port map(clock => CLOCK_50,
							     enable => s_enable(1),
								  output1 => s0_ledr(17 downto 0),
								  output2 => s0_ledg(7 downto 0));

programa_2 : entity work.Programa_2(Behavioral)
						port map(clock => CLOCK_50,
							     enable => s_enable(2),
								  pulso => pulso_1Hertz,
								  output1 => s1_ledr(17 downto 0),
								  output2 => s1_ledg(7 downto 0));

programa_3 : entity work.Programa_3(Behavioral)
						port map(clock => CLOCK_50,
							     enable => s_enable(3),
								  pulso => pulso_8Hertz,
								  output1 => s2_ledr(17 downto 0),
								  output2 => s2_ledg(7 downto 0));
								  
programa_4 : entity work.Programa_4(Behavioral)
						port map(clock => CLOCK_50,
							     enable => s_enable(4),
								  pulso => pulso_4Hertz,
								  output1 => s3_ledr(17 downto 0),
								  output2 => s3_ledg(7 downto 0));


programa_5 : entity work.Programa_5(Behavioral)
						port map(clock => CLOCK_50,
									enable => s_enable(5),
									pulso1H => pulso_1Hertz,
									pulso8H => pulso_8Hertz,
									pulso4secs => pulso_c,
									output1 => s4_ledr,
									output2 => s4_ledg);
									
									
display : entity work.Bin7SegDecoder(Behavioral)
						port map(enable => '1',
									binInput => ('0' & s_sw(2 downto 0)),
									decOut_n => HEX1(6 downto 0));

LEDR <= s_ledr(17 downto 0);
LEDG <= s_ledg(7 downto 0);

end Shell;