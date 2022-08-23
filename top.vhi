
-- VHDL Instantiation Created from source file top.vhd -- 23:34:56 11/14/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT top
	PORT(
		CLK_20M : IN std_logic;
		column : IN std_logic_vector(3 downto 0);
		KEY0 : IN std_logic;          
		DOTMATRIX_DATA_IN : OUT std_logic;
		DOTMATRIX_CLK : OUT std_logic;
		DOTMATRIX_NCLR : OUT std_logic;
		DOTMATRIX_R : OUT std_logic_vector(16 downto 1);
		row : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_top: top PORT MAP(
		DOTMATRIX_DATA_IN => ,
		DOTMATRIX_CLK => ,
		DOTMATRIX_NCLR => ,
		DOTMATRIX_R => ,
		CLK_20M => ,
		row => ,
		column => ,
		KEY0 => 
	);


