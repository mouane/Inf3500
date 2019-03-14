library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DiviseurHorloge_tb is
end DiviseurHorloge_tb;

architecture Behavioral of DiviseurHorloge_tb is
    signal reset:  std_logic := '0';
    signal clk :  std_logic := '0';
    signal clk_en_uart: std_logic;
    --signal activer: std_logic;
begin
UUT : entity work.DiviseurHorloge(Behavioral)
port map (clk => clk, reset => reset, clk_en_uart => clk_en_uart);
clk <= not clk after 10ns;
end Behavioral;
