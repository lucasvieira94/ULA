----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:10 09/11/2018 
-- Design Name: 
-- Module Name:    redutor - Behavioral 
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

entity redutor is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           cout : out  STD_LOGIC);
end redutor;

architecture Behavioral of redutor is

begin

	upcount: PROCESS(clock) 
		VARIABLE counter: INTEGER := 0;
	BEGIN
		
		IF(clock'event AND clock='1') THEN
			IF (reset='1' OR counter > 50_000_000)THEN
				counter := 0;
			ELSE	
				IF counter <= 25_000_000 THEN
					cout <= '0';
				ELSE 
					cout <= '1';
				END IF; -- counter
			counter := counter + 1;
			END IF; -- IF reset='1'
		END IF; -- IF(clock'event AND clock='1')
	END PROCESS upcount;
end Behavioral;