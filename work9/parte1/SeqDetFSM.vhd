library ieee;
use ieee.std_logic_1164.all;

entity SeqDetFSM is
port (reset : in std_logic;
      input : in std_logic;
		clk : in std_logic;
		output : out std_logic);
		
end SeqDetFSM;

architecture Behavioral of SeqDetFSM is

type state is (E0, E1, E2, E3);
signal PS, NS : state;

begin 
    sync_process : process(clk)
	 begin 
	   if (rising_edge(clk)) then
	        if (reset = '1') then
			      PS <= E0;
			  else 
			      PS <= NS;
			  end if;
	   end if; 
	 end process;

	 comb_proc : process(PS, input)
begin

    output <= '0';
	 case PS is
	 
	 when E0 => 
	      if (input = '1') then
			    NS <= E1;
			else 
			    NS <= E0;
			end if;
			
	 when E1 => 
	      if (input = '1') then
			    NS <= E1;
			else 
			    NS <= E2;
			end if;
			
	 when E2 => 
	      if (input = '1') then
			    NS <= E1;
			else 
			    NS <= E3;
			end if;
			
	 when E3 => 
	      if (input = '1') then
			    NS <= E1;
				 output <= '1';
			else 
			    NS <= E0;
			end if;	
			
	 when others => 
	         NS <= E0;
	 end case;
  end process;
end Behavioral;
			    
	