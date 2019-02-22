library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;




entity algorithm_sha256 is
Port (

clk:    IN STD_LOGIC;
reset:    IN STD_LOGIC;
entree: in std_logic_vector(31 downto 0); 
sortie: out std_logic_vector(255 downto 0)

  );
  
end algorithm_sha256;



architecture algorithm_sha256 of algorithm_sha256 is

component Somme1 --sigma_upper_1 
port (X: in std_logic_vector(31 downto 0); Resultat: out std_logic_vector(31 downto 0));
end component;

component Somme0 --sigma_upper_0 
port (X: in std_logic_vector(31 downto 0); Resultat: out std_logic_vector(31 downto 0));
end component;

component Maj -- Maj
port (X, Y, Z: in std_logic_vector(31 downto 0); Resultat: out std_logic_vector(31 downto 0));
end component;

component Ch -- Ch
port (X, Y, Z: in std_logic_vector(31 downto 0); Ch: out std_logic_vector(31 downto 0));
end component;

TYPE State_type IS (etat0, etat1, etat2, etat3, etat4);  -- Define the states
SIGNAL State : State_Type;

signal zero: std_logic_vector(31 downto 16) := "0000000000000000";
constant K : std_logic_vector(31 downto 0):= x"428a2f98";
signal W : std_logic_vector(31 downto 0):= x"00000000";
signal h0, h1, h2, h3, h4, h5, h6, h7: std_logic_vector(31 downto 0);
signal a, b, c, d, e, f, g, h : std_logic_vector(31 downto 0);
signal t1, t2 : std_logic_vector(31 downto 0);
signal sortie_valid : std_logic;
signal v, x, y, z : std_logic_vector(31 downto 0);
--signal ch              : std_logic_vector(31 downto 0);
--signal maj             : std_logic_vector(31 downto 0);
--signal somme0   : std_logic_vector(31 downto 0);
--signal somme1   : std_logic_vector(31 downto 0);
--signal sigma0   : std_logic_vector(31 downto 0);
--signal sigma1   : std_logic_vector(31 downto 0);

begin 
  U2 : Ch port map (X => e, Y => f, Z => g,  Ch => x);
  U1 : Somme1 port map (X => e, Resultat => v);
  U3 : Somme0 port map (X => a, Resultat => y);
  U4 : Maj port map (X => a, Y => b, Z => c,  Resultat => z);
  
Process(state)


begin

 if rising_edge(clk) THEN 
                   
        if (reset = '0') then
        State <= etat0;
        end if;
      
        if (entree /= W) then
        State <= etat1;
        end if;
        
    CASE State IS

    when etat0  =>

        h0 <= x"6a09e667";
        h1 <= x"bb67ae85";
        h2 <= x"3c6ef372";
        h3 <= x"a54ff53a";
        h4 <= x"510e527f";
        h5 <= x"9b05688c";
        h6 <= x"1f83d9ab";
        h7 <= x"5be0cd19";
        W <= x"00000000";
        
        state <= etat1;
      
    when etat1  =>   
            a <= h0;
            b <= h1;
            c <= h2;
            d <= h3;
            e <= h4;
            f <= h5;
            g <= h6;
            h <= h7;
            W <= entree; 
            sortie_valid <= '0';
      state <= etat2;
 
      
    when etat2  =>
     x <= e;
     y <= f;
     z <= g;
     T1 <= h + v + x + k + w;
     state <= etat3;
     
    when etat3 =>
    x <= a;
    y <= b;
    z <= c;
    T2 <= y + z;
    state <= etat4;
    
    when etat4  =>
    h <= g;
    g <= f;
    f <= e;
    e <= d + T1;
    d <= c;
    c <= b;
    b <= a;
    a <= T1 + T2;
    
    h0 <= a + h0;
    h1 <= b + h1;
    h2 <= c + h2;
    h3 <= d + h3;
    h4 <= e + h4;
    h5 <= f + h5;
    h6 <= g + h6;
    h7 <= h + h7;
    
    sortie_valid <= '0' ;
    sortie(31 downto 0) <= h0;
    sortie(63 downto 32) <= h1;
    sortie(95 downto 64) <= h2;
    sortie(127 downto 96) <= h3;
    sortie(159 downto 128) <= h4;
    sortie(191 downto 160) <= h5;
    sortie(224 downto 192) <= h6;
    sortie(256 downto 223 ) <= h7;
    
    end case;
 
  end if;
  
  end process;





end algorithm_sha256;
