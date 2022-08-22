----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:11 11/09/2019 
-- Design Name: 
-- Module Name:    num_decode - Behavioral 
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

entity num_decode is
    Port ( numin : in  STD_LOGIC_VECTOR (3 downto 0);
			  empty_flag : in STD_LOGIC;
           rout : out  STD_LOGIC_VECTOR (7 downto 0);
           horizontal : in  STD_LOGIC_VECTOR (2 downto 0);
			  clk_in : in  STD_LOGIC);
end num_decode;

architecture Behavioral of num_decode is

begin

process (clk_in) begin 
if (rising_edge(clk_in)) then
if (empty_flag = '1') then 
	rout <= "00000000";
else
case numin is 
	when "0000" =>
		case horizontal is
			when "000" => 
				rout <= "00000000";
			when "001" => 
				rout <= "00000000";
			when "010" =>
				rout <= "00000000";
			when "011" =>
				rout <= "01111110";
			when "100" =>
				rout <= "01000010";
			when "101" =>
				rout <= "01000010";
			when "110" =>
				rout <= "01111110";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "0001" =>
		case horizontal is
			when "000" =>
				rout <= "00000000";
			when "001" =>
				rout <= "00000000";
			when "010" =>
				rout <= "00000100";
			when "011" =>
				rout <= "00000010";
			when "100" =>
				rout <= "01111110";
			when "101" =>
				rout <= "00000000";
			when "110" =>
				rout <= "00000000";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "0010" => 
		case horizontal is
			when "000" =>
				rout <= "00000000";
			when "001" =>
				rout <= "01110001";
			when "010" =>
				rout <= "01001001";
			when "011" =>
				rout <= "01001001";
			when "100" =>
				rout <= "01001001";
			when "101" =>
				rout <= "01000111";
			when "110" =>
				rout <= "00000000";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "0011" =>		--3		
		case horizontal is
			when "000" => 
				rout <= "00000000";
			when "001" => 
				rout <= "00000000";
			when "010" =>
				rout <= "00000000";
			when "011" =>
				rout <= "00101010";
			when "100" =>
				rout <= "00101010";
			when "101" =>
				rout <= "00101010";
			when "110" =>
				rout <= "00111110";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "0100" =>		--4
		case horizontal is
			when "000" => 
				rout <= "00000000";
			when "001" => 
				rout <= "00000000";
			when "010" =>
				rout <= "00001111";
			when "011" =>
				rout <= "00001000";
			when "100" =>
				rout <= "00001000";
			when "101" =>
				rout <= "00001000";
			when "110" =>
				rout <= "01111111";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "0101" =>		--5
		case horizontal is
			when "000" => 
				rout <= "00000000";
			when "001" => 
				rout <= "00000000";
			when "010" =>
				rout <= "01001111";
			when "011" =>
				rout <= "01001001";
			when "100" =>
				rout <= "01001001";
			when "101" =>
				rout <= "01001001";
			when "110" =>
				rout <= "01111001";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "0110" =>		--6
		case horizontal is
			when "000" => 
				rout <= "00000000";
			when "001" => 
				rout <= "00000000";
			when "010" =>
				rout <= "00000000";
			when "011" =>
				rout <= "01111110";
			when "100" =>
				rout <= "01010010";
			when "101" =>
				rout <= "01010010";
			when "110" =>
				rout <= "01110010";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "0111" =>		--7
		case horizontal is
			when "000" => 
				rout <= "00000000";
			when "001" => 
				rout <= "00000000";
			when "010" =>
				rout <= "00000000";
			when "011" =>
				rout <= "00000010";
			when "100" =>
				rout <= "00000010";
			when "101" =>
				rout <= "00000010";
			when "110" =>
				rout <= "01111110";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "1000" =>		--8
		case horizontal is
			when "000" => 
				rout <= "00000000";
			when "001" => 
				rout <= "00000000";
			when "010" =>
				rout <= "00000000";
			when "011" =>
				rout <= "01111110";
			when "100" =>
				rout <= "01001010";
			when "101" =>
				rout <= "01001010";
			when "110" =>
				rout <= "01111110";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "1001" =>		--9
		case horizontal is
			when "000" => 
				rout <= "00000000";
			when "001" => 
				rout <= "00000000";
			when "010" =>
				rout <= "01001111";
			when "011" =>
				rout <= "01001001";
			when "100" =>
				rout <= "01001001";
			when "101" =>
				rout <= "01001001";
			when "110" =>
				rout <= "01111111";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "1010" =>		--10 (A)
		case horizontal is
			when "000" => 
				rout <= "00000000";
			when "001" => 
				rout <= "00000000";
			when "010" =>
				rout <= "01111110";
			when "011" =>
				rout <= "00001010";
			when "100" =>
				rout <= "00001010";
			when "101" =>
				rout <= "00001010";
			when "110" =>
				rout <= "01111110";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "1011" =>	--11	(B)	
		case horizontal is
			when "000" => 
				rout <= "00000000";
			when "001" => 
				rout <= "00000000";
			when "010" =>
				rout <= "01111111";
			when "011" =>
				rout <= "01001001";
			when "100" =>
				rout <= "01001001";
			when "101" =>
				rout <= "00110110";
			when "110" =>
				rout <= "00000000";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "1100" => --12 (C)
		case horizontal is
			when "000" =>
				rout <= "00000000";
			when "001" =>
				rout <= "00000000";
			when "010" =>
				rout <= "01111110";
			when "011" =>
				rout <= "01000010";
			when "100" =>
				rout <= "01000010";
			when "101" =>
				rout <= "00100100";
			when "110" =>
				rout <= "00000000";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "1101" => --13 (D)
		case horizontal is
			when "000" =>
				rout <= "00000000";
			when "001" =>
				rout <= "00000000";
			when "010" =>
				rout <= "01111110";
			when "011" =>
				rout <= "01000010";
			when "100" =>
				rout <= "01000010";
			when "101" =>
				rout <= "00100100";
			when "110" =>
				rout <= "00011000";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "1110" =>		--14 (E)
		case horizontal is
			when "000" => 
				rout <= "00000000";
			when "001" => 
				rout <= "00000000";
			when "010" =>
				rout <= "00000000";
			when "011" =>
				rout <= "01111110";
			when "100" =>
				rout <= "01001010";
			when "101" =>
				rout <= "01001010";
			when "110" =>
				rout <= "01001010";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when "1111" => --15 (F)
		case horizontal is
			when "000" =>
				rout <= "00000000";
			when "001" =>
				rout <= "00000000";
			when "010" =>
				rout <= "01111110";
			when "011" =>
				rout <= "00001010";
			when "100" =>
				rout <= "00001010";
			when "101" =>
				rout <= "00001010";
			when "110" =>
				rout <= "00000010";
			when "111" =>
				rout <= "00000000";
			when others => 
				rout <= "00000000";
		end case;
	when others => 
		rout <= "00000000";
	end case;
end if; 
end if; 
end process;
end Behavioral;