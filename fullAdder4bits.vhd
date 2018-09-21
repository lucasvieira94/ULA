----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:00 08/28/2018 
-- Design Name: 
-- Module Name:    fullAdder4bits - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fullAdder4bits is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
			  carryIn : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           carryOut : out  STD_LOGIC);
end fullAdder4bits;

architecture arqSomador4Bits of fullAdder4bits is

signal carry : STD_LOGIC_VECTOR (3 downto 0);

component fullAdder 
port (
			 a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          carryIn : in  STD_LOGIC;
          s : out  STD_LOGIC;
          carryOut : out  STD_LOGIC
);
end component fullAdder;

begin

y0: fullAdder port map (a(0), b(0), carryIn, s(0), carry(1));
y1: fullAdder port map (a(1), b(1), carry(1), s(1), carry(2));
y2: fullAdder port map (a(2), b(2), carry(2), s(2), carry(3));
y3: fullAdder port map (a(3), b(3), carry(3), s(3), carryOut);

end arqSomador4Bits;

