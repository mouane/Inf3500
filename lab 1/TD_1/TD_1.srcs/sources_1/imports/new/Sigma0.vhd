
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity Sigma0 is
 Port ( 
    X : in std_logic_vector(31 downto 0);
    Resultat : out std_logic_vector(31 downto 0)
    );
    
end Sigma0;

architecture Sigma0 of sigma0 is

function t0( x : in std_logic_vector ) return std_logic_vector is

	begin

		return std_logic_vector(rotate_right(signed(x), 7) xor rotate_right(signed(x), 18) xor shift_right(signed(x), 3));

	end function t0;

begin

    Resultat <= t0(X);

end Sigma0;
