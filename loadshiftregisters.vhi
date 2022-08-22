
-- VHDL Instantiation Created from source file loadshiftregisters.vhd -- 10:15:29 11/02/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT loadshiftregisters
	PORT(
		CLK_IN : IN std_logic;          
		CLK_OUT : OUT std_logic;
		DATA : OUT std_logic;
		CURRENT_STATE : OUT std_logic_vector(3 downto 0);
		CURRENT_LED : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	Inst_loadshiftregisters: loadshiftregisters PORT MAP(
		CLK_IN => ,
		CLK_OUT => ,
		DATA => ,
		CURRENT_STATE => ,
		CURRENT_LED => 
	);


