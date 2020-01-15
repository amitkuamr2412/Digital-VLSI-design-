-----------------------------------------------
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity MSB16Bit is
  port (a,b : in std_logic_vector(15 downto 0);
        g15,p15: in std_logic ;
        g_sig,p_sig: out std_logic_vector(15 downto 0 );
		  p_vec:  out std_logic_vector(15 downto 0 )	  
		  );
end entity MSB16Bit;

architecture Behave of MSB16Bit is

signal g0,p0 ,gout,pout  : std_logic_vector(15 downto 0) ;
signal g16,p16 : std_logic ;
signal gs1,ps1 : std_logic_vector(7 downto 0) ;
signal gs2,ps2 : std_logic_vector(3 downto 0) ;
signal gs3,ps3 : std_logic_vector(1 downto 0) ;
signal gs4,ps4 : std_logic_vector(1 downto 0) ;
signal gs5,ps5 : std_logic_vector(2 downto 0) ;

component P_gen is 
	port( x,y: in std_logic ;
           p : out std_logic) ;
end component P_gen;

component G_gen is 
	port( x,y: in std_logic ;
           g : out std_logic) ;
end component G_gen;

component groupPG is 
	port( g1,p1,g2,p2: in std_logic ;
           gout,pout : out std_logic) ;
end component groupPG;

begin 

-------------- P and G generation ------------------------------- 
 loop1: for i in 1 to 15 generate 
 begin 
  propagation1: P_gen port map ( x => a(i) , y => b(i) , p => p0(i) ) ;
  generation1 : G_gen port map ( x => a(i) , y => b(i) , g => g0(i) ) ;
 end generate loop1;
 ----------------------------------------------------------------------------
   
  propagation_adding: P_gen port map ( x => a(0) , y => b(0) , p => p16 ) ;
  generation_adding : G_gen port map ( x => a(0) , y => b(0) , g => g16 ) ;
  
  carry_16thbit: groupPG port map ( g1 => g15 , p1 => p15 , g2 => g16, p2 => p16, gout => g0(0), pout =>p0(0) ) ;

 
 ------------------ Groop PG Generation using Parallel Prefix for 16-bit Brent-Kung -------
 -----Stage 1 
 loop2: for i in 0 to 7 generate 
 begin 
  propagation_after_stage1: groupPG port map ( g1 => g0(2*i) , p1 => p0(2*i) , g2 => g0(2*i+1), p2 => p0(2*i+1), gout => gs1(i), pout =>ps1(i)) ;
 end generate loop2;
 
 -----Stage 2
 loop3: for i in 0 to 3 generate 
 begin 
  propagation_after_stage2: groupPG port map ( g1 => gs1(2*i) , p1 => ps1(2*i) , g2 => gs1(2*i+1), p2 => ps1(2*i+1), gout => gs2(i), pout =>ps2(i)) ;
 end generate loop3;
 
 -----Stage 3
 loop4: for i in 0 to 1 generate 
 begin 
  propagation_after_stage3: groupPG port map ( g1 => gs2(2*i) , p1 => ps2(2*i) , g2 => gs2(2*i+1), p2 => ps2(2*i+1), gout => gs3(i), pout =>ps3(i)) ;
 end generate loop4;
 
-----Stage 4

 propagation_after_stage4_1: groupPG port map ( g1 => gs3(0) , p1 => ps3(0) , g2 => gs3(1), p2 => ps3(1), gout => gs4(1), pout =>ps4(1)) ;
 propagation_after_stage4_0: groupPG port map ( g1 => gs3(0) , p1 => ps3(0) , g2 => gs2(2), p2 => ps2(2), gout => gs4(0), pout =>ps4(0)) ;
 
 ----Stage 5
 propagation_after_stage5_2: groupPG port map ( g2 => gs1(6) , p2 => ps1(6) , g1 => gs4(0), p1 => ps4(0), gout => gs5(2), pout =>ps5(2)) ;
 propagation_after_stage5_1: groupPG port map ( g2 => gs1(4) , p2 => ps1(4) , g1 => gs3(0), p1 => ps3(0), gout => gs5(1), pout =>ps5(1)) ;
 propagation_after_stage5_0: groupPG port map ( g2 => gs1(2) , p2 => ps1(2) , g1 => gs2(0), p1 => ps2(0), gout => gs5(0), pout =>ps5(0)) ;
 
 ----Allocating odd carries for using in even carries
gout(15) <= gs4(1) ;
gout(13) <= gs5(2) ;
gout(11) <= gs4(0) ;
gout(9)  <= gs5(1) ;
gout(7)  <= gs3(0) ;
gout(5)  <= gs5(0) ;
gout(3)  <= gs2(0) ;
gout(1)  <= gs1(0) ;

gout(0) <= g0(0) ;  --first carry
pout(0) <= p0(0) ;  --first carry

pout(15) <= ps4(1) ;
pout(13) <= ps5(2) ;
pout(11) <= ps4(0) ;
pout(9)  <= ps5(1) ;
pout(7)  <= ps3(0) ;
pout(5)  <= ps5(0) ;
pout(3)  <= ps2(0) ;
pout(1)  <= ps1(0) ;

----Stage 6
 loop5: for i in 1 to 7 generate 
 begin 
  propagation_after_stage6: groupPG port map ( g1 => gout(2*i-1) , p1 => pout(2*i-i) , g2 => g0(2*i), p2 => p0(2*i), gout => gout(2*i), pout =>pout(2*i)) ;
 end generate loop5;
 
 g_sig <= gout ;
 p_sig <= pout ;
 p_vec(15 downto 1) <= p0(15 downto 1) ;
 p_vec(0) <= p16;
 end Behave;
----------------------------------------------
------------------------------------------------
-------------------------------------------------
--library std;
--use std.standard.all;
--
--library ieee;
--use ieee.std_logic_1164.all;
--
--entity BK16MSB is
--  port (a,b : in std_logic_vector(15 downto 0);
--        g15,p15 : in std_logic ;
--        g_sig,p_sig: out std_logic_vector(15 downto 0 );
--		  p_vec:  out std_logic_vector(15 downto 0 )
--		  
--		 );
--end entity BK16MSB;
--
--architecture Behave of BK16MSB is
--
--signal g0,p0 ,gout,pout  : std_logic_vector(15 downto 0) ;
--signal gs1,ps1 : std_logic_vector(7 downto 0) ;
--signal gs2,ps2 : std_logic_vector(3 downto 0) ;
--signal gs3,ps3 : std_logic_vector(1 downto 0) ;
--signal gs4,ps4 : std_logic_vector(1 downto 0) ;
--signal gs5,ps5 : std_logic_vector(2 downto 0) ;
--
--component P_gen is 
--	port( x,y: in std_logic ;
--           p : out std_logic) ;
--end component P_gen;
--
--component G_gen is 
--	port( x,y: in std_logic ;
--           g : out std_logic) ;
--end component G_gen;
--
--component groupPG is 
--	port( g1,p1,g2,p2: in std_logic ;
--           gout,pout : out std_logic) ;
--end component groupPG;
--
--begin 
--
---------------- P and G generation ------------------------------- 
-- loop1: for i in 0 to 15 generate 
-- begin 
--  propagation1: P_gen port map ( x => a(i) , y => b(i) , p => p0(i) ) ;
--  generation1 : G_gen port map ( x => a(i) , y => b(i) , g => g0(i) ) ;
-- end generate loop1;
-- ----------------------------------------------------------------------------
-- 
-- ------------------ Groop PG Generation using Parallel Prefix for 16-bit Brent-Kung -------
-- -----Stage 1 
-- loop2: for i in 0 to 7 generate 
-- begin 
--  propagation_after_stage1: groupPG port map ( g1 => g0(2*i) , p1 => p0(2*i) , g2 => g0(2*i+1), p2 => p0(2*i+1), gout => gs1(i), pout =>ps1(i)) ;
-- end generate loop2;
-- 
-- -----Stage 2
-- loop3: for i in 0 to 3 generate 
-- begin 
--  propagation_after_stage2: groupPG port map ( g1 => gs1(2*i) , p1 => ps1(2*i) , g2 => gs1(2*i+1), p2 => ps1(2*i+1), gout => gs2(i), pout =>ps2(i)) ;
-- end generate loop3;
-- 
-- -----Stage 3
-- loop4: for i in 0 to 1 generate 
-- begin 
--  propagation_after_stage3: groupPG port map ( g1 => gs2(2*i) , p1 => ps2(2*i) , g2 => gs2(2*i+1), p2 => ps2(2*i+1), gout => gs3(i), pout =>ps3(i)) ;
-- end generate loop4;
-- 
-------Stage 4
--
-- propagation_after_stage4_1: groupPG port map ( g1 => gs3(0) , p1 => ps3(0) , g2 => gs3(1), p2 => ps3(1), gout => gs4(1), pout =>ps4(1)) ;
-- propagation_after_stage4_0: groupPG port map ( g1 => gs3(0) , p1 => ps3(0) , g2 => gs2(2), p2 => ps2(2), gout => gs4(0), pout =>ps4(0)) ;
-- 
-- ----Stage 5
-- propagation_after_stage5_2: groupPG port map ( g1 => gs1(6) , p1 => ps1(6) , g2 => gs4(0), p2 => ps4(0), gout => gs5(2), pout =>ps5(2)) ;
-- propagation_after_stage5_1: groupPG port map ( g1 => gs1(4) , p1 => ps1(4) , g2 => gs3(0), p2 => ps3(0), gout => gs5(1), pout =>ps5(1)) ;
-- propagation_after_stage5_0: groupPG port map ( g1 => gs1(2) , p1 => ps1(2) , g2 => gs2(0), p2 => ps2(0), gout => gs5(0), pout =>ps5(0)) ;
-- 
-- ----Allocating odd carries for using in even carries
--gout(15) <= gs4(1) ;
--gout(13) <= gs5(2) ;
--gout(11) <= gs4(0) ;
--gout(9)  <= gs5(1) ;
--gout(7)  <= gs3(0) ;
--gout(5)  <= gs5(0) ;
--gout(3)  <= gs2(0) ;
--gout(1)  <= gs1(0) ;
--
----gout(0) <= g0(0) ;  --first carry
----pout(0) <= p0(0) ;  --first carry
--
--carry_16thbit: groupPG port map ( g1 => g15 , p1 => p15 , g2 => g0(0), p2 => p0(0), gout => gout(0), pout =>pout(0) ) ;
--
--pout(15) <= ps4(1) ;
--pout(13) <= ps5(2) ;
--pout(11) <= ps4(0) ;
--pout(9)  <= ps5(1) ;
--pout(7)  <= ps3(0) ;
--pout(5)  <= ps5(0) ;
--pout(3)  <= ps2(0) ;
--pout(1)  <= ps1(0) ;
--
------Stage 6
-- loop5: for i in 1 to 7 generate 
-- begin 
--  propagation_after_stage6: groupPG port map ( g1 => gout(2*i-1) , p1 => pout(2*i-i) , g2 => g0(2*i), p2 => p0(2*i), gout => gout(2*i), pout =>pout(2*i)) ;
-- end generate loop5;
-- 
-- g_sig <= gout ;
-- p_sig <= pout ;
-- p_vec <= p0 ;
-- end Behave;
--
--
--

