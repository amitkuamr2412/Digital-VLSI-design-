-----------------------------------------------------------------------
library std;
use std.standard.all;

------------------------------------------------------------------------------------------------
--//////////////////////////////////////Carry Propagation////////////////////////////////////////////////////////
-----------------------------------------Delay 200ps-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------
entity P_gen is 
	port( x,y: in std_logic ;
           p : out std_logic) ;
end entity P_gen;

architecture behave of P_gen is 	
	component tinyXOR is
   port (a, b: in std_logic;
         c: out std_logic);
   end component tinyXOR;

-----------------------------------------------			
begin 
propagation_generator: tinyXOR port map(a => x, b => y , c => p );

end behave;
------------------------------------------------------------------------------------------------
--//////////////////////////////////////////Carry Generation////////////////////////////////////////////////////
---------------------------------------------Delay 250ps---------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------
entity G_gen is 
	port( x,y: in std_logic ;
           g : out std_logic) ;
end entity G_gen;

architecture behave of G_gen is 
signal gbar : std_logic;
	
	component NAND_2 is
   port (a, b: in std_logic;
         c: out std_logic);
   end component NAND_2;
	
	component Inverter is
   port (a: in std_logic;
         b: out std_logic);
   end component Inverter;

-----------------------------------------------			
begin 

Carry_Generation: Nand_2 port map(a => x, b => y , c=> gbar);
inv: Inverter port map(a => gbar, b => g);

end behave;
-------------------------------------------------------------------------
-----------------------------Basic Cell for Bent-Kung--------------------
library ieee;
use ieee.std_logic_1164.all;
-------------------------------
entity groupPG is 
	port( g1,p1,g2,p2: in std_logic ;
           gout,pout : out std_logic) ;
end entity groupPG;

architecture behave of groupPG is 
	signal gbar,pbar : std_logic;
	
	component NAND_2 is
   port (a, b: in std_logic;
         c: out std_logic);
   end component NAND_2;
	
	component Inverter is
   port (a: in std_logic;
         b: out std_logic);
   end component Inverter;
	
	component Custom is
   port (a, b, c : in std_logic;
         d: out std_logic);
   end component Custom;

------------------------------		
begin 
g_new: Custom port map(a => g2, b =>g1, c => p2, d => gbar  );  --------g2+ g1*p2
inv1: Inverter port map(a => gbar, b => gout);        --Delay 300ps
 
p_new: Nand_2 port map(a => p1, b => p2 , c=> pbar);
inv2: Inverter port map(a => pbar, b => pout);        --Delay 250ps

end behave;

