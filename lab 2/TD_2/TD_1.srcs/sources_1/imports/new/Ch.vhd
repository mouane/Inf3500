library IEEE;
               use IEEE.STD_LOGIC_1164.ALL;
               
               entity ch is
               Port ( 
                   X   : in std_logic_vector(31 downto 0);
                   Y   : in std_logic_vector(31 downto 0);
                   Z   : in std_logic_vector(31 downto 0);
                   Ch  : out std_logic_vector(31 downto 0)
               );
               end ch;
               
               architecture behavioral of ch is 
               
               begin
               
                   Ch <= (X and Y) xor (not X and Z); 
               
               end behavioral;
