----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2019 10:49:30 PM
-- Design Name: 
-- Module Name: Design_Lab_A - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
USE ieee.std_logic_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Design_Lab_A is
--  Port ( );
Port( SW :in STD_LOGIC_VECTOR (3 downto 0);
SW1 :in STD_LOGIC;
SW2 :in STD_LOGIC;
SW3 :in STD_LOGIC;
SW4 :in STD_LOGIC;
SW5 :in STD_LOGIC;
SW6 :in STD_LOGIC;
SW7 :in STD_LOGIC;


CLK : in STD_LOGIC;
LED :out STD_LOGIC_VECTOR(15 downto 0);
SSEG_AN : out STD_LOGIC_VECTOR (7 downto 0);
SSEG_CA : out STD_LOGIC_VECTOR (7 downto 0);
BTNU : in  STD_LOGIC;
BTND : in  STD_LOGIC;
BTNR : in  STD_LOGIC;
BTNL : in  STD_LOGIC
);
end Design_Lab_A;

architecture Behavioral of Design_Lab_A is
signal FFK : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal ANODE :  STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal BOB :  STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal BOB2 :  STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal BOB3 :  STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal Count : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
signal owait : STD_LOGIC_VECTOR (17 downto 0) := "111111111111111111";

signal leapYear : STD_LOGIC := '0';
signal ThoundYEAR : STD_LOGIC_VECTOR (3 downto 0) := "0001";--1
signal HundardYEAR : STD_LOGIC_VECTOR (3 downto 0) := "1001";--9
signal TenYEAR : STD_LOGIC_VECTOR (3 downto 0) := "1001";--9
signal OneYEAR : STD_LOGIC_VECTOR (3 downto 0) := "1001";--9

signal Month :  STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal TenMonth : STD_LOGIC_VECTOR (3 downto 0) := "0001";--1
signal OneMonth : STD_LOGIC_VECTOR (3 downto 0) := "0001";--1

signal TenDay : STD_LOGIC_VECTOR (3 downto 0) := "0011";--3
signal OneDay : STD_LOGIC_VECTOR (3 downto 0) := "0001";--1

signal SSEG_CA_temp : STD_LOGIC_VECTOR (7 downto 0);
begin process (CLK)
begin
if (clk='1' and clk'event) then
if  count = owait then

            --Month <= SW;
            FFK <= FFK + 1;
            leapYear <= SW4;
                BOB <= BOB + 1;
                BOB2 <= BOB2 + 1;
                count <= "000000000000000000";
                if FFK = "11111111" then
                 Month <= Month + 1;
                 FFK <= "00000000";
                 end if;
           end if;
         if count < owait then
          count <= count + 1 ;
           end if;
if (BOB = "1001") then
BOB <= "0001";
 end if;
 if (BOB2 = "1001") then
BOB2 <= "0001";
 end if;
end if;
case leapYear is
when '0' =>
ThoundYEAR <= "0001";--1
HundardYEAR <= "1001";--9
 TenYEAR <= "1001";--9
 OneYEAR <= "1001";--9
when '1' =>
ThoundYEAR <= "0010";--1
HundardYEAR <= "0000";--9
TenYEAR <= "0000";--9
OneYEAR <= "0000";

when others =>

end case;

case Month is 

when "0000" =>
OneMonth <= "0000";
TenMonth <= "0000";
TenDay<= "0000";
 OneDay <= "0000";
  LED <= "0000000000000000";
when "0001" =>
OneMonth <= "0001";
TenMonth <= "0000";
TenDay<= "0011";--3
 OneDay <= "0001";--1
   LED <= "0000000000000000";
when "0010" =>
OneMonth <= "0010";
TenMonth <= "0000";
  LED <= "0000000000000000";
case leapYear is
when '0' =>
TenDay<= "0010";--3
 OneDay <= "1000";--1
when '1' =>
TenDay<= "0010";--3
 OneDay <= "1001";--1
when others =>

end case;

when "0011" =>
OneMonth <= "0011";
TenMonth <= "0000";
TenDay<= "0011";--3
 OneDay <= "0001";--1
 LED <= "1111111111111111";
when "0100" =>
OneMonth <= "0100";
TenMonth <= "0000";
TenDay<= "0011";--3
 OneDay <= "0000";--0
   LED <= "0000000000000000";
when "0101" =>
OneMonth <= "0101";
TenMonth <= "0000";
TenDay<= "0011";--3
 OneDay <= "0001";--1
   LED <= "0000000000000000";
when "0110" =>
OneMonth <= "0110";
TenMonth <= "0000";
TenDay<= "0011";--3
 OneDay <= "0000";--1
   LED <= "0000000000000000";
when "0111" =>
OneMonth <= "0111";
TenMonth <= "0000";
TenDay<= "0011";--3
 OneDay <= "0001";--1
   LED <= "0000000000000000";
when "1000" =>
OneMonth <= "1000";
TenMonth <= "0000";
TenDay<= "0011";--3
 OneDay <= "0001";--1
   LED <= "0000000000000000";
when "1001" =>
OneMonth <= "1001";
TenMonth <= "0000";
TenDay<= "0011";--3
 OneDay <= "0000";--1
   LED <= "0000000000000000";
when "1010" =>
OneMonth <= "0000";
TenMonth <= "0001";
TenDay<= "0011";--3
 OneDay <= "0001";--1
   LED <= "0000000000000000";
when "1011" =>
OneMonth <= "0001";
TenMonth <= "0001";
TenDay<= "0011";--3
 OneDay <= "0000";--1
   LED <= "0000000000000000";
when "1100" =>
OneMonth <= "0010";
TenMonth <= "0001";
TenDay<= "0011";--3
 OneDay <= "0001";--1
   LED <= "0000000000000000";

when others =>
OneMonth <= "0000";
TenMonth <= "0000";
TenDay<= "0000";--3
 OneDay <= "0000";--1
   LED <= "0000000000000000";

end case;


	
	
case BOB2 is
when "0000" =>
BOB3 <= OneDay;
when "0001" =>
BOB3 <= OneDay;
when "0010" =>
BOB3 <= TenDay;
when "0011" =>
BOB3 <= OneMonth;
when "0100" =>
BOB3 <= TenMonth;
when "0101" =>
BOB3 <= OneYEAR ;
when "0110" =>
BOB3 <= TenYEAR;
when "0111" =>
BOB3 <= HundardYEAR;
when "1000" =>
BOB3 <= ThoundYEAR;
when others =>
BOB3 <= "1111"; ---null
end case;

case BOB3 is
when "0000" =>
SSEG_CA_temp <= "11000000"; ---0
when "0001" =>
SSEG_CA_temp <= "11111001"; ---1
when "0010" =>
SSEG_CA_temp <= "10100100"; ---2
when "0011" =>
SSEG_CA_temp <= "10110000"; ---3
when "0100" =>
SSEG_CA_temp <= "10011001"; ---4
when "0101" =>
SSEG_CA_temp <= "10010010"; ---5
when "0110" =>
SSEG_CA_temp <= "10000010"; ---6
when "0111" =>
SSEG_CA_temp <= "11111000"; ---7
when "1000" =>
SSEG_CA_temp <= "10000000"; ---8
when "1001" =>
SSEG_CA_temp <= "10010000"; ---9
when others =>
SSEG_CA_temp <= "11111111"; ---null
end case;



ANODE <= BOB;

case ANODE is
when "0000" =>
SSEG_AN <= "11111111"; ---0
SSEG_CA <= SSEG_CA_temp; ---null
when "0001" =>
SSEG_AN <= "11111110"; ---1
SSEG_CA <= SSEG_CA_temp; ---1 ---right most
when "0010" =>
SSEG_AN <= "11111101"; ---2
SSEG_CA <= SSEG_CA_temp; ---3

when "0011" =>
SSEG_AN <= "11111011"; ---3
SSEG_CA <= SSEG_CA_temp; ---2

when "0100" =>
SSEG_AN <= "11110111"; ---4
SSEG_CA <=SSEG_CA_temp; ---1

when "0101" =>
SSEG_AN <= "11101111"; ---5
SSEG_CA <= SSEG_CA_temp; ---9
when "0110" =>
SSEG_AN <= "11011111"; ---6
SSEG_CA <= SSEG_CA_temp; ---9
when "0111" =>
SSEG_AN <= "10111111"; ---7

SSEG_CA <= SSEG_CA_temp; ---9
when "1000" =>
SSEG_AN <= "01111111"; ---8
--left most
SSEG_CA <= SSEG_CA_temp; ---1
when others =>
SSEG_AN <= "11111111"; ---null`
SSEG_CA <="11111111"; ---null
end case;


end process;
end Behavioral;
