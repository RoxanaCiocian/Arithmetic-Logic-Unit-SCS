library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SubtractionOp is
Port (A : in std_logic_vector(15 downto 0);
B : in std_logic_vector(15 downto 0);
subEn: in std_logic;
overflowFlag: out std_logic;
Sub : out std_logic_vector(15 downto 0));
end SubtractionOp;

architecture Behavioral of SubtractionOp is

component fullAdder is
Port (A : in std_logic;
B : in std_logic;
Cin : in std_logic;
Sum : out std_logic;
Cout : out std_logic);
end component;
 
component twosComplConverter is
Port (input : in std_logic_vector(15 downto 0);
output : out std_logic_vector (15 downto 0));
end component;

signal cout: std_logic_vector(15 downto 0);
signal convB : std_logic_vector(15 downto 0);
signal  convSub : std_logic_vector(15 downto 0); 

begin

twosComplConvB : twosComplConverter port map(B, convB);

A1: fullAdder port map(A(0), convB(0), '0', convSub(0), cout(0));
A2: fullAdder port map(A(1), convB(1), cout(0), convSub(1), cout(1));
A3: fullAdder port map(A(2), convB(2), cout(1), convSub(2), cout(2));
A4: fullAdder port map(A(3), convB(3), cout(2), convSub(3), cout(3));
A5: fullAdder port map(A(4), convB(4), cout(3), convSub(4), cout(4));
A6: fullAdder port map(A(5), convB(5), cout(4), convSub(5), cout(5));
A7: fullAdder port map(A(6), convB(6), cout(5), convSub(6), cout(6));
A8: fullAdder port map(A(7), convB(7), cout(6), convSub(7), cout(7));
A9: fullAdder port map(A(8), convB(8), cout(7), convSub(8), cout(8));
A10: fullAdder port map(A(9), convB(9), cout(8), convSub(9), cout(9));
A11: fullAdder port map(A(10), convB(10), cout(9), convSub(10), cout(10));
A12: fullAdder port map(A(11), convB(11), cout(10), convSub(11), cout(11));
A13: fullAdder port map(A(12), convB(12), cout(11), convSub(12), cout(12));
A14: fullAdder port map(A(13), convB(13), cout(12), convSub(13), cout(13));
A15: fullAdder port map(A(14), convB(14), cout(13), convSub(14), cout(14));
A16: fullAdder port map(A(15), convB(15), cout(14), convSub(15), cout(15));


process (convSub, subEn)
begin
if subEn = '1' then 
   Sub <= convSub; overflowFlag <= cout(15) xor cout(14);
else Sub <= "ZZZZZZZZZZZZZZZZ"; overflowFlag <= 'Z';

end if;
end process;

end Behavioral;
