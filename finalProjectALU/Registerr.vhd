library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registerr is
Port (clk, rst, en: in std_logic;
d: in std_logic_vector(15 downto 0);
q: out std_logic_vector(15 downto 0));
end Registerr;

architecture Behavioral of Registerr is

begin

process(clk, rst, en)
begin

if rst = '1' then q <= "0000000000000000";
elsif (rising_edge(clk)) then
   if en = '1' then q <= d;
   else q <= "ZZZZZZZZZZZZZZZZ";
   end if;
end if;
end process;

end Behavioral;
