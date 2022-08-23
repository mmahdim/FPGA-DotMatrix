
-- VHDL Instantiation Created from source file num_decode.vhd -- 11:18:20 11/09/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT num_decode
	PORT(
		numin : IN std_logic_vector(3 downto 0);
		horizontal : IN std_logic_vector(7 downto 0);
		clk_in : IN std_logic;          
		rout : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_num_decode: num_decode PORT MAP(
		numin => ,
		rout => ,
		horizontal => ,
		clk_in => 
	);


