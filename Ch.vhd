
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Ch is
Port(
    X : in std_logic_vector(31 downto 0);
    Y : in std_logic_vector(31 downto 0);
    Z : in std_logic_vector(31 downto 0);
    Resultat : out std_logic_vector(31 downto 0)
   );
   
end Ch;

architecture Ch of Ch is

begin

process(X,Y,Z)
    variable A, B: std_logic_vector(31 downto 0);
    
    begin
    
    A := X and Y;
    B := not(X) and Z;
    Resultat <= A xor B;
    end process;
    
end Ch;
