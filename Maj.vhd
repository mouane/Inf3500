library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Maj is
 Port (
        X : in unsigned(31 downto 0);
        Y : in unsigned(31 downto 0);
        Z : in unsigned(31 downto 0);
        Resultat : out unsigned(31 downto 0)
         );
end Maj;

architecture Maj of Maj is
begin
Process ( X,Y,Z)

    variable A, B, C : unsigned(31 downto 0);
    
    begin
    A:= X and Y;
    B:= X and Z;
    C:= Y and Z;
     
    Resultat <= A xor B xor C;
    
   

end Process;



end Maj;
