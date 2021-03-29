library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity RotateLeftOp is
Port (A : in std_logic_vector(15 downto 0);
rolEn: in std_logic;
Result : out std_logic_vector(15 downto 0));
end RotateLeftOp;

architecture Behavioral of RotateLeftOp is

signal Output: std_logic_vector(15 downto 0);

begin

Output <= std_logic_vector(unsigned(A) rol 1);

process(Output, rolEn)
begin

if rolEn ='1' then
   Result <= Output;
else Result <= "ZZZZZZZZZZZZZZZZ";
end if;
end process;

end Behavioral;
