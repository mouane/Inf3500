
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity Sigma0 is
 Port ( 
    X : in unsigned(31 downto 0);
    Resultat : out unsigned(31 downto 0)
    );
    
end Sigma0;

architecture Sigma0 of sigma0 is

function t0( x : in unsigned(31 downto 0) ) return unsigned is

	begin

		return rotate_right(x, 7) xor rotate_right(x, 18) xor shift_right(x, 3);

	end function t0;

begin

    Resultat <= t0(X);

end Sigma0;
