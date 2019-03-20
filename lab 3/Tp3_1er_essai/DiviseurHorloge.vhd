library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DiviseurHorloge is
  Generic (
    facteur : natural := 1736 --Facteur de division
  );
  Port (
    clk, reset: in std_logic;
    clk_en_uart: out std_logic;
    activer: out std_logic
  );
end DiviseurHorloge;

architecture Behavioral of DiviseurHorloge is
begin
    Process (reset, clk)
    variable compte : natural := 0 ;
        begin
        if (rising_edge(clk)) then
        compte := compte +1;
                if (reset = '1') then 
                    clk_en_uart <= '0';
                    activer <= '0';
                else 
                    if (compte = (facteur / 2 + 1) ) then -- compte = 3
                            clk_en_uart <= '1';
                            activer <= '1';    
                    elsif (compte = (facteur / 2 + 2)) then -- compte 4
                            activer <= '0';
                    elsif (compte  = (facteur + 1)) then -- compte = 5
                            clk_en_uart <= '0';
                            compte := 1;
                    end if;
                end if;
        end if;
    end process;
end Behavioral;
