library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
   
entity DivisionOp is
port(n, d: in std_logic_vector(15 downto 0);
divEn: in std_logic;
errFlag: out std_logic;
Q: out std_logic_vector(15 downto 0);
R: out std_logic_vector(15 downto 0));
end entity;
   
architecture Behavioral of DivisionOp is
begin
           
process(n, d, divEn)

variable qv, rv, x, y : std_logic_vector(15 downto 0);
variable i:integer;

begin
 
    qv := (others => '0');
    rv := (others => '0');
    x := n;
    y := d;
                   
    for i in 15 downto 0 loop
       rv := std_logic_vector(shift_left(unsigned(rv), 1));
       rv(0) := x(i);
       if rv >= y then
          rv := rv - y;
          qv(i) := '1';
       end if;                     
     end loop;
    

if divEn = '1' then
    if (d = x"0000") then errFlag <= '1'; Q <= "ZZZZZZZZZZZZZZZZ"; R <= "ZZZZZZZZZZZZZZZZ";
    else  Q <= qv; R <=rv; errFlag <= '0';
    end if;
else 
   Q <= "ZZZZZZZZZZZZZZZZ";
   R <= "ZZZZZZZZZZZZZZZZ";
end if;
         
end process;

end Behavioral;
