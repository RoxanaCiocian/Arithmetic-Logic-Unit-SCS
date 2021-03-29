library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
   
entity MultiplicationOp is
port(x, y: in std_logic_vector(15 downto 0);
mulEn: in std_logic;
O: out std_logic_vector(31 downto 0));
end entity;
   
architecture Behavioral of MultiplicationOp is
--signal Output: std_logic_vector(31 downto 0);

begin
           
process(x, y, mulEn)
variable a: std_logic_vector(32 downto 0);
variable Output: std_logic_vector(31 downto 0);
variable s,p,d : std_logic_vector(15 downto 0);
variable i:integer;

begin
    a := (others => '0');
    s := y;
    d := x;
    a(16 downto 1) := x;
                   
    for i in 0 to 15 loop
       if(a(1) = '1' and a(0) = '0') then
          p := (a(32 downto 17));
          a(32 downto 17) := (p - s);
                         
        elsif(a(1) = '0' and a(0) = '1') then
          p := (a(32 downto 17));
          a(32 downto 17) := (p + s);
                         
        end if;
                     
        a(31 downto 0) := a(32 downto 1);
                     
     end loop;
    Output := a(32 downto 1);

if mulEn = '1' then
   O <= Output;
else O <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
end if;
                   
end process;

end Behavioral;
