
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Sigma1 is
 Port ( 
    X : in std_logic_vector(31 downto 0);
    Resultat : out std_logic_vector(31 downto 0)
    );
    
end Sigma1;

architecture Sigma1 of Sigma1 is

function t1( x : in std_logic_vector ) return std_logic_vector is

	begin

		return std_logic_vector(rotate_right(signed(x), 6) xor rotate_right(signed(x), 19) xor shift_right(signed(x), 10));

	end function t1;

begin

    Resultat <= t1(X);

end Sigma1;
