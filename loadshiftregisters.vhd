----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:01:06 11/02/2019 
-- Design Name: 
-- Module Name:    loadshiftregisters - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity loadshiftregisters is
    Port ( CLK_IN : in  STD_LOGIC;
           CLK_OUT : out  STD_LOGIC;
           DATA : out  STD_LOGIC;
           CURRENT_STATE : out  STD_LOGIC_VECTOR (2 downto 0);
           CURRENT_LED : out  STD_LOGIC_VECTOR (1 downto 0));
end loadshiftregisters;

architecture Behavioral of loadshiftregisters is

	signal counter : std_logic_vector (5 downto 1) := "00000";
	signal prescale : integer range 0 to 19 := 0;
	signal clk_temp : std_logic := '0';
	

begin

process (CLK_IN) begin
if (rising_edge(CLK_IN)) then
	if (counter = "000000") then
		DATA <= '1';
	else 
		DATA <= '0';
	end if;
	if (prescale = 9) then
		clk_temp <= not clk_temp;
	end if;
	prescale <= prescale + 1;
	CURRENT_STATE (2 downto 0) <= counter (3 downto 1);
	CURRENT_LED (1 downto 0) <= counter (5 downto 4);


end if;
end process;

process (clk_temp) begin
if (rising_edge(clk_temp)) then
		counter <= counter + "00001";
end if;
end process;

CLK_OUT <= clk_temp;
end Behavioral;