-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  two-bit adder.
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(31 downto 0); 
       	output_vector: out std_logic_vector(31 downto 0));
end entity;

architecture DutWrap of DUT is

component Toplevel is
   port(a , b: in std_logic_vector(15 downto 0); 
       	p : out std_logic_vector(31 downto 0));
end component Toplevel;

begin

dut: Toplevel port map( a => input_vector(31 downto 16), b => input_vector(15 downto 0) ,
             p => output_vector);
end DutWrap;

