library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity AdditionOp is
Port (A : in std_logic_vector(15 downto 0);
B : in std_logic_vector(15 downto 0);
addEn: in std_logic;
overflowFlag: out std_logic := '0';
Sum : out std_logic_vector(15 downto 0));
end AdditionOp;

architecture Behavioral of AdditionOp is

component fullAdder is
Port (A : in std_logic;
B : in std_logic;
Cin : in std_logic;
Sum : out std_logic;
Cout : out std_logic);
end component;
 
signal cout: std_logic_vector(15 downto 0);
signal convSum: std_logic_vector(15 downto 0);

begin

A1: fullAdder port map(A(0), B(0), '0', convSum(0), cout(0));
A2: fullAdder port map(A(1), B(1), cout(0), convSum(1), cout(1));
A3: fullAdder port map(A(2), B(2), cout(1), convSum(2), cout(2));
A4: fullAdder port map(A(3), B(3), cout(2), convSum(3), cout(3));
A5: fullAdder port map(A(4), B(4), cout(3), convSum(4), cout(4));
A6: fullAdder port map(A(5), B(5), cout(4), convSum(5), cout(5));
A7: fullAdder port map(A(6), B(6), cout(5), convSum(6), cout(6));
A8: fullAdder port map(A(7), B(7), cout(6), convSum(7), cout(7));
A9: fullAdder port map(A(8), B(8), cout(7), convSum(8), cout(8));
A10: fullAdder port map(A(9), B(9), cout(8), convSum(9), cout(9));
A11: fullAdder port map(A(10), B(10), cout(9), convSum(10), cout(10));
A12: fullAdder port map(A(11), B(11), cout(10), convSum(11), cout(11));
A13: fullAdder port map(A(12), B(12), cout(11), convSum(12), cout(12));
A14: fullAdder port map(A(13), B(13), cout(12), convSum(13), cout(13));
A15: fullAdder port map(A(14), B(14), cout(13), convSum(14), cout(14));
A16: fullAdder port map(A(15), B(15), cout(14), convSum(15), cout(15));

process (convSum, addEn)
begin
if addEn = '1' then 
    Sum <= convSum; overflowFlag <= cout(15) xor cout(14);
else Sum <= "ZZZZZZZZZZZZZZZZ"; overflowFlag <= 'Z';
end if;
end process;



end Behavioral;
