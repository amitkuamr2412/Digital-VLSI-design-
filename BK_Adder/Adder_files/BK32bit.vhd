-----------------------------------------------
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity BK32Bit is
  port (a,b : in std_logic_vector(31 downto 0);
        cout: out std_logic_vector(31 downto 0 );
		  pi: out std_logic_vector(31 downto 0 )        --just simple p not group p
		 );
end entity BK32Bit;

architecture Behave of BK32Bit is
signal g,p  : std_logic_vector(31 downto 0) ;
signal temp1,temp2,temp3,temp4,temp5,temp6 : std_logic  ;

component BK16Bit is
  port (a,b : in std_logic_vector(15 downto 0);
        g_sig,p_sig: out std_logic_vector(15 downto 0 );
		  p_vec:  out std_logic_vector(15 downto 0 )
		 );
end component BK16Bit;

--component BK16MSB is
--  port (a,b : in std_logic_vector(15 downto 0);
--        g15,p15 : in std_logic ;
--        g_sig,p_sig: out std_logic_vector(15 downto 0 );
--		  p_vec:  out std_logic_vector(15 downto 0 )
--		  
--		 );
--end component BK16MSB;
component MSB16Bit is
  port (a,b : in std_logic_vector(15 downto 0);
        g15,p15: in std_logic ;
        g_sig,p_sig: out std_logic_vector(15 downto 0 );
		  p_vec:  out std_logic_vector(15 downto 0 )	  
		  );
end component MSB16Bit;

component groupPG is 
	port( g1,p1,g2,p2: in std_logic ;
           gout,pout : out std_logic) ;
end component groupPG;

begin 
  LSB16_carry: BK16Bit port map ( a => a(15 downto 0) , b => b(15 downto 0), g_sig => g(15 downto 0), p_sig => p(15 downto 0), p_vec => pi(15 downto 0))   ;
  cout(15 downto 0)  <= g(15 downto 0)  ;
  
  
  MSB16_carry: MSB16Bit port map ( a => a(31 downto 16), b => b(31 downto 16),g15 => g(15) , p15=> p(15), g_sig => g(31 downto 16), p_sig => p(31 downto 16), p_vec => pi(31 downto 16) ) ;
  cout(31 downto 16) <= g(31 downto 16) ;
--
--  MSB16_carry: BK16Bit port map ( a => a(31 downto 16) , b => b(31 downto 16), g_sig => g(31 downto 16), p_sig => p(31 downto 16), p_vec => pi(31 downto 16))   ;
-- cout(31 downto 19)  <= g(31 downto 19)  ;
--  
--  carry_16thbit: groupPG port map ( g1 => g(15) , p1 => p(15) , g2 => g(16), p2 => p(16), gout => temp1, pout =>temp2 ) ;
--  cout(16) <= temp1 ;
--  carry_17thbit: groupPG port map ( g1 => g(16) , p1 => p(16) , g2 => g(17), p2 => p(17), gout => temp3, pout =>temp4 ) ;
--  cout(17) <= temp3 ;
--  carry_18thbit: groupPG port map ( g1 => g(17) , p1 => p(17) , g2 => g(18), p2 => p(18), gout => temp5, pout =>temp6 ) ;
--  cout(18) <= temp5 ;

 end Behave;




