library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UART is
port (
     reset, CLK, uart_rx, clk_en_uart, activer : in std_logic;
     erreur : out std_logic;
     char : out std_logic_vector (7 downto 0)
 );
end UART; 

architecture Behavioral of UART is
type etat_type is (attendre, lire, verifier, adjust) ;
signal state : etat_type := attendre;
signal vecteur : std_logic_vector(7 downto 0);
signal compteurdeLecture : natural range 0 to 7;
signal compteurdeCLK : natural range 0 to 1736;

begin

process(CLK, reset)
variable compteurde1 : integer range 0 to 7;
begin
if reset = '1' then 
    char <= "00000000";
    erreur <= '0';
    vecteur <= "00000000";
    compteurde1 := 0;
    compteurdeCLK <= 0;
    compteurdeLecture <= 0;
    state <= attendre;
elsif CLK'event and CLK='1' then
    compteurdeCLK <= compteurdeCLK + 1;
        case state is 
            when (attendre) =>         
                    if uart_rx = '0' then 
                        compteurdeCLK <= 0;
                        state <= adjust;
                end if;
                if compteurdeCLK = 1736 then 
                   compteurdeCLK <= 0;
                end if;
                
            when (adjust)  =>
                 if compteurdeCLK = 868 then  
                 state  <= lire;
                 end if;
                

            when (lire) => 
                if compteurdeCLK = 868 then
                    vecteur(compteurdeLecture) <= uart_rx;
                    if (vecteur(compteurdeLecture) = '1') then
                        compteurde1 :=  compteurde1 +1;
                    end if;
                    compteurdeLecture <= compteurdeLecture + 1;
                end if;
                if (compteurdeCLK = 1736) then 
                   compteurdeCLK <= 0;
                end if;
                if (compteurdeLecture = 7) then  
                    compteurdeCLK <= 0;
                    compteurdeLecture <= 0;
                    state <= verifier;
                end if;
                     
            when (verifier) =>
                if compteurde1 mod 2 = 1 then
                    erreur <= '0';
                    compteurde1 := 0;
                    compteurdeCLK <= 0;
                    compteurdeLecture <= 0;
                    char <= vecteur;
                    state <= attendre;
                else
                    erreur <= '1';
                    compteurde1 := 0;
                    compteurdeCLK <= 0;
                    compteurdeLecture <= 0;
                    --char <= "00000000";
                    state <= attendre;
                end if;  
                
             when others =>
                state <= attendre;
               
        end case;
    end if;
end process;
end Behavioral;
