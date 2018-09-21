----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:46 08/28/2018 
-- Design Name: 
-- Module Name:    fullAdder - arqSomador	
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

entity fullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           carryIn : in  STD_LOGIC;
           s : out  STD_LOGIC;
           carryOut : out  STD_LOGIC);
end fullAdder;

architecture arqSomador of fullAdder is

begin

	carryOut <= (a AND b) OR (a AND carryIn) OR (b AND carryIn);
	s <= a XOR b XOR carryIn;

end arqSomador;

