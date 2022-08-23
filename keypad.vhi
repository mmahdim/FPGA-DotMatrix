
-- VHDL Instantiation Created from source file keypad.vhd -- 10:59:03 11/09/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT keypad
	PORT(
		keyin : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;          
		keyout : OUT std_logic_vector(3 downto 0);
		number : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_keypad: keypad PORT MAP(
		keyin => ,
		keyout => ,
		number => ,
		clk => 
	);


