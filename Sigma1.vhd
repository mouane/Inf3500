
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Sigma1 is
 Port ( 
    X : in unsigned(31 downto 0);
    Resultat : out unsigned(31 downto 0)
    );
    
end Sigma1;

architecture Sigma1 of Sigma1 is

function t1( x : in unsigned(31 downto 0) ) return unsigned is

	begin

		return rotate_right(x, 6) xor rotate_right(x, 19) xor rotate_right(x, 10);

	end function t1;

begin

    Resultat <= t1(X);

end Sigma1;
