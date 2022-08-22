----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:21:52 11/14/2019 
-- Design Name: 
-- Module Name:    Shift_Registers - Behavioral 
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
library 	IEEE;
use 		IEEE.std_logic_1164.all;
use 		IEEE.numeric_std.all;
use 		IEEE.std_logic_unsigned.all;

entity Shift_Registers is
    Port ( Data_In 			: in   	 STD_LOGIC_VECTOR (3 downto 0);
           clk_in 			: in		 STD_LOGIC;
           First_number 	: buffer  STD_LOGIC_VECTOR (3 downto 0);
           Second_number 	: buffer  STD_LOGIC_VECTOR (3 downto 0);
           Third_number 	: buffer  STD_LOGIC_VECTOR (3 downto 0);
           Forth_number 	: buffer  STD_LOGIC_VECTOR (3 downto 0);
           Fifth_number 	: buffer  STD_LOGIC_VECTOR (3 downto 0);
           Sixth_number		: buffer  STD_LOGIC_VECTOR (3 downto 0);
           Seventh_number	: buffer  STD_LOGIC_VECTOR (3 downto 0);
           Eighth_number 	: buffer  STD_LOGIC_VECTOR (3 downto 0));
end Shift_Registers;

architecture Behavioral of Shift_Registers is

	SIGNAL All_Data			:	 	 	STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
	--SIGNAL temp_clock			: 			STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000000";

begin

	process (clk_in) begin
		if (rising_edge(clk_in)) then
			All_Data <= Data_in & First_number & Second_number & Third_number & Forth_number & Fifth_number & Sixth_number & Seventh_number;
			
			Eighth_number		<=	All_Data (3 downto 0);
			Seventh_number		<=	All_Data (7 downto 4);
			Sixth_number		<=	All_Data (11 downto 8);
			Fifth_number		<=	All_Data (15 downto 12);
			Forth_number		<=	All_Data (19 downto 16);
			Third_number		<=	All_Data (23 downto 20);
			Second_number		<=	All_Data (27 downto 24);
			First_number		<=	All_Data (31 downto 28);
			
		end if;
	end process;


end Behavioral;