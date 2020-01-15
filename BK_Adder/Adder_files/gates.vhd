-----------------------------------------------
library std;
use std.standard.all;
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity Inverter is
  port (a: in std_logic;
         b: out std_logic);
end entity Inverter;
architecture Behave of Inverter is
begin
  b <= not a after 100ps;   -----Delay of Iinverter gate
end Behave;

------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity NOR_2 is
  port (a, b: in std_logic;
         c: out std_logic);
end entity NOR_2;
architecture Behave of NOR_2 is
begin
  c <= not(a or b) after 150ps; -----Delay of NOR gate
end Behave;

--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity NAND_2 is
  port (a, b: in std_logic;
         c: out std_logic);
end entity NAND_2;
architecture Behave of NAND_2 is
begin
  c <= not (a and b)  after 150ps;   -----Delay of NAND gate
end Behave;

-----------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity tinyXOR is
  port (a, b: in std_logic;
         c: out std_logic);
end entity tinyXOR;
architecture Behave of tinyXOR is    
begin
  c <= (a xor b) after 200ps;   -----Delay of Tiny_XOR gate
end Behave;

------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity Custom is
  port (a, b, c : in std_logic;
         d: out std_logic);
end entity Custom;
architecture Behave of Custom is
begin
  d <= not(a or (b and c)) after 200ps;
end Behave;

--------------------------------------------------------

