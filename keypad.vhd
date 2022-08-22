----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:59 10/12/2019 
-- Design Name: 
-- Module Name:    keypad - Behavioral 
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

entity keypad is
    Port ( keyin			: in  		STD_LOGIC_VECTOR (3 downto 0);
           keyout			: buffer  	STD_LOGIC_VECTOR (3 downto 0);
           number			: buffer  	STD_LOGIC_VECTOR (3 downto 0);
			  clk				: in 			STD_LOGIC;
			  key_changed	: out 		STD_LOGIC
			 );
			  
end keypad;

architecture Behavioral of keypad is

	signal state 				: STD_LOGIC_VECTOR (1 downto 0) := "00";
	signal concat 				: STD_LOGIC_VECTOR (7 downto 0);
	signal last_key_temp	 	: STD_LOGIC_VECTOR (3 downto 0);
	signal key_changed_temp : std_logic;
	signal start_timer 		: std_logic := '0';
	signal timer 				: integer range 0 to 2000000 := 0;

begin

	concat 			<= keyout & keyin;


process (clk) begin
	if (rising_edge(clk)) then
	case state is 
		when "00" =>
			keyout <= "1110";
			state <= "01";
		when "01" => 
			keyout <= "1101";
			state <= "10";
		when "10" => 
			keyout <= "1011";
			state <= "11";
		when "11" => 
			keyout <= "0111";
			state <= "00";
		when others =>
	end case;
	
	case concat is
		when "11101110" => --00
			number <= x"0";
			key_changed_temp <= '1';
		when "11101101" => --01
			number <= x"1";
			key_changed_temp <= '1';
		when "11101011" => --02
			number <= x"2";
			key_changed_temp <= '1';
		when "11100111" => --03
			number <= x"3";
			key_changed_temp <= '1';
		when "11011110" => --04
			number <= x"4";
			key_changed_temp <= '1';
		when "11011101" => --05
			number <= x"5";
			key_changed_temp <= '1';
		when "11011011" => --06
			number <= x"6";
			key_changed_temp <= '1';
		when "11010111" => --07
			number <= x"7";
			key_changed_temp <= '1';
		when "10111110" => --08
			number <= x"8";
			key_changed_temp <= '1';
		when "10111101" => --09
			number <= x"9";
			key_changed_temp <= '1';
		when "10111011" => --10
			number <= x"A";
			key_changed_temp <= '1';
		when "10110111" => --11
			number <= x"B";
			key_changed_temp <= '1';
		when "01111110" => --12
			number <= x"C";
			key_changed_temp <= '1';
		when "01111101" => --13
			number <= x"D";
			key_changed_temp <= '1';
		when "01111011" => --14
			number <= x"E";
			key_changed_temp <= '1';
		when "01110111" => --15
			number <= x"F";
			key_changed_temp <= '1';
		when others =>
			key_changed_temp <= '0';
	end case;
	
	if (key_changed_temp = '1') then
		start_timer <= '1';
	end if;
	
	if (start_timer = '1') then
		timer <= timer + 1;
	end if;
	
	if (timer = 1999999) then
		key_changed <= '1';
		start_timer <= '0';
	else 
		key_changed <= '0';
	end if;
	end if;
end process;


end Behavioral;

