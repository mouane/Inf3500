

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PartieC is
Port ( 
    entree : in std_logic_vector(15 downto 0);
    sortie : out std_logic_vector(15 downto 0)
);
end PartieC;

architecture structurale of PartieC is

component Sigma1 --sigma_lower_1
port (X: in std_logic_vector(31 downto 0); Resultat: out std_logic_vector(31 downto 0));
end component;

component Sigma0 --sigma_lower_0
port (X: in std_logic_vector(31 downto 0); Resultat: out std_logic_vector(31 downto 0));
end component;

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

signal A, B, C, D, E, F, G: std_logic_vector(31 downto 0);
begin

A(15 downto 0) <= entree;
    U1 : Sigma1 port map (X => A, Resultat => B);
    U2 : Sigma0 port map (X => B, Resultat => C);
    U3 : Somme1 port map (X => C, Resultat => D);
    U4 : Somme0 port map (X => D, Resultat => E);
    U5 : Maj port map (X => E, Y => E, Z => E,  Resultat => F);
    U6 : Ch port map (X => F, Y => F, Z => F,  Ch => G); 
sortie <= G(15 downto 0);
    
end structurale;
