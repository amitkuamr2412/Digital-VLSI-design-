library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity Toplevel is
   port(a , b: in std_logic_vector(15 downto 0); 
       	p : out std_logic_vector(31 downto 0));
end entity Toplevel;

architecture Wrap of Toplevel is

signal p1,p2 : std_logic_vector(31 downto 0);

component BKadder is
  port (a,b : in std_logic_vector(31 downto 0);
        sum: out std_logic_vector(31 downto 0 ) 
		  );
end component BKadder;

component Dadda is
  port (a,b: in std_logic_vector(15 downto 0);
         prod1,prod2: out std_logic_vector(31 downto 0)
			);
end component Dadda;


begin

dadda_multi: Dadda   port map (a => a,  b => b, prod1 => p1, prod2 => p2);
Adder_32b  : BKadder port map (a => p1, b => p2, sum => p) ;
end Wrap;

