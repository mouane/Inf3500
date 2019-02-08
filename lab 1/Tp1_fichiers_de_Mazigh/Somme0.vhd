
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Somme0 is
 Port ( 
    X : in unsigned(31 downto 0);
    Resultat : out unsigned(31 downto 0)
    );
    
end Somme0;

architecture Somme0 of Somme0 is

function s0( x : in unsigned(31 downto 0) ) return unsigned is

	begin

		return rotate_right(x, 2) xor rotate_right(x, 13) xor rotate_right(x, 22);

	end function s0;

begin

    Resultat <= s0(X);

end Somme0;
