library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NegationOp is
Port (A : in std_logic_vector(15 downto 0);
negEn: in std_logic;
Result : out std_logic_vector(15 downto 0));
end NegationOp;

architecture Behavioral of NegationOp is

component twosComplConverter is
Port (input : in std_logic_vector(15 downto 0);
output : out std_logic_vector (15 downto 0));
end component;

signal Output: std_logic_vector(15 downto 0);

begin

twosComplConv: twosComplConverter port map(A, Output);

process (Output, negEn)
begin

if negEn = '1' then
   Result <= Output;
else Result <= "ZZZZZZZZZZZZZZZZ";
end if;
end process;

end Behavioral;
