library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NotOp is
Port (A : in std_logic_vector(15 downto 0);
notEn: in std_logic;
Result : out std_logic_vector(15 downto 0));
end NotOp;

architecture Behavioral of NotOp is

signal Output: std_logic_vector(15 downto 0);

begin

Output <= not(A);

process(Output, notEn)
begin

if notEn = '1' then 
   Result <= Output;
else Result <= "ZZZZZZZZZZZZZZZZ";
end if;
end process;

end Behavioral;
