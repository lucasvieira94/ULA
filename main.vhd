----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:34 09/25/2018 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
    port ( clock : in  STD_LOGIC;
           oper : in  STD_LOGIC_VECTOR (2 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0);
			  --resultado : inout  STD_LOGIC_VECTOR (3 downto 0);
           selector : inout  STD_LOGIC_VECTOR (1 downto 0));
			  --flags : inout STD_LOGIC_VECTOR (3 downto 0));
end main;

architecture Behavioral of main is

signal clockReduzido : STD_LOGIC;
signal counter : STD_LOGIC_VECTOR(9 downto 0);
signal A : STD_LOGIC_VECTOR(3 downto 0);
signal B : STD_LOGIC_VECTOR(3 downto 0);
signal cB : STD_LOGIC_VECTOR(3 downto 0);
signal resultadoSoma: STD_LOGIC_VECTOR(3 downto 0);
signal resultadoSub: STD_LOGIC_VECTOR(3 downto 0);
signal seletorInterno : STD_LOGIC_VECTOR(1 downto 0);
signal carryOut : STD_LOGIC;
signal carryBorrow : STD_LOGIC;
signal borrowOut : STD_LOGIC;
signal zero : STD_LOGIC;
signal negativo : STD_LOGIC;
signal overflow : STD_LOGIC;
signal flags : STD_LOGIC_VECTOR (3 downto 0);
signal resultado : STD_LOGIC_VECTOR (3 downto 0);

component fullAdder4bits
port ( 	  a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
			  carryIn : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           carryOut : out  STD_LOGIC);
end component fullAdder4bits;

component redutor
port ( 	  clock : in  STD_LOGIC;
           cout : out  STD_LOGIC);
end component redutor;


component contador10bits
port ( 	  clock : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (9 downto 0));
end component contador10bits;

begin
		seletorInterno(0) <= counter(0);
		seletorInterno(1) <= counter(1);
		A(0) <= counter(2);
		A(1) <= counter(3);
		A(2) <= counter(4);
		A(3) <= counter(5);
		B(0) <= counter(6);
		B(1) <= counter(7);
		B(2) <= counter(8);
		B(3) <= counter(9);

	c0: redutor port map (clock, clockReduzido);
	c1: contador10bits port map (clockReduzido, counter);
	SUM: fullAdder4bits port map(A, B, '0', resultadoSoma, carryOut);	
	
	cB <= B WHEN (B = "0000")
	ELSE NOT(B);
	
	SUB: fullAdder4bits port map(A, cB, '1', resultadoSub, borrowOut);
	
	--upcount: PROCESS(clock) 
	--BEGIN
	
		resultado <= resultadoSoma WHEN (oper = "000")
			  ELSE resultadoSub WHEN (oper = "001")
			  ELSE (A AND B) WHEN (oper = "010")
			  ELSE (A OR B) WHEN (oper = "011")
			  ELSE (A NOR B) WHEN (oper = "100")
			  ELSE (A XOR B) WHEN (oper = "101")
			  ELSE (A XNOR B) WHEN (oper = "110")
			  ELSE (A NAND B);
			  
		carryBorrow <= NOT(borrowOut) WHEN (oper = "001")
			ELSE carryOut;		
			  
		zero <= '1' WHEN (resultado = "0000")
			ELSE '0';
			
		negativo <= '1' WHEN (resultado(3) = '1')
			ELSE '0';
		
		overflow <= '1' WHEN ((A(3) = B(3)) AND (resultado(3) = NOT(A(3))))
			ELSE '0';
			
		flags(0) <= carryBorrow;
		flags(1) <= zero;
		flags(2) <= negativo;
		flags(3) <= overflow;
		
		output <= A WHEN (seletorInterno = "00")
			else B WHEN(seletorInterno = "01")
			else resultado WHEN(seletorInterno = "10")
			else flags;
		
		selector <= seletorInterno;
		
	--END PROCESS upcount;	
end Behavioral;
