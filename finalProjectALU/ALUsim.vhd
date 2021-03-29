library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALUsim is
--  Port ( );
end ALUsim;

architecture Behavioral of ALUsim is

--component AdditionOp is
--Port (A : in std_logic_vector(15 downto 0);
--B : in std_logic_vector(15 downto 0);
--addEn: in std_logic;
--overflowFlag: out std_logic;
--Sum : out std_logic_vector(15 downto 0) );
--end component;

--signal addInp1, addInp2, addOut: std_logic_vector(15 downto 0);
--signal addOverflowflg, addEnable: std_logic;

--component SubtractionOp is
--Port (A : in std_logic_vector(15 downto 0);
--B : in std_logic_vector(15 downto 0);
--subEn: in std_logic;
--overflowFlag: out std_logic;
--Sub : out std_logic_vector(15 downto 0));
--end component;

--signal subInp1, subInp2, subOut: std_logic_vector(15 downto 0);
--signal subOverflowflg, subEnable: std_logic;

--component AndOp is
--Port (A : in std_logic_vector(15 downto 0);
--B : in std_logic_vector(15 downto 0);
--andEn: in std_logic;
--Result : out std_logic_vector(15 downto 0));
--end component;

--signal andInp1, andInp2, andOut: std_logic_vector(15 downto 0);
--signal andEnable: std_logic;

--component OrOp is
--Port (A : in std_logic_vector(15 downto 0);
--B : in std_logic_vector(15 downto 0);
--orEn: in std_logic;
--Result : out std_logic_vector(15 downto 0));
--end component;

--signal orInp1, orInp2, orOut: std_logic_vector(15 downto 0);
--signal orEnable: std_logic;

--component NotOp is
--Port (A : in std_logic_vector(15 downto 0);
--notEn: in std_logic;
--Result : out std_logic_vector(15 downto 0));
--end component;

--signal notInp1, notOut: std_logic_vector(15 downto 0);
--signal notEnable: std_logic;

--component RotateLeftOp is
--Port (A : in std_logic_vector(15 downto 0);
--rolEn: in std_logic;
--Result : out std_logic_vector(15 downto 0));
--end component;

--signal rolInp1, rolOut: std_logic_vector(15 downto 0);
--signal rolEnable: std_logic;

--component RotateRightOp is
--Port (A : in std_logic_vector(15 downto 0);
--rorEn: in std_logic;
--Result : out std_logic_vector(15 downto 0));
--end component;

--signal rorInp1, rorOut: std_logic_vector(15 downto 0);
--signal rorEnable: std_logic;

--component IncrementOp is
--Port (A : in std_logic_vector(15 downto 0);
--incEn: in std_logic;
--overflowFlag: out std_logic;
--Result : out std_logic_vector(15 downto 0));
--end component;

--signal incInp1, incOut: std_logic_vector(15 downto 0);
--signal incOverflowFlag, incEnable: std_logic;

--component DecrementOp is
--Port (A : in std_logic_vector(15 downto 0);
--decEn: in std_logic;
--overflowFlag: out std_logic;
--Result : out std_logic_vector(15 downto 0));
--end component;

--signal decInp1, decOut: std_logic_vector(15 downto 0);
--signal decOverflowFlag, decEnable: std_logic;

--component NegationOp is
--Port (A : in std_logic_vector(15 downto 0);
--negEn: in std_logic;
--Result : out std_logic_vector(15 downto 0));
--end component;

--signal negInp1, negOut: std_logic_vector(15 downto 0);
--signal negEnable: std_logic;

--component MultiplicationOp is
--port(x, y: in std_logic_vector(15 downto 0);
--mulEn: in std_logic;
--O: out std_logic_vector(31 downto 0));
--end component;

--signal mulInp1, mulInp2: std_logic_vector(15 downto 0);
--signal mulOut: std_logic_vector(31 downto 0);
--signal mulEnable: std_logic;

--component DivisionOp is
--port(n, d: in std_logic_vector(15 downto 0);
--divEn: in std_logic;
--errFlag: out std_logic;
--Q: out std_logic_vector(15 downto 0);
--R: out std_logic_vector(15 downto 0));
--end component;

--signal divInp1, divInp2, quot, remin: std_logic_vector(15 downto 0);
--signal divEnable, errFlag: std_logic := '0';

--component ControlUnit is
--Port (operation: in std_logic_vector(3 downto 0);
--opEnable: out std_logic_vector(11 downto 0));
--end component;

--signal opCU: std_logic_vector(3 downto 0);
--signal enable: std_logic_vector(11 downto 0);


component ALU is
Port (input1: in std_logic_vector(15 downto 0);
input2: in std_logic_vector(15 downto 0);
op: in std_logic_vector(3 downto 0);
clk, rst, en: in std_logic;
errorFlag: out std_logic;
overflowFlag: out std_logic;
output1: out std_logic_vector(15 downto 0);
output2: out std_logic_vector(15 downto 0));
end component;

signal input1, input2: std_logic_vector(15 downto 0);
signal output1, output2: std_logic_vector(15 downto 0);
signal op: std_logic_vector(3 downto 0);
signal overflowFlag, errorFlag: std_logic := '0';
signal clk, rst, en: std_logic;


constant clk_period : TIME := 10 ns;

begin


--AddOp: AdditionOp port map(addInp1, addInp2, addEnable, addOverflowflg, addOut); 
--SubOp: SubtractionOp port map(subInp1, subInp2, subEnable, subOverflowflg, subOut);
--AnddOp: AndOp port map(andInp1, andInp2, andEnable, andOut);
--OrrOp: OrOp port map(orInp1, orInp2, orEnable, orOut);
--NottOp: NotOp port map(notInp1, notEnable, notOut);
--RolOp: RotateLeftOp port map(rolInp1, rolEnable, rolOut);
--RorOp: RotateRightOp port map(rorInp1, rorEnable, rorOut);
--IncOp: IncrementOp port map(incInp1, incEnable, incOverflowFlag, incOut);
--DecOp: DecrementOp port map(decInp1, decEnable, decOverflowFlag, decOut);
--NegOp: NegationOp port map(negInp1, negEnable, negOut);
--MulOp: MultiplicationOp port map(mulInp1, mulInp2, mulEnable, mulOut);
--DivOp: DivisionOp port map(divInp1, divInp2, divEnable, errFlag, quot, remin);
--CU: ControlUnit port map(opCU, enable);

ALUU: ALU port map(input1, input2, op, clk, rst, en, errorFlag, overflowFlag, output1, output2);

clk_process: process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;

SignalStimuli: process
begin

--ALU SIMULATION

--Addition
en <= '1';
rst <='0';
op <= "0000";
input1 <= "0000000011110011"; -- 243
input2 <= "1111111110111001"; -- -71
wait for 10 ns;

---Subtraction
overflowFlag <= '0';
errorFlag <= '0';
en <= '1';
rst <='0';
op <= "0001";
input1 <= "0000000001000011"; -- 67
input2 <= "0000000001110000"; -- 112
wait for 10 ns;
--Increment 
overflowFlag <= '0';
errorFlag <= '0';
en <= '1';
rst <='0';
op <= "0010";
input1 <= "0000000010001111"; -- 143
wait for 10 ns;
--Decrement
overflowFlag <= '0';
errorFlag <= '0';
en <= '1';
rst <='0';
op <= "0011";
input1 <= "1111111111110001"; -- -15 
wait for 10 ns;
--Multiplication
overflowFlag <= '0';
errorFlag <= '0';
en <= '1';
rst <='0';
op <= "0100";
input1 <= "0000000001100101"; -- 101
input2 <= "1111111111111110"; -- -2
wait for 10 ns;
--Division
overflowFlag <= '0';
errorFlag <= '0';
en <= '1';
rst <='0';
op <= "0101";
input1 <= "0000000010000111"; -- 135
input2 <= "0000000000001100"; -- 12
wait for 10 ns;
--And
overflowFlag <= '0';
errorFlag <= '0';
en <= '1';
rst <='0';
op <= "0110";
input1 <= "0011011100001011"; 
input2 <= "0101111100100000";
wait for 10 ns;
--Or
overflowFlag <= '0';
errorFlag <= '0';
en <= '1';
rst <='0';
op <= "0111";
input1 <= "0000000000000000"; 
input2 <= "0111111011010000";
wait for 10 ns;
--Not
overflowFlag <= '0';
errorFlag <= '0';
input2 <= "ZZZZZZZZZZZZZZZZ";
en <= '1';
rst <='0';
op <= "1000";
input1 <= "0101010101010101"; 
wait for 10 ns;
--Negation
overflowFlag <= '0';
errorFlag <= '0';
input2 <= "ZZZZZZZZZZZZZZZZ";
en <= '1';
rst <='0';
op <= "1001";
input1 <= "0000000010000100"; -- 132 
wait for 10 ns;
--Rotate Left
overflowFlag <= '0';
errorFlag <= '0';
input2 <= "ZZZZZZZZZZZZZZZZ";
en <= '1';
rst <='0';
op <= "1010";
input1 <= "0000101111101111";
wait for 10 ns;
--Rotate Right
overflowFlag <= '0';
errorFlag <= '0';
input2 <= "ZZZZZZZZZZZZZZZZ";
en <= '1';
rst <='0';
op <= "1011";
input1 <= "0000101111101111"; 
wait for 10 ns;


--OPERATIONS SIMULATION
--ADDITION
--addEnable <= '1';
--addInp1 <= "0111111111111111"; -- 32767
--addInp2 <= "0000000000000001"; -- 1
--wait for 10 ns;

--addEnable <= '1';
--addInp1 <= "0000000001111101"; -- 125
--addInp2 <= "0000000000110001"; -- 49
--wait for 10 ns;

--addEnable <= '1';
--addInp1 <= "0000000011110011"; -- 243
--addInp2 <= "1111111110111001"; -- -71
--wait for 10 ns;

--addInp1 <= "1111111110001011"; -- -117
--addInp2 <= "0000000000100000"; -- 32
--wait for 10 ns;

--addInp1 <= "1111111110101111"; -- -81
--addInp2 <= "1111111111100101"; -- -27
--wait for 10 ns;

--SUBTRACTION
--subEnable <='1';
--subInp1 <= "0000000001000011"; -- 67
--subInp2 <= "0000000001110000"; -- 112
--wait for 10 ns;

--subEnable <= '1';
--subInp1 <= "0000000011010011"; -- 211
--subInp2 <= "1111111110011001"; -- -103
--wait for 10 ns;

--subInp1 <= "1111111111110100"; -- -12
--subInp2 <= "0000000010100101"; -- 165
--wait for 10 ns;

--subInp1 <= "1111111111001011"; -- -53
--subInp2 <= "1111111111000010"; -- -62
--wait for 10 ns;

----AND OP
--andEnable <= '0';
--andInp1 <= "0011011100001011"; 
--andInp2 <= "0101111100100000"; 
--wait for 10 ns;

--andInp1 <= "0000000000000000"; 
--andInp2 <= "0111111011010000"; 
--wait for 10 ns;

--andInp1 <= "1111111111111111"; 
--andInp2 <= "1111111111111111"; 
--wait for 10 ns;

--andInp1 <= "0101010101010101"; 
--andInp2 <= "1110110100001001"; 
--wait for 10 ns;

----OR OP
--orEnable <= '0';
--orInp1 <= "0000000000000000"; 
--orInp2 <= "0000000000000000"; 
--wait for 10 ns;

--orInp1 <= "0000000000000000"; 
--orInp2 <= "0111111011010000"; 
--wait for 10 ns;

--orInp1 <= "1111111111111111"; 
--orInp2 <= "1111111111111111"; 
--wait for 10 ns;

--orInp1 <= "0101010101010101"; 
--orInp2 <= "1110110100001001"; 
--wait for 10 ns;

----NOT OP
--notEnable <='1';
--notInp1 <= "0101010101010101"; 
--wait for 10 ns;

--notInp1 <= "0000000000000000"; 
--wait for 10 ns;

--notInp1 <= "1111111111111111"; 
--wait for 10 ns;

--notInp1 <= "0011011100001011"; 
--wait for 10 ns;

----ROL OP
--rolEnable <= '1';
--rolInp1 <= "0000101111101111"; 
--wait for 10 ns;

--rolInp1 <= "1111000011110000"; 
--wait for 10 ns;

--rolInp1 <= "0000111100001111"; 
--wait for 10 ns;

--rolInp1 <= "0111100001111000"; 
--wait for 10 ns;

----ROR OP
--rorEnable <= '1';
--rorInp1 <= "0000101111101111"; 
--wait for 10 ns;

--rorInp1 <= "1111000011110000"; 
--wait for 10 ns;

--rorInp1 <= "0000111100001111"; 
--wait for 10 ns;

--rorInp1 <= "0111100001111000"; 
--wait for 10 ns;

----INC OP
--incEnable <= '1';
--incInp1 <= "0000000010001111"; -- 143
--wait for 10 ns;

--incInp1 <= "1111111100111111"; -- -193 
--wait for 10 ns;

--incInp1 <= "0000000001010011"; -- 83 
--wait for 10 ns;

--incInp1 <= "1111111111100101"; -- -27 
--wait for 10 ns;

----DEC OP
--decEnable <= '1';
--decInp1 <= "0000000011010011"; -- 211
--wait for 10 ns;

--decInp1 <= "1111111111110001"; -- -15 
--wait for 10 ns;

--decInp1 <= "0000000010011001"; -- 153 
--wait for 10 ns;

--decInp1 <= "1111111101110111"; -- -137 
--wait for 10 ns;

----NEGATION
--negEnable <= '1';
--negInp1 <= "0000000010000100"; -- 132
--wait for 10 ns;

--negInp1 <= "1111111111010011"; -- -45 
--wait for 10 ns;

--negInp1 <= "0000000001001001"; -- 73
--wait for 10 ns;

--negInp1 <= "0000000110100100"; -- 420 
--wait for 10 ns;

----MULTIPLICATION
--mulEnable <= '1';
--mulInp1 <= "0000000000100001"; -- 33
--mulInp2 <= "0000000000010001"; -- 17
--wait for 10 ns;

--mulInp1 <= "0000000001100101"; -- 101
--mulInp2 <= "1111111111111110"; -- -2
--wait for 10 ns;

--mulInp1 <= "1111111111110100"; -- -12
--mulInp2 <= "1111111111111010"; -- -6
--wait for 10 ns;

--mulInp1 <= "1111111111111000"; -- -8
--mulInp2 <= "0000000000101000"; -- 40
--wait for 10 ns;

----DIVISION
--divEnable <= '1';
--divInp1 <= "0000000010000111"; -- 135
----divInp2 <= "0000000000001100"; -- 12
--divInp2 <= "0000000000000000";
--wait for 10 ns;

--divEnable <= '1';
--divInp1 <= "0000000001010011"; -- 83
--divInp2 <= "0000000000011001"; -- 25
--wait for 10 ns;

--divInp1 <= "0000000001110011"; -- 115
--divInp2 <= "0000000000000101"; -- 5
--wait for 10 ns;

--divInp1 <= "0000000011100011"; -- 227
--divInp2 <= "0000000000110000"; -- 48
--wait for 10 ns;

end process; 

end Behavioral;
