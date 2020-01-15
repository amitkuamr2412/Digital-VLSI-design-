-----------------------------------------------
library std;
use std.standard.all;
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity Dadda is
  port (a,b: in std_logic_vector(15 downto 0);
         prod1,prod2: out std_logic_vector(31 downto 0)
			);
end entity Dadda;

architecture Behave of Dadda is

signal s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15 : std_logic_vector(15 downto 0) ;  -----Initial partial products

signal s1_1  : std_logic_vector(30 downto 0)  ;
signal s1_2  : std_logic_vector(29 downto 1)  ;
signal s1_3  : std_logic_vector(28 downto 2)  ;
signal s1_4  : std_logic_vector(27 downto 3)  ;
signal s1_5  : std_logic_vector(26 downto 4)  ;
signal s1_6  : std_logic_vector(25 downto 5)  ;
signal s1_7  : std_logic_vector(24 downto 6)  ;
signal s1_8  : std_logic_vector(23 downto 7)  ;
signal s1_9  : std_logic_vector(22 downto 8)  ;
signal s1_10 : std_logic_vector(21 downto 9)  ;
signal s1_11 : std_logic_vector(20 downto 10) ;
signal s1_12 : std_logic_vector(19 downto 11) ;
signal s1_13 : std_logic_vector(19 downto 12) ;


signal s2_1  : std_logic_vector(30 downto 0)  ;
signal s2_2  : std_logic_vector(29 downto 1)  ;
signal s2_3  : std_logic_vector(28 downto 2)  ;
signal s2_4  : std_logic_vector(27 downto 3)  ;
signal s2_5  : std_logic_vector(26 downto 4)  ;
signal s2_6  : std_logic_vector(25 downto 5)  ;
signal s2_7  : std_logic_vector(24 downto 6)  ;
signal s2_8  : std_logic_vector(23 downto 7)  ;
signal s2_9  : std_logic_vector(23 downto 8)  ;


signal s3_1  : std_logic_vector(30 downto 0)  ;
signal s3_2  : std_logic_vector(29 downto 1)  ;
signal s3_3  : std_logic_vector(28 downto 2)  ;
signal s3_4  : std_logic_vector(27 downto 3)  ;
signal s3_5  : std_logic_vector(26 downto 4)  ;
signal s3_6  : std_logic_vector(26 downto 5)  ;


signal s4_1  : std_logic_vector(30 downto 0)  ;
signal s4_2  : std_logic_vector(29 downto 1)  ;
signal s4_3  : std_logic_vector(28 downto 2)  ;
signal s4_4  : std_logic_vector(28 downto 3)  ;


signal s5_1  : std_logic_vector(30 downto 0)  ;
signal s5_2  : std_logic_vector(29 downto 1)  ;
signal s5_3  : std_logic_vector(29 downto 2)  ;

signal s6_1  : std_logic_vector(30 downto 0)  ;
signal s6_2  : std_logic_vector(30 downto 1)  ;


--------------------Components-----------------------------
component and16 is
  port (a: in std_logic_vector(15 downto 0);
        b: in std_logic;
		  c: out std_logic_vector(15 downto 0)
		  );
end component and16;

component FA_sum is
  port (a, b, c: in std_logic;
         d: out std_logic);
end component FA_sum;

component FA_carry is
  port (a, b, c: in std_logic;
        d: out std_logic);
end component FA_carry;


component HA_carry is
  port (a, b: in std_logic;
         c: out std_logic);
end component HA_carry;

component HA_sum is
  port (a, b: in std_logic;
         c: out std_logic);
end component HA_sum;

--------------------------------------------------------------------
begin

--------Stage 0 
----Creating all partial products for stage 0

s_01: and16 port map ( a => a, b => b(0)  , c => s0)  ;
s_02: and16 port map ( a => a, b => b(1)  , c => s1)  ;
s_03: and16 port map ( a => a, b => b(2)  , c => s2)  ; 
s_04: and16 port map ( a => a, b => b(3)  , c => s3)  ;
s_05: and16 port map ( a => a, b => b(4)  , c => s4)  ;
s_06: and16 port map ( a => a, b => b(5)  , c => s5)  ;
s_07: and16 port map ( a => a, b => b(6)  , c => s6)  ;
s_08: and16 port map ( a => a, b => b(7)  , c => s7)  ;
s_09: and16 port map ( a => a, b => b(8)  , c => s8)  ;
s_10: and16 port map ( a => a, b => b(9)  , c => s9)  ;
s_11: and16 port map ( a => a, b => b(10) , c => s10) ;
s_12: and16 port map ( a => a, b => b(11) , c => s11) ;
s_13: and16 port map ( a => a, b => b(12) , c => s12) ;
s_14: and16 port map ( a => a, b => b(13) , c => s13) ;
s_15: and16 port map ( a => a, b => b(14) , c => s14) ;
s_16: and16 port map ( a => a, b => b(15) , c => s15) ;

-------------------------------------------------------------------------------------------
-----/////////////////-----Stage 1-----------/////////////////------------------------------

-------Stage 1 Row 1 -------------------

   loop1: for i in 0 to 12 generate 
 begin 
    s1_1(i)  <= s0(i)  ;
 end generate loop1;

S1_1_13 : HA_sum port map (a => s0(13),b =>  s1(12),c =>  s1_1(13))               ;

S1_1_14 : FA_sum port map (a => s0(14),b =>  s1(13),c =>  s2(12),d => s1_1(14) ) ;
S1_1_15 : FA_sum port map (a => s0(15),b =>  s1(14),c =>  s2(13),d => s1_1(15) ) ;
S1_1_16 : FA_sum port map (a => s1(15),b =>  s2(14),c =>  s3(13),d => s1_1(16) ) ;
S1_1_17 : FA_sum port map (a => s2(15),b =>  s3(14),c =>  s4(13),d => s1_1(17) ) ;
S1_1_18 : FA_sum port map (a => s3(15),b =>  s4(14),c =>  s5(13),d => s1_1(18) ) ;

s1_1(19) <= s4(15)  ;
s1_1(20) <= s5(15)  ;
s1_1(21) <= s6(15)  ;
s1_1(22) <= s7(15)  ;
s1_1(23) <= s8(15)  ;
s1_1(24) <= s9(15)  ;
s1_1(25) <= s10(15) ;
s1_1(26) <= s11(15) ;
s1_1(27) <= s12(15) ;
s1_1(28) <= s13(15) ;
s1_1(29) <= s14(15) ;
s1_1(30) <= s15(15) ;

--------------Stage 1 Row 2---------------------------

loop2: for i in 1 to 12 generate 
begin 
  s1_2(i)  <= s1(i-1)  ; 
end generate loop2;


s1_2(13) <=s2(11) ;
 
 
S1_2_14 : HA_carry port map (a => s0(13),b =>  s1(12),c =>  s1_2(14))               ;
S1_2_15 : FA_carry port map (a => s0(14),b =>  s1(13),c =>  s2(12), d => s1_2(15) ) ;
S1_2_16 : FA_carry port map (a => s0(15),b =>  s1(14),c =>  s2(13), d => s1_2(16) ) ;
S1_2_17 : FA_carry port map (a => s1(15),b =>  s2(14),c =>  s3(13), d => s1_2(17) ) ;
S1_2_18 : FA_carry port map (a => s2(15),b =>  s3(14),c =>  s4(13), d => s1_2(18) ) ;
S1_2_19 : FA_carry port map (a => s3(15),b =>  s4(14),c =>  s5(13), d => s1_2(19) ) ;


s1_2(20) <= s6(14)  ;
s1_2(21) <= s7(14)  ;
s1_2(22) <= s8(14)  ;
s1_2(23) <= s9(14)  ;
s1_2(24) <= s10(14) ;
s1_2(25) <= s11(14) ;
s1_2(26) <= s12(14) ;
s1_2(27) <= s13(14) ;
s1_2(28) <= s14(14) ;
s1_2(29) <= s15(14) ;

--------------------Stage 1 Row 3------------------------

loop3: for i in 2 to 12 generate 
begin 
  s1_3(i)  <= s2(i-2)  ; 
end generate loop3;


s1_3(13) <= s3(10) ;

S1_3_14 : HA_sum port map (a => s3(11),b =>  s4(10),c =>  s1_3(14) )              ;
S1_3_15 : FA_sum port map (a => s3(12),b =>  s4(11),c =>  s5(10), d => s1_3(15) ) ;
S1_3_16 : FA_sum port map (a => s4(12),b =>  s5(11),c =>  s6(10), d => s1_3(16) ) ;
S1_3_17 : FA_sum port map (a => s5(12),b =>  s6(11),c =>  s7(10), d => s1_3(17) ) ;

s1_3(18) <= s6(12)  ;
s1_3(19) <= s5(14)  ;

s1_3(20) <= s7(13)  ;
s1_3(21) <= s8(13)  ;
s1_3(22) <= s9(13)  ;
s1_3(23) <= s10(13) ;
s1_3(24) <= s11(13) ;
s1_3(25) <= s12(13) ;
s1_3(26) <= s13(13) ;
s1_3(27) <= s14(13) ;
s1_3(28) <= s15(13) ;

---------------Stage 1 Row 4 ---------------------------

loop4: for i in 3 to 12 generate 
begin 
  s1_4(i)  <= s3(i-3)  ; 
end generate loop4;

s1_4(13) <= s4(9) ;
s1_4(14) <= s5(9) ;

S1_4_15 : HA_carry port map (a => s3(11),b =>  s4(10),c =>  s1_4(15) )              ;
S1_4_16 : FA_carry port map (a => s3(12),b =>  s4(11),c =>  s5(10), d => s1_4(16) ) ;
S1_4_17 : FA_carry port map (a => s4(12),b =>  s5(11),c =>  s6(10), d => s1_4(17) ) ;
S1_4_18 : FA_carry port map (a => s5(12),b =>  s6(11),c =>  s7(10), d => s1_4(18) ) ;

s1_4(19) <= s6(13)  ;   

s1_4(20) <= s8(12)  ;
s1_4(21) <= s9(12)  ;
s1_4(22) <= s10(12) ;
s1_4(23) <= s11(12) ;
s1_4(24) <= s12(12) ;
s1_4(25) <= s13(12) ;
s1_4(26) <= s14(12) ;
s1_4(27) <= s15(12) ;

--------Stage 1 Row 5 -----------------------

loopz4: for i in 4 to 12 generate
begin 
  s1_5(i)  <= s4(i-4)  ; 
end generate loopz4;
--
s1_5(13) <= s5(8) ; 
s1_5(14) <= s6(8) ;

S1_5_15 : HA_sum port map (a => s6(9),b =>  s7(8),c =>  s1_5(15) )  ;
S1_5_16 : HA_sum port map (a => s7(9),b =>  s8(8),c =>  s1_5(16) )  ;

s1_5(17) <= s8(9)   ; 
s1_5(18) <= s7(11)  ;
s1_5(19) <= s7(12)  ; 

s1_5(20) <= s9(11)  ;
s1_5(21) <= s10(11) ;
s1_5(22) <= s11(11) ;
s1_5(23) <= s12(11) ;
s1_5(24) <= s13(11) ;
s1_5(25) <= s14(11) ;
s1_5(26) <= s15(11) ;

--------Stage 1 Row 6 -----------------------
loop5: for i in 5 to 12 generate 
begin 
  s1_6(i)  <= s5(i-5)  ; 
end generate loop5;

s1_6(13) <= s6(7)  ; 
s1_6(14) <= s7(7)  ;
s1_6(15) <= s8(7)  ;

S1_6_16 : HA_carry port map (a => s6(9),b =>  s7(8),c =>  s1_6(16) )  ;
S1_6_17 : HA_carry port map (a => s7(9),b =>  s8(8),c =>  s1_6(17) )  ;

s1_6(18) <= s8(10) ;
s1_6(19) <= s8(11) ;

s1_6(20) <= s10(10) ;
s1_6(21) <= s11(10) ;
s1_6(22) <= s12(10) ;
s1_6(23) <= s13(10) ;
s1_6(24) <= s14(10) ;
s1_6(25) <= s15(10) ;

------------------------------------------------
----------Row 7---------------------------------
loop7x: for i in 6 to 12 generate 
begin 
  s1_7(i)  <= s6(i-6)  ; 
end generate loop7x;

s1_7(13) <= s7(6)  ; 
s1_7(14) <= s8(6)  ;
s1_7(15) <= s9(6)  ;

s1_7(16) <= s9(7)  ;
s1_7(17) <= s9(8)  ;
s1_7(18) <= s9(9)  ;
s1_7(19) <= s9(10) ;

s1_7(20) <= s11(9) ;
s1_7(21) <= s12(9) ;
s1_7(22) <= s13(9) ;
s1_7(23) <= s14(9) ;
s1_7(24) <= s15(9) ;

----------Row 8---------------------------------

loop8x: for i in 7 to 12 generate 
begin 
  s1_8(i)  <= s7(i-7)  ; 
end generate loop8x;

s1_8(13) <= s8(5)  ; 
s1_8(14) <= s9(5)  ;
s1_8(15) <= s10(5)  ;

s1_8(16) <= s10(6)  ;
s1_8(17) <= s10(7)  ;
s1_8(18) <= s10(8) ;
s1_8(19) <= s10(9) ;


s1_8(20) <= s12(8) ;
s1_8(21) <= s13(8) ;
s1_8(22) <= s14(8) ;
s1_8(23) <= s15(8) ;

----------Row 9--------------------------------

s1_9(8)  <= s8(0)  ;
s1_9(9)  <= s8(1)  ;
s1_9(10)  <= s8(2)  ;
s1_9(11)  <= s8(3)  ;
s1_9(12) <= s8(4)  ;

s1_9(13) <=  s9(4)  ; 
s1_9(14) <= s10(4)  ;
s1_9(15) <= s11(4)  ;

s1_9(16) <= s11(5)  ;
s1_9(17) <= s11(6)  ;
s1_9(18) <= s11(7) ;
s1_9(19) <= s11(8) ;

s1_9(20) <= s13(7) ;
s1_9(21) <= s14(7) ;
s1_9(22) <= s15(7) ;

----------Row 10--------------------------------

s1_10(9)   <= s9(0)  ; 
s1_10(10)  <= s9(1)  ; 
s1_10(11)  <= s9(2)  ;
s1_10(12)  <= s9(3)  ;
  
s1_10(13) <= s10(3)  ; 
s1_10(14) <= s11(3)  ;
s1_10(15) <= s12(3)  ;

s1_10(16) <= s12(4)  ;
s1_10(17) <= s12(5)  ;
s1_10(18) <= s12(6) ;
s1_10(19) <= s12(7) ;
s1_10(20) <= s14(6) ;
s1_10(21) <= s15(6) ;


----------Row 11--------------------------------
s1_11(10)  <= s10(0)  ; 
s1_11(11)  <= s10(1)  ;
s1_11(12)  <= s10(2)  ;
  
s1_11(13) <= s11(2)  ; 
s1_11(14) <= s12(2)  ;
s1_11(15) <= s13(2)  ;

s1_11(16) <= s13(3)  ;
s1_11(17) <= s13(4)  ;
s1_11(18) <= s13(5) ;
s1_11(19) <= s13(6) ;

s1_11(20) <= s15(5) ;
----------Row 12--------------------------------

s1_12(11)  <= s11(0)  ;
s1_12(12)  <= s11(1)  ;
  
s1_12(13) <= s12(1)  ; 

s1_12(14) <= s13(1)  ;
s1_12(15) <= s14(1)  ;
s1_12(16) <= s14(2)  ;
s1_12(17) <= s14(3)  ;
s1_12(18) <= s14(4) ;
s1_12(19) <= s14(5) ;

----------Row 13--------------------------------

s1_13(12)  <= s12(0)  ;
  
s1_13(13) <= s13(0)  ; 
s1_13(14) <= s14(0)  ;

s1_13(15) <= s15(0)  ;
s1_13(16) <= s15(1)  ;
s1_13(17) <= s15(2)  ;
s1_13(18) <= s15(3) ;
s1_13(19) <= s15(4) ;



-------------------------------------------------

--------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
------------------------STAGE 2------------------------------------------------------------------------

loopx: for i in 0 to 8 generate 
begin 
  s2_1(i)  <= s1_1(i)  ; 
end generate loopx;

S2_1_9 : HA_sum port map (a => s1_1(9),b =>  s1_2(9),c =>  s2_1(9) )  ;

loopa: for i in 10 to 22 generate 
begin 
S2_1_FA : FA_sum port map (a => s1_1(i),b =>  s1_2(i),c =>s1_3(i) , d =>  s2_1(i) )  ;
end generate loopa;


loopb: for i in 23 to 30 generate 
begin 
  s2_1(i)  <= s1_1(i)  ;
end generate loopb;


---------------Row 2 ----------------------------------------------------------------

loopr2: for i in 1 to 8 generate 
begin 
  s2_2(i)  <= s1_2(i)  ; 
end generate loopr2;

s2_2(9) <= s1_3(9) ;

S2_2_10 : HA_carry port map (a => s1_1(9),b =>  s1_2(9),c =>  s2_2(10) )  ;

loopr22: for i in 10 to 22 generate 
begin 
S2_2_Fcarry : FA_carry port map (a => s1_1(i),b =>  s1_2(i),c =>s1_3(i) , d =>  s2_2(i+1) )  ;
end generate loopr22;



loopr23: for i in 24 to 29 generate 
begin 
  s2_2(i)  <= s1_2(i)  ; 
end generate loopr23;

---------------Row 3------------------------------------------
loopr3: for i in 2 to 8 generate 
begin 
  s2_3(i)  <= s1_3(i)  ; 
end generate loopr3;

s2_3(9) <= s1_4(9) ;


S2_3_10 : HA_sum port map (a => s1_4(10),b =>  s1_5(10),c =>  s2_3(10) )  ;

loopr3a: for i in 11 to 21 generate 
begin 
S2_3_FA : FA_sum port map (a => s1_4(i),b =>  s1_5(i),c =>s1_6(i) , d =>  s2_3(i) )  ;
end generate loopr3a;

s2_3(22) <= s1_4(22) ;
s2_3(23) <= s1_2(23) ;

loopr3b: for i in 24 to 28 generate 
begin 
  s2_3(i)  <= s1_3(i)  ; 
end generate loopr3b;
---------------------------------------------------------------
---------------Row 4-------------------------------------------
loopr4: for i in 3 to 8 generate 
begin 
  s2_4(i)  <= s1_4(i)  ; 
end generate loopr4;

s2_4(9) <= s1_5(9) ;
s2_4(10) <= s1_6(10) ;


S2_4_11 : HA_carry port map (a => s1_4(10),b =>  s1_5(10),c =>  s2_4(11) )  ;

loopr4a: for i in 11 to 21 generate 
begin 
S2_4_Fcarry : FA_carry port map (a => s1_4(i),b =>  s1_5(i),c =>s1_6(i) , d =>  s2_4(i+1) )  ;
end generate loopr4a;

s2_4(23) <= s1_3(23) ;

loopr4b: for i in 24 to 27 generate 
begin 
  s2_4(i)  <= s1_4(i)  ; 
end generate loopr4b;

---------------------------------------------------
-------------------------Row 5---------------------
loopr5: for i in 4 to 8 generate 
begin 
  s2_5(i)  <= s1_5(i)  ; 
end generate loopr5;

s2_5(9) <= s1_6(9) ;
s2_5(10) <= s1_7(10) ;


S2_5_11 : HA_sum port map (a => s1_7(11),b =>  s1_8(11),c =>  s2_5(11) )  ;

loopr5a: for i in 12 to 20 generate 
begin 
S2_5_FA : FA_sum port map (a => s1_7(i),b =>  s1_8(i),c =>s1_9(i) , d =>  s2_5(i) )  ;
end generate loopr5a;

s2_5(21) <= s1_7(21) ;
s2_5(22) <= s1_5(22) ;
s2_5(23) <= s1_4(23) ;

loopr5b: for i in 24 to 26 generate 
begin 
  s2_5(i)  <= s1_5(i)  ; 
end generate loopr5b;

--------------------------------------
-----------Row 6---------------------

loopr6: for i in 5 to 8 generate 
begin 
  s2_6(i)  <= s1_6(i)  ; 
end generate loopr6;

s2_6(9) <= s1_7(9) ;
s2_6(10) <= s1_8(10) ;
s2_6(11) <= s1_9(11) ;


S2_6_12 : HA_carry port map (a => s1_7(11),b =>  s1_8(11),c =>  s2_6(12) )  ;

loopr6a: for i in 12 to 20 generate 
begin 
S2_6_Fcarry : FA_carry port map (a => s1_7(i),b =>  s1_8(i),c =>s1_9(i) , d =>  s2_6(i+1) )  ;
end generate loopr6a;

s2_6(22) <= s1_6(22) ;
s2_6(23) <= s1_5(23) ;
s2_6(24) <= s1_6(24) ;
s2_6(25) <= s1_6(25) ;
------------------------------------------------------------------
--------------Row 7-------------------------------------------------

s2_7(6)  <= s1_7(6)  ; 
s2_7(7)  <= s1_7(7)  ; 
s2_7(8)  <= s1_7(8)  ; 

s2_7(9) <= s1_8(9)    ;
s2_7(10) <= s1_9(10)  ;
s2_7(11) <= s1_10(11) ;


S2_7_12 : HA_sum port map (a => s1_10(12),b =>  s1_11(12),c =>  s2_7(12) )  ;

loopr7a: for i in 13 to 19 generate 
begin 
S2_7_FA : FA_sum port map (a => s1_10(i),b =>  s1_11(i),c =>s1_12(i) , d =>  s2_7(i) )  ;
end generate loopr7a;

s2_7(20) <= s1_10(20) ;
s2_7(21) <= s1_8(21) ;

s2_7(22) <= s1_7(22) ;
s2_7(23) <= s1_6(23) ;

s2_7(24) <= s1_7(24) ;
--------------------------------------------------
--------------Row 8 ------------------------

s2_8(7)  <= s1_8(7)  ; 
s2_8(8)  <= s1_8(8)  ; 

s2_8(9) <= s1_9(9)    ;
s2_8(10) <= s1_10(10) ;
s2_8(11) <= s1_11(11) ;

s2_8(12) <= s1_12(12) ;

S2_8_13 : HA_carry port map (a => s1_10(12),b =>  s1_11(12),c =>  s2_8(13) )  ;

loopr8a: for i in 13 to 19 generate 
begin 
S2_8_FA : FA_carry port map (a => s1_10(i),b =>  s1_11(i),c =>s1_12(i) , d =>  s2_8(i+1) )  ;
end generate loopr8a;

s2_8(21) <= s1_9(21) ;
s2_8(22) <= s1_8(22) ;
s2_8(23) <= s1_7(23) ;
---------------------------------------------
--------------------Row 9---------------------

s2_9(8)  <= s1_9(8)   ; 
s2_9(9) <= s1_10(9)   ;
s2_9(10) <= s1_11(10) ;
s2_9(11) <= s1_12(11) ;

loopr9a: for i in 12 to 19 generate 
begin 
s2_9(i) <= s1_13(i) ;
end generate loopr9a;

s2_9(20) <= s1_11(20) ;
s2_9(21) <= s1_10(21) ;  
s2_9(22) <= s1_9(22)  ;
s2_9(23) <= s1_8(23)  ;

---------------------------------------------------------------------------------------------------------------
----\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-----STAGE 3 ----------------------------------------------

-------Row 1-----------------
loops3a: for i in 0 to 5 generate 
begin 
s3_1(i) <= s2_1(i) ;
end generate loops3a;

S3_1_6 : HA_sum port map (a => s2_1(6),b =>  s2_2(6),c =>  s3_1(6) )  ;

loops3b: for i in 7 to 25 generate 
begin 
S3_1_FA : FA_sum port map (a => s2_1(i),b =>  s2_2(i),c =>s2_3(i) , d =>  s3_1(i) )  ;
end generate loops3b;

loops3c: for i in 26 to 30 generate 
begin 
s3_1(i) <= s2_1(i) ;
end generate loops3c;

----------Row 2 --------------------------
loops32a: for i in 1 to 5 generate 
begin 
s3_2(i) <= s2_2(i) ;
end generate loops32a;

s3_2(6) <= s2_3(6) ;

S3_2_7 : HA_carry port map (a => s2_1(6),b =>  s2_2(6),c =>  s3_2(7) )  ;

loops32b: for i in 7 to 25 generate 
begin 
S3_2_Fcarry: FA_carry port map (a => s2_1(i),b =>  s2_2(i),c =>s2_3(i) , d =>  s3_2(i+1) )  ;
end generate loops32b;


s3_2(27) <= s2_2(27) ;
s3_2(28) <= s2_2(28) ;
s3_2(29) <= s2_2(29) ;

----------Row 3------------------------------------
loops33a: for i in 2 to 5 generate 
begin 
s3_3(i) <= s2_3(i) ;
end generate loops33a;

s3_3(6) <= s2_4(6) ;

S3_3_7 : HA_sum port map (a => s2_4(7),b =>  s2_5(7),c =>  s3_3(7) )  ;

loops33b: for i in 8 to 24 generate 
begin 
S3_3_FA: FA_sum port map (a => s2_4(i), b =>  s2_5(i), c =>s2_6(i), d =>  s3_3(i))  ;
end generate loops33b;

s3_3(25) <= s2_4(25) ;
s3_3(26) <= s2_2(26) ;
s3_3(27) <= s2_3(27) ;
s3_3(28) <= s2_3(28) ;
-------------------
-------------Row 4

loops34a: for i in 3 to 5 generate 
begin 
s3_4(i) <= s2_4(i) ;
end generate loops34a;

s3_4(6) <= s2_5(6) ;
s3_4(7) <= s2_6(7) ;

S3_4_8 : HA_carry port map (a => s2_4(7),b =>  s2_5(7),c =>  s3_4(8) )  ;

loops34b: for i in 8 to 24 generate 
begin 
S3_4_FC: FA_carry port map (a => s2_4(i), b =>  s2_5(i), c =>s2_6(i), d =>  s3_4(i+1))  ;
end generate loops34b;

s3_4(26) <= s2_3(26) ;
s3_4(27) <= s2_4(27) ;


-------------Row 5

loops35a: for i in 4 to 5 generate 
begin 
s3_5(i) <= s2_5(i) ;
end generate loops35a;

s3_5(6) <= s2_6(6) ;
s3_5(7) <= s2_7(7) ;

S3_5_8 : HA_sum port map (a => s2_7(8),b =>  s2_8(8),c =>  s3_5(8) )  ;

loops35b: for i in 9 to 23 generate 
begin 
S3_5_Fsum: FA_sum port map (a => s2_7(i), b =>  s2_8(i), c =>s2_9(i), d =>  s3_5(i))  ;
end generate loops35b;

s3_5(24) <= s2_7(24) ;
s3_5(25) <= s2_5(25) ;
s3_5(26) <= s2_4(26) ;
-------------------------------------------
-----------------Row 6---------------------
 
s3_6(5) <= s2_6(5) ;


s3_6(6) <= s2_7(6) ;
s3_6(7) <= s2_8(7) ;

s3_6(8) <= s2_9(8) ;

S3_6_9 : HA_carry port map (a => s2_7(8),b =>  s2_8(8),c =>  s3_6(9) )  ;

loops36b: for i in 9 to 23 generate 
begin 
S3_6_FC: FA_carry port map (a => s2_7(i), b =>  s2_8(i), c =>s2_9(i), d =>  s3_6(i+1))  ;
end generate loops36b;

s3_6(25) <= s2_6(25) ;
s3_6(26) <= s2_5(26) ;
----------------------------------------------------------------------------------------
-------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
------------STAGE 4

-------Row 1-----------------
loops4a: for i in 0 to 3 generate 
begin 
s4_1(i) <= s3_1(i) ;
end generate loops4a;

S4_1_4 : HA_sum port map (a => s3_1(4),b =>  s3_2(4),c =>  s4_1(4) )  ;

loops4b: for i in 5 to 27 generate 
begin 
S4_1_FA : FA_sum port map (a => s3_1(i),b =>  s3_2(i),c =>s3_3(i) , d =>  s4_1(i) )  ;
end generate loops4b;

loops4c: for i in 28 to 30 generate 
begin 
s4_1(i) <= s3_1(i) ;
end generate loops4c;

-------Row 2----------------
loops42: for i in 1 to 3 generate 
begin 
s4_2(i) <= s3_2(i) ;
end generate loops42;

s4_2(4) <= s3_3(4) ;

S4_2_5 : HA_carry port map (a => s3_1(4),b =>  s3_2(4),c =>  s4_2(5) )  ;

loops42a: for i in 5 to 27 generate 
begin 
S4_2_FC : FA_carry port map (a => s3_1(i), b =>  s3_2(i), c =>s3_3(i) , d =>  s4_2(i+1) )  ;
end generate loops42a;


s4_2(29) <= s3_2(29) ;
---------------------------------------
-----Row 3 


s4_3(2) <= s3_3(2) ;
s4_3(3) <= s3_3(3) ;

s4_3(4) <= s3_4(4) ;

S4_3_5 : HA_sum port map (a => s3_4(5),b =>  s3_5(5),c =>  s4_3(5) )  ;

loops43: for i in 6 to 26 generate 
begin 
S4_3_FA : FA_sum port map (a => s3_4(i), b =>  s3_5(i), c =>s3_6(i) , d =>  s4_3(i) )  ;
end generate loops43;

s4_3(27) <= s3_4(27) ;
s4_3(28) <= s3_2(28) ;

---------------------------------------
-----Row 4


s4_4(3) <= s3_4(3) ;

s4_4(4) <= s3_5(4) ;
s4_4(5) <= s3_6(5) ;

S4_4_6 : HA_carry port map (a => s3_4(5),b =>  s3_5(5),c =>  s4_4(6) )  ;

loops44: for i in 6 to 26 generate 
begin 
S4_4_FA : FA_carry port map (a => s3_4(i), b =>  s3_5(i), c =>s3_6(i) , d =>  s4_4(i+1) )  ;
end generate loops44;

s4_4(28) <= s3_3(28) ;


------------------------------------------------------
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-----------STAGE 5

-------Row 1-----------------
loops5a: for i in 0 to 2 generate 
begin 
s5_1(i) <= s4_1(i) ;
end generate loops5a;

S5_1_3 : HA_sum port map (a => s4_1(3),b =>  s4_2(3),c =>  s5_1(3) )  ;

loops5b: for i in 4 to 28 generate 
begin 
S5_1_FA : FA_sum port map (a => s4_1(i),b =>  s4_2(i), c =>s4_3(i) , d =>  s5_1(i) )  ;
end generate loops5b;

s5_1(29) <= s4_1(29) ;
s5_1(30) <= s4_1(30) ;
-------Row 2-----------------
loops52a: for i in 1 to 2 generate 
begin 
s5_2(i) <= s4_2(i) ;
end generate loops52a;

s5_2(3) <= s4_3(3) ;

S5_2_4 : HA_carry port map (a => s4_1(3),b =>  s4_2(3),c =>  s5_2(4) )  ;

loops52b: for i in 4 to 28 generate 
begin 
S5_2_FA : FA_carry port map (a => s4_1(i),b =>  s4_2(i),c =>s4_3(i) , d =>  s5_2(i+1) )  ;
end generate loops52b;

-----------Row 3 --------
s5_3(2) <= s4_3(2) ;

loops53: for i in 3 to 28 generate 
begin 
s5_3(i) <= s4_4(i) ;
end generate loops53;

s5_3(29) <= s4_2(29) ;

--------------------------------------------------
----------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-------\
---------------Stage 6
--------------------------Row 1 

s6_1(0) <= s5_1(0) ;
s6_1(1) <= s5_1(1) ;

S6_1_2 : HA_sum port map (a => s5_1(2),b =>  s5_2(2),c =>  s6_1(2) )  ;

loops6b: for i in 3 to 29 generate 
begin 
S6_1_FA : FA_sum port map (a => s5_1(i),b =>  s5_2(i),c =>s5_3(i) , d =>  s6_1(i) )  ;
end generate loops6b;


s6_1(30) <= s5_1(30) ;

------------------------------Row 2 

s6_2(1) <= s5_2(1) ;
s6_2(2) <= s5_3(2) ;

S6_2_3 : HA_carry port map (a => s5_1(2),b =>  s5_2(2),c =>  s6_2(3) )  ;

loops62: for i in 3 to 29 generate 
begin 
S6_1_FC : FA_carry port map (a => s5_1(i),b =>  s5_2(i),c =>s5_3(i) , d =>  s6_2(i+1) )  ;
end generate loops62;

-----------------------------------------------------------------------------------


prod1(31) <= '0' ;
prod1(30 downto 0) <= s6_1 ;

prod2(31) <= '0' ;
prod2(30 downto 1) <= s6_2 ;
prod2(0) <= '0' ;

end Behave;

------------------------------------------------------
