-----------------------------------------------
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity BKadder is
  port (a,b : in std_logic_vector(31 downto 0);
        sum: out std_logic_vector(31 downto 0 ) 
		--  cout: out std_logic 		  
		 );
end entity BKadder;

architecture Behave of BKadder is

signal ci,pi : std_logic_vector(31 downto 0) ;

	component tinyXOR is
   port (a, b: in std_logic;
         c: out std_logic);
   end component tinyXOR;

component BK32Bit is
  port (a,b : in std_logic_vector(31 downto 0);
        cout: out std_logic_vector(31 downto 0 );
		  pi: out std_logic_vector(31 downto 0 )
		 );
end component BK32Bit;

begin 

carry_generatetion_stage: BK32Bit port map ( a => a , b => b , cout => ci, pi => pi ) ;

loop1: for i in 1 to 31 generate 
 begin 
  sum_bits: tinyXOR port map ( a => pi(i), b => ci(i-1) , c => sum(i) ) ;
 end generate loop1;
 
 sum0: tinyXOR port map ( a => a(0), b => b(0) , c => sum(0) ) ;
 
 end Behave;




