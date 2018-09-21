----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:10 09/11/2018 
-- Design Name: 
-- Module Name:    contador10bits - Behavioral 
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
USE ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contador10bits is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (9 downto 0));
end contador10bits;

architecture Behavioral of contador10bits is
	CONSTANT nb: INTEGER := 9;

begin

	upcount: PROCESS(clock) 
		VARIABLE counter: UNSIGNED(nb DOWNTO 0):= "0000000000";
	BEGIN
		
		IF(clock'event AND clock='1') THEN
			IF reset='1' THEN
				counter := "0000000000";
			ELSE
				counter := counter + 1;
			END IF; -- IF reset='1'
			count <= std_logic_vector(counter);
		END IF; -- IF(clock'event AND clock='1')
	END PROCESS upcount;
end Behavioral;