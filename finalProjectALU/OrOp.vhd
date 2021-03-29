library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OrOp is
Port (A : in std_logic_vector(15 downto 0);
B : in std_logic_vector(15 downto 0);
orEn: in std_logic;
Result : out std_logic_vector(15 downto 0));
end OrOp;

architecture Behavioral of OrOp is

signal Output: std_logic_vector(15 downto 0);

begin

Output <= A or B;

process(Output, orEn)
begin

if orEn ='1' then 
   Result <= Output;
else Result <= "ZZZZZZZZZZZZZZZZ";
end if;
end process;

end Behavioral;
