--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:41:27 09/18/2018
-- Design Name:   
-- Module Name:   /home/sd/Trabalho1/testRedutor.vhd
-- Project Name:  Trabalho1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: redutor
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
--USE ieee.numeric_std.ALL;
 
ENTITY testRedutor IS
END testRedutor;
 
ARCHITECTURE behavior OF testRedutor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT redutor
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal cout : std_logic;

   -- Clock period definitions
   constant clock_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: redutor PORT MAP (
          clock => clock,
          reset => reset,
          cout => cout
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
