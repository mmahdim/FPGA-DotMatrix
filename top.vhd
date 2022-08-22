----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:58 10/26/2019 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
--
----------------------------------------------------------------------------------
library 	IEEE;
use 		IEEE.std_logic_1164.all;
use 		IEEE.numeric_std.all;
use 		IEEE.std_logic_unsigned.all;


entity top is
    Port ( DOTMATRIX_DATA_IN 		: out 	STD_LOGIC;
           DOTMATRIX_CLK 			: out 	STD_LOGIC;
           DOTMATRIX_NCLR 			: out		STD_LOGIC;
           DOTMATRIX_R 				: buffer	STD_LOGIC_VECTOR (16 downto 1);
			  CLK_20M 					: in		STD_LOGIC;
			  row 						: out		STD_LOGIC_VECTOR (3 downto 0);
           column 					: in		STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

---------------------------COMPONENTS--------------------------

------keypad
COMPONENT keypad
PORT(
	keyin 			: IN  std_logic_vector(3 downto 0);
	clk 				: IN  std_logic;          
	keyout 			: OUT std_logic_vector(3 downto 0);
	number 			: OUT std_logic_vector(3 downto 0);
	key_changed  	: OUT std_logic
	);
END COMPONENT;
------shift registers
COMPONENT loadshiftregisters
PORT(
	CLK_IN 			: IN  std_logic;          
	CLK_OUT 			: OUT std_logic;
	DATA 				: OUT std_logic;
	CURRENT_STATE 	: OUT std_logic_vector(2 downto 0);
	CURRENT_LED 	: OUT std_logic_vector(1 downto 0)
	);
END COMPONENT;
------numdecode
COMPONENT num_decode
PORT(
	numin 			: IN std_logic_vector(3 downto 0);
	horizontal	 	: IN std_logic_vector(2 downto 0);
	clk_in 			: IN std_logic;          
	rout 				: OUT std_logic_vector(7 downto 0);
	empty_flag 		: IN std_logic
	);
END COMPONENT;
-------Shift Registers
COMPONENT Shift_Registers
PORT(
	Data_In 				: IN std_logic_vector(3 downto 0);
	clk_in 				: IN std_logic;          
	First_number 		: OUT std_logic_vector(3 downto 0);
	Second_number 		: OUT std_logic_vector(3 downto 0);
	Third_number 		: OUT std_logic_vector(3 downto 0);
	Forth_number 		: OUT std_logic_vector(3 downto 0);
	Fifth_number 		: OUT std_logic_vector(3 downto 0);
	Sixth_number 		: OUT std_logic_vector(3 downto 0);
	Seventh_number 	: OUT std_logic_vector(3 downto 0);
	Eighth_number 		: OUT std_logic_vector(3 downto 0)
	);
END COMPONENT;
------END COMPONENTS



--------------------------------SIGNALS-----------------------------

signal clk_temp 					: std_logic;
signal empty_flag 				: std_logic := '0';
signal block_num 					: std_logic_vector (1 downto 0);
signal col_num 					: std_logic_vector (2 downto 0);
signal r_down 						: std_logic_vector (7 downto 0) := "00000000";
signal r_up 						: std_logic_vector (7 downto 0) := "00000000";
--signal r_temp 						: std_logic_vector (7 downto 0);
signal number_temp0 				: std_logic_vector (3 downto 0) ;
signal number_temp1 				: std_logic_vector (3 downto 0) ;
signal keypad_input_number 	: std_logic_vector (3 downto 0) ;
signal new_key_pressed 			: std_logic;
signal First_number 				: std_logic_vector (3 downto 0) ;
signal Second_number 			: std_logic_vector (3 downto 0) ;
signal Third_number 				: std_logic_vector (3 downto 0) ;
signal Forth_number 				: std_logic_vector (3 downto 0) ;
signal Fifth_number 				: std_logic_vector (3 downto 0) ;
signal Sixth_number 				: std_logic_vector (3 downto 0) ;
signal Seventh_number 			: std_logic_vector (3 downto 0) ;
signal Eighth_number 			: std_logic_vector (3 downto 0) ;
------END SIGNALS


--------------------------BEGIN ARCHITECTURE-------------------------

begin

	DOTMATRIX_NCLR <= '1';
	DOTMATRIX_R <= r_down & r_up;

	--------------------------::BEGIN PROCESS::--------------------------
	process (CLK_20M) begin
	if (rising_edge(CLK_20M)) then

		if (block_num = "00") then 
			number_temp1 <= First_number;
			number_temp0 <= Fifth_number;
		elsif (block_num = "01") then
			number_temp1 <= Second_number;
			number_temp0 <= Sixth_number;
		elsif (block_num = "10") then
			number_temp1 <= Third_number;
			number_temp0 <= Seventh_number;
		elsif (block_num = "11") then
			number_temp1 <= Forth_number;
			number_temp0 <= Eighth_number;
		end if;
	end if;
	end process;



--------------------------INSTANTIATE--------------------------

	--loadshiftregisters
	Inst_loadshiftregisters: loadshiftregisters PORT MAP(
		CLK_IN 			=> 	CLK_20M,
		CLK_OUT 			=> 	DOTMATRIX_CLK,
		DATA 				=> 	clk_temp,
		CURRENT_STATE 	=> 	col_num,
		CURRENT_LED 	=> 	block_num
	);
	
	--keypad
	Inst_keypad: keypad PORT MAP(
		keyin 		=> 	column,
		keyout 		=> 	row,
		number 		=> 	keypad_input_number,
		clk 			=> 	CLK_20M,
		key_changed => 	new_key_pressed
	);
	
	--num_decode
	Inst_num_decode_DOWN: num_decode PORT MAP(
		numin 		=> 	number_temp0,
		rout 			=> 	r_down,
		horizontal 	=>	 	col_num,
		clk_in 		=> 	CLK_20M,
		empty_flag 	=> 	empty_flag
	);
	Inst_num_decode_UP: num_decode PORT MAP(
		numin 		=> 	number_temp1,
		rout 			=> 	r_up,
		horizontal 	=>	 	col_num,
		clk_in 		=> 	CLK_20M,
		empty_flag 	=> 	empty_flag
	);
	
	--shift_registers
	Inst_Shift_Registers: Shift_Registers PORT MAP(
		Data_In 				=> 	keypad_input_number,
		clk_in 				=> 	new_key_pressed,
		First_number 		=> 	First_number,
		Second_number 		=> 	Second_number,
		Third_number		=> 	Third_number,
		Forth_number 		=>	 	Forth_number,
		Fifth_number 		=> 	Fifth_number,
		Sixth_number 		=> 	Sixth_number,
		Seventh_number 	=> 	Seventh_number,
		Eighth_number 		=> 	Eighth_number
	);

DOTMATRIX_DATA_IN <= clk_temp;

end Behavioral;