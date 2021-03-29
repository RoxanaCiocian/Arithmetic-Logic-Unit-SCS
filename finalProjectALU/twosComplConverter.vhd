library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;


entity twosComplConverter is
Port (input : in std_logic_vector(15 downto 0);
output : out std_logic_vector (15 downto 0));
end twosComplConverter;

architecture Behavioral of twosComplConverter is

begin

output <= std_logic_vector(unsigned(not input) + 1);

end Behavioral;
