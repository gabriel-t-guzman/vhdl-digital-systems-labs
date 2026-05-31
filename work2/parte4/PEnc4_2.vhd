library IEEE;
USE ieee.std_logic_1164.all;

entity PEnc4_2 is
      port (inputs : in std_logic_vector(3 downto 0);
		     outputs : out std_logic_vector(1 downto 0);
			  validout: out std_logic);
end Penc4_2;

architecture BehavEqua of Penc4_2 is
begin 
    process(inputs)
    begin
        if (inputs = "0000") then
		      validout <= '0';
		  else 
		      validout <= '1';
            if (inputs(3) = '1') then
                outputs <= "11";
                
				elsif (inputs(2) = '1') then 
                outputs <= "10";
               
  	         elsif (inputs(1) = '1') then
                 outputs <= "01";
			
            else
                 outputs <= "00";
             end if;
        end if;
    end process;
end BehavEqua;
 