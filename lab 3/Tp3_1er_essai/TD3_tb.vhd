library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TD3_tb is
end TD3_tb;

architecture Behavioral of TD3_tb is
    signal reset : std_logic;
    signal clk : std_logic := '0';
	signal clk_uart : std_logic := '0';
    signal erreur : std_logic;
    signal uart_rx: std_logic ;
    signal bitTransmis : natural := 0;
    signal char : std_logic_vector (7 downto 0);
    signal uart_vector: std_logic_vector(55 downto 0)
    := "11101110011111111100110110101101111000101111110110001111"; -- Sensé lire 231/109/241/199
                                                                   -- 11100111/01101101/11110001/11000111
begin
UUT : entity work.TD3(Behavioral)
port map (clk => clk, reset => reset, uart_rx => uart_rx, erreur => erreur, char => char);


reset <='1','0' after  50 ns;
clk <= not clk after 10 ns;
clk_uart <= not clk_uart after 8 us;

Process (clk_uart, bitTransmis)
begin
if (rising_edge(clk_uart)) then 
    uart_rx <= uart_vector(bitTransmis);
    bitTransmis <= bitTransmis + 1;
    if (bitTransmis = 55) then 
    bitTransmis <= 0;
    end if;
end if;
end process;


end Behavioral;

