
-- VHDL Instantiation Created from source file Shift_Registers.vhd -- 23:37:22 11/14/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Shift_Registers
	PORT(
		Data_In : IN std_logic_vector(7 downto 0);
		clk_in : IN std_logic;          
		First_byte : OUT std_logic_vector(7 downto 0);
		Second_byte : OUT std_logic_vector(7 downto 0);
		Third_byte : OUT std_logic_vector(7 downto 0);
		Forth_byte : OUT std_logic_vector(7 downto 0);
		Fifth_byte : OUT std_logic_vector(7 downto 0);
		Sixth_byte : OUT std_logic_vector(7 downto 0);
		Seventh_byte : OUT std_logic_vector(7 downto 0);
		Eighth_byte : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_Shift_Registers: Shift_Registers PORT MAP(
		Data_In => ,
		clk_in => ,
		First_byte => ,
		Second_byte => ,
		Third_byte => ,
		Forth_byte => ,
		Fifth_byte => ,
		Sixth_byte => ,
		Seventh_byte => ,
		Eighth_byte => 
	);


