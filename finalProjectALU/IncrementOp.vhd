library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IncrementOp is
Port (A : in std_logic_vector(15 downto 0);
incEn: in std_logic;
overflowFlag: out std_logic;
Result : out std_logic_vector(15 downto 0));
end IncrementOp;

architecture Behavioral of IncrementOp is

component fullAdder is
Port (A : in std_logic;
B : in std_logic;
Cin : in std_logic;
Sum : out std_logic;
Cout : out std_logic);
end component;

signal cout, Output: std_logic_vector(15 downto 0);

begin

A1: fullAdder port map(A(0), '1', '0', Output(0), cout(0));
A2: fullAdder port map(A(1), '0', cout(0), Output(1), cout(1));
A3: fullAdder port map(A(2), '0', cout(1), Output(2), cout(2));
A4: fullAdder port map(A(3), '0', cout(2), Output(3), cout(3));
A5: fullAdder port map(A(4), '0', cout(3), Output(4), cout(4));
A6: fullAdder port map(A(5), '0', cout(4), Output(5), cout(5));
A7: fullAdder port map(A(6), '0', cout(5), Output(6), cout(6));
A8: fullAdder port map(A(7), '0', cout(6), Output(7), cout(7));
A9: fullAdder port map(A(8), '0', cout(7), Output(8), cout(8));
A10: fullAdder port map(A(9), '0', cout(8), Output(9), cout(9));
A11: fullAdder port map(A(10), '0', cout(9), Output(10), cout(10));
A12: fullAdder port map(A(11), '0', cout(10), Output(11), cout(11));
A13: fullAdder port map(A(12), '0', cout(11), Output(12), cout(12));
A14: fullAdder port map(A(13), '0', cout(12), Output(13), cout(13));
A15: fullAdder port map(A(14), '0', cout(13), Output(14), cout(14));
A16: fullAdder port map(A(15), '0', cout(14), Output(15), cout(15));

process (Output, incEn)
begin
if incEn = '1' then 
   Result <= Output; overflowFlag <= cout(15) xor cout(14);
else Result <= "ZZZZZZZZZZZZZZZZ"; overflowFlag <= 'Z';
end if;
end process;

end Behavioral;
