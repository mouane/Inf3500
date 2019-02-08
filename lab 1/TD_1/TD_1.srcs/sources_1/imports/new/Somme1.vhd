
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Somme1 is
 Port ( 
    X : in std_logic_vector(31 downto 0);
    Resultat : out std_logic_vector(31 downto 0)
    );
    
end Somme1;

architecture Somme1 of Somme1 is

function s1( x : in std_logic_vector ) return std_logic_vector is

	begin

		return std_logic_vector(rotate_right(signed(x), 6) xor rotate_right(signed(x), 11) xor rotate_right(signed(x), 25));

	end function s1;

begin

    Resultat <= s1(X);

end Somme1;
