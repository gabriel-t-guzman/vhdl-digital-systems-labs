library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RegisterN is
     generic(n : positive := 4); -- este n importa, depois e colocado sdas dsa  no IAGRAMA
     port(clk : in std_logic;
	       reset : in std_logic;
	       enable : in std_logic;
	       dataIn : in std_logic_vector((n-1) downto 0);
			 dataOut : out std_logic_vector((n-1) downto 0));
			
end RegisterN;

architecture Behavioral of RegisterN is

begin

    process(clk, dataIn)
    begin       
       if (rising_edge(clk)) then -- SINCRONO
		 
		     if(reset = '1') then
		          dataOut <= (others => '0');  

		     elsif (enable = '1') then
     			     dataOut <= dataIn;
			  end if;
           
	    end if;
	end process;
end Behavioral;
