-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  two-bit adder.
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(63 downto 0); 
   ---Note: for alu testing (17 downto 0) for others (15 downto 0)
       	output_vector: out std_logic_vector(31 downto 0));
end entity;

architecture DutWrap of DUT is

component BKadder is
  port (a,b : in std_logic_vector(31 downto 0);
        sum: out std_logic_vector(31 downto 0 ) 
		--  cout: out std_logic 		  
		 );
end component BKadder;



begin

dut: BKadder port map( a => input_vector(63 downto 32), b => input_vector(31 downto 0) ,
             sum => output_vector);
end DutWrap;

