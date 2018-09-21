--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:33:09 09/04/2018
-- Design Name:   
-- Module Name:   /home/sd/Trabalho1SD_ULA/testFullAdder4Bits.vhd
-- Project Name:  Trabalho1SD_ULA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fullAdder4bits
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY testFullAdder4bits IS
END testFullAdder4bits;
 
ARCHITECTURE behavior OF testFullAdder4bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fullAdder4bits
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         carryIn : IN  std_logic;
         s : OUT  std_logic_vector(3 downto 0);
         carryOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal carryIn : std_logic := '0';

 	--Outputs
   signal s : std_logic_vector(3 downto 0);
   signal carryOut : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fullAdder4bits PORT MAP (
          a => a,
          b => b,
          carryIn => carryIn,
          s => s,
          carryOut => carryOut
        );

   -- Clock process definitions
   --<clock>_process :process
   ---begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
 --  end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		
		carryIn <= '0';
		
		FOR i IN 0 TO 15 LOOP
		
			a <= std_logic_vector(to_unsigned(i,4));
			
			FOR j IN 0 TO 15 LOOP
				
				b <= std_logic_vector(to_unsigned(j,4));
				wait for 1 ns;
				
			END LOOP;
		END LOOP;
		
		wait for 1 ns;
		
		carryIn <= '1';
		
		FOR i IN 0 TO 15 LOOP
		
			a <= std_logic_vector(to_unsigned(i,4));
			
			FOR j IN 0 TO 15 LOOP
				
				b <= std_logic_vector(to_unsigned(j,4));
				wait for 1 ns;
				
			END LOOP;
		END LOOP;

      wait;
   end process;

END;
