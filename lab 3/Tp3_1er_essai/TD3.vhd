library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TD3 is
  Port (
  reset, clk : in std_logic;
  uart_rx: in std_logic;
  erreur : out std_logic;
--  char : out std_logic_vector(7 downto 0) -- Decommenter pour la simutation et commenter pour l'implementation
  ca, cb, cc, cd, ce, cf, cg, dp : out std_logic;  -- Commenter pour la simutation et decommenter pour l'implementation
  an : out std_logic_vector(7 downto 0) -- Commenter pour la simutation et decommenter pour l'implementation
  );
end TD3;

architecture Behavioral of TD3 is
component UART
    port (
    reset, CLK, uart_rx, clk_en_uart, activer : in std_logic;
    erreur : out STD_LOGIC;
    char : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
component aff7seg -- Commenter pour la simutation et decommenter pour l'implementation
    port (
    clk100mhz : in std_logic;
    heures_1,heures_2 : in  std_logic_vector(7 downto 0);
    minutes_1,minutes_2 : in  std_logic_vector(7 downto 0);
    secondes_1,secondes_2: in  std_logic_vector(7 downto 0);
    centiemes_1,centiemes_2: in  std_logic_vector(7 downto 0);
    an : out std_logic_vector(7 downto 0);
    ca, cb, cc, cd, ce, cf, cg, dp : out std_logic
	);
end component;
component DiviseurHorloge
    port( 
    clk, reset: in std_logic;
    clk_en_uart: out std_logic;
    activer: out std_logic
    );
end component;
signal a : std_logic;
signal b : std_logic;
signal c : std_logic_vector (7 downto 0);
begin
U1 : DiviseurHorloge port map (clk => clk, reset => reset, clk_en_uart => a, activer => b);
U2 : UART port map (reset => reset, clk_en_uart => a, CLK => clk, uart_rx => uart_rx,
erreur => erreur, char => c, activer => b);
-- char <=c; -- Decommenter pour la simutation et commenter pour l'implementation
U3 : aff7seg port map (clk100mhz => clk, heures_1 => c, heures_2 => c,
minutes_1 => c, minutes_2 => c, secondes_1 => c,      
secondes_2 => c,  centiemes_1 => c,  centiemes_2 => c, ca => ca, cb => cb,
cc => cc, cd => cd, ce => ce, cf => cf, cg => cg, dp => dp, an => an); -- Commenter pour la simutation et decommenter pour l'implementation

end Behavioral;
