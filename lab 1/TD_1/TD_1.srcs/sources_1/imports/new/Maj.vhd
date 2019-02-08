library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Maj is
 Port (
        X : in std_logic_vector(31 downto 0);
        Y : in std_logic_vector(31 downto 0);
        Z : in std_logic_vector(31 downto 0);
        Resultat : out std_logic_vector(31 downto 0)
         );
end Maj;

architecture Maj of Maj is
begin

     
    Resultat <=  (X and Y) xor (X and Z) xor (Y and Z); 
    


end Maj;
