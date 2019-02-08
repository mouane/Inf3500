
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Somme0 is
 Port ( 
    X : in std_logic_vector(31 downto 0);
    Resultat : out std_logic_vector(31 downto 0)
    );
    
end Somme0;

architecture Somme0 of Somme0 is

function s0( x : in std_logic_vector ) return std_logic_vector is

	begin

		return std_logic_vector(rotate_right(signed(x), 2) xor rotate_right(signed(x), 13) xor rotate_right(signed(x), 22));

	end function s0;

begin

    Resultat <= s0(X);

end Somme0;
