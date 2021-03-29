library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
 Port (input1: in std_logic_vector(15 downto 0);
 input2: in std_logic_vector(15 downto 0);
 op: in std_logic_vector(3 downto 0);
 clk, rst, en: in std_logic;
 errorFlag: out std_logic;
 overflowFlag: out std_logic;
 output1: out std_logic_vector(15 downto 0);
 output2: out std_logic_vector(15 downto 0));
end ALU;

architecture Behavioral of ALU is

signal aluOut1, aluOut2: std_logic_vector(15 downto 0);
signal overflowFlagAlu, errorFlagAlu: std_logic := '0';

component Registerr is
Port (clk, rst, en: in std_logic;
d: in std_logic_vector(15 downto 0);
q: out std_logic_vector(15 downto 0));
end component;
signal regInp1, regInp2, regOut1, regOut2: std_logic_vector(15 downto 0);

component ControlUnit is
Port (operation: in std_logic_vector(3 downto 0);
opEnable: out std_logic_vector(11 downto 0));
end component;
signal outControl: std_logic_vector(11 downto 0);

component AdditionOp is
Port (A : in std_logic_vector(15 downto 0);
B : in std_logic_vector(15 downto 0);
addEn: in std_logic;
overflowFlag: out std_logic := '0';
Sum : out std_logic_vector(15 downto 0) );
end component;
signal addOut: std_logic_vector(15 downto 0);
signal addOverFlag: std_logic := '0';

component SubtractionOp is
Port (A : in std_logic_vector(15 downto 0);
B : in std_logic_vector(15 downto 0);
subEn: in std_logic;
overflowFlag: out std_logic;
Sub : out std_logic_vector(15 downto 0));
end component;
signal subOut: std_logic_vector(15 downto 0);
signal subOverFlag: std_logic := '0';

component AndOp is
Port (A : in std_logic_vector(15 downto 0);
B : in std_logic_vector(15 downto 0);
andEn: in std_logic;
Result : out std_logic_vector(15 downto 0));
end component;
signal andOut: std_logic_vector(15 downto 0);

component OrOp is
Port (A : in std_logic_vector(15 downto 0);
B : in std_logic_vector(15 downto 0);
orEn: in std_logic;
Result : out std_logic_vector(15 downto 0));
end component;
signal orOut: std_logic_vector(15 downto 0);

component NotOp is
Port (A : in std_logic_vector(15 downto 0);
notEn: in std_logic;
Result : out std_logic_vector(15 downto 0));
end component;
signal notOut: std_logic_vector(15 downto 0);

component RotateLeftOp is
Port (A : in std_logic_vector(15 downto 0);
rolEn: in std_logic;
Result : out std_logic_vector(15 downto 0));
end component;
signal rolOut: std_logic_vector(15 downto 0);

component RotateRightOp is
Port (A : in std_logic_vector(15 downto 0);
rorEn: in std_logic;
Result : out std_logic_vector(15 downto 0));
end component;
signal rorOut: std_logic_vector(15 downto 0);

component IncrementOp is
Port (A : in std_logic_vector(15 downto 0);
incEn: in std_logic;
overflowFlag: out std_logic;
Result : out std_logic_vector(15 downto 0));
end component;
signal incOut: std_logic_vector(15 downto 0);
signal incOverFlag: std_logic := '0';

component DecrementOp is
Port (A : in std_logic_vector(15 downto 0);
decEn: in std_logic;
overflowFlag: out std_logic;
Result : out std_logic_vector(15 downto 0));
end component;
signal decOut: std_logic_vector(15 downto 0);
signal decOverFlag: std_logic := '0';

component NegationOp is
Port (A : in std_logic_vector(15 downto 0);
negEn: in std_logic;
Result : out std_logic_vector(15 downto 0));
end component;
signal negOut: std_logic_vector(15 downto 0);

component MultiplicationOp is
port(x, y: in std_logic_vector(15 downto 0);
mulEn: in std_logic;
O: out std_logic_vector(31 downto 0));
end component;
signal mulOut: std_logic_vector(31 downto 0);

component DivisionOp is
port(n, d: in std_logic_vector(15 downto 0);
divEn: in std_logic;
errFlag: out std_logic;
Q: out std_logic_vector(15 downto 0);
R: out std_logic_vector(15 downto 0));
end component;
signal quot, remin: std_logic_vector(15 downto 0);
signal errFlag: std_logic;

begin

Control: ControlUnit port map(op, outControl);
aAddOp: AdditionOp port map(input1, input2, outControl(0), overflowFlagAlu, addOut); 
aSubOp: SubtractionOp port map(input1, input2, outControl(1), overflowFlagAlu, subOut);
aAnddOp: AndOp port map(input1, input2, outControl(6), andOut);
aOrrOp: OrOp port map(input1, input2, outControl(7), orOut);
aNottOp: NotOp port map(input1, outControl(8), notOut);
aRolOp: RotateLeftOp port map(input1, outControl(10), rolOut);
aRorOp: RotateRightOp port map(input1, outControl(11), rorOut);
aIncOp: IncrementOp port map(input1, outControl(2), overflowFlagAlu, incOut);
aDecOp: DecrementOp port map(input1, outControl(3), overflowFlagAlu, decOut);
aNegOp: NegationOp port map(input1, outControl(9), negOut);
aMulOp: MultiplicationOp port map(input1, input2, outControl(4), mulOut);
aDivOp: DivisionOp port map(input1, input2, outControl(5), errorFlagAlu, quot, remin);

RegInpt1: Registerr port map(clk, rst, en, input1, regInp1);
RegInpt2: Registerr port map(clk, rst, en, input2, regInp2);
RegOutp1: Registerr port map(clk, rst, en, aluOut1, regOut1);
RegOutp2: Registerr port map(clk, rst, en, aluOut2, regOut2);

process(op, addOut, subOut, andOut, orOut, notOut, rolOut, rorOut, incOut, decOut, negOut, mulOut, quot, remin,addOverFlag, subOverFlag, incOverFlag, decOverFlag, errFlag)
begin

if op = "0000" then --ADD
    aluOut2 <= addOut; 
    aluOut1 <= "ZZZZZZZZZZZZZZZZ";
    --overflowFlagAlu <= addOverFlag;
end if;

if op = "0001" then --SUB
    aluOut2 <= subOut; 
    aluOut1 <= "ZZZZZZZZZZZZZZZZ";
    --overflowFlagAlu <= subOverFlag;
end if;

if op = "0010" then --INC
    aluOut2 <= incOut; 
    aluOut1 <= "ZZZZZZZZZZZZZZZZ";
    --overflowFlagAlu <= incOverFlag;
end if;

if op = "0011" then --DEC
    aluOut2 <= decOut; 
    aluOut1 <= "ZZZZZZZZZZZZZZZZ";
    --overflowFlagAlu <= decOverFlag;
end if;

if op = "0100" then --MUL
    aluOut1 <= mulOut(31 downto 16); 
    aluOut2 <= mulOut(15 downto 0);
end if;

if op = "0101" then --DIV
    aluOut1 <= quot; 
    aluOut2 <= remin;
    --errorFlagAlu <= errFlag;
end if;

if op = "0110" then --AND
    aluOut2 <= andOut; 
    aluOut1 <= "ZZZZZZZZZZZZZZZZ";
end if;

if op = "0111" then --OR
    aluOut2 <= orOut; 
    aluOut1 <= "ZZZZZZZZZZZZZZZZ";
end if;

if op = "1000" then --NOT
    aluOut2 <= notOut; 
    aluOut1 <= "ZZZZZZZZZZZZZZZZ";
end if;

if op = "1001" then --NEG
    aluOut2 <= negOut;
    aluOut1 <= "ZZZZZZZZZZZZZZZZ";
end if;

if op = "1010" then --ROL
    aluOut2 <= rolOut;
    aluOut1 <= "ZZZZZZZZZZZZZZZZ";
end if;

if op = "1011" then --ROR
    aluOut2 <= rorOut;
    aluOut1 <= "ZZZZZZZZZZZZZZZZ";
end if;
end process;

errorFlag <= errorFlagAlu;
overflowFlag <= overflowFlagAlu;
output1 <= regOut1;
output2 <= regOut2;

end Behavioral;
