-----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity and16 is
  port (a: in std_logic_vector(15 downto 0);
        b: in std_logic;
		  c: out std_logic_vector(15 downto 0)
		  );
end entity and16;

architecture Behave of and16 is    

signal sbar: std_logic_vector(15 downto 0);
 
 component NAND_2 is
 port (a, b: in std_logic;
         c: out std_logic);
 end component NAND_2;
 
 component Inverter is
  port (a: in std_logic;
         b: out std_logic);
 end component Inverter;

begin

   loop1: for i in 0 to 15 generate 
 begin 
  Nand_8: NAND_2 port map ( a => a(i) , b => b , c => sbar(i) ) ;
  Inv_8 : Inverter port map ( a => sbar(i) , b => c(i) ) ;
 end generate loop1;
  
end Behave;
----------------------------------------------------------------------------------
