Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_2P_16_8 is
generic (nAddres : positive := 4; -- Capacidade de selecionar na rom
         nData : positive := 8); -- Tamanho dos bits do array
port (writeClk : in std_logic; 
      writeAddres : in std_logic_vector((nAddres - 1) downto 0);
      readAddres : in std_logic_vector((nAddres-1) downto 0);
      writeEnable : in std_logic;
      writeData : in std_logic_vector ((nData-1) downto 0);
		readData: out std_logic_vector ((nData-1) downto 0));

end RAM_2P_16_8;

architecture Behavioral of RAM_2P_16_8 is

    constant NUM_WORDS : integer := (2**nAddres); -- Quantidade de espacos no array  
	 subtype TDataWord is std_logic_vector ((nData-1) downto 0); 
	 type TMemory is array (0 to NUM_WORDS-1) of TDataWord;
	 signal s_memory : TMemory;
	 
begin 
   process(writeClk)
	   begin
		   if (rising_edge (writeClk)) then
			    if (writeEnable = '1') then
				     s_memory(to_integer (unsigned(writeAddres))) <= writeData;
				 end if;
         end if;
   end process;
	
	readData <= s_memory(to_integer(unsigned(readAddres)));


end Behavioral;