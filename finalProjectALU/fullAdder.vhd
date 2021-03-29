library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
 Port (A : in std_logic;
 B : in std_logic;
 Cin : in std_logic;
 Sum : out std_logic;
 Cout : out std_logic);
end fullAdder;

architecture Behavioral of fullAdder is

begin

Sum <= A xor B xor Cin;
Cout <= (A and B) or (Cin and A) or (Cin and B) ;
end Behavioral;
