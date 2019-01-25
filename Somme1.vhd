
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Somme1 is
 Port ( 
    X : in unsigned(31 downto 0);
    Resultat : out unsigned(31 downto 0)
    );
    
end Somme1;

architecture Somme1 of Somme1 is

function s1( x : in unsigned(31 downto 0) ) return unsigned is

	begin

		return rotate_right(x, 6) xor rotate_right(x, 11) xor rotate_right(x, 25);

	end function s1;

begin

    Resultat <= s1(X);

end Somme1;
