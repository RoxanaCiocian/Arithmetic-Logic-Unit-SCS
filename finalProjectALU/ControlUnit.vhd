library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ControlUnit is
Port (operation: in std_logic_vector(3 downto 0);
opEnable: out std_logic_vector(11 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is

signal muxOut: std_logic_vector(11 downto 0);

begin

process(operation)
begin

if operation = "0000" then muxOut <= "000000000001"; --ADD
end if;
if operation = "0001" then muxOut <= "000000000010"; --SUB
end if;
if operation = "0010" then muxOut <= "000000000100"; --INC
end if;
if operation = "0011" then muxOut <= "000000001000"; --DEC
end if;
if operation = "0100" then muxOut <= "000000010000"; --MUL
end if;
if operation = "0101" then muxOut <= "000000100000"; --DIV
end if;
if operation = "0110" then muxOut <= "000001000000"; --AND
end if;
if operation = "0111" then muxOut <= "000010000000"; --OR
end if;
if operation = "1000" then muxOut <= "000100000000"; --NOT
end if;
if operation = "1001" then muxOut <= "001000000000"; --NEG
end if;
if operation = "1010" then muxOut <= "010000000000"; --ROL
end if;
if operation = "1011" then muxOut <= "100000000000"; --ROR
end if;

end process;

opEnable <= muxOut;
end Behavioral;
