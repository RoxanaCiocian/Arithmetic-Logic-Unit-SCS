library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AndOp is
Port (A : in std_logic_vector(15 downto 0);
B : in std_logic_vector(15 downto 0);
andEn: in std_logic;
Result : out std_logic_vector(15 downto 0));
end AndOp;

architecture Behavioral of AndOp is

signal Output: std_logic_vector(15 downto 0);

begin

Output <= A and B;

process(Output, andEn)
begin

if andEn ='1' then
   Result <= Output;
else Result <= "ZZZZZZZZZZZZZZZZ";
end if;
end process;

end Behavioral;
