library ieee;
use ieee.std_logic_1164.all;

entity sevenSeg3 is
port (bcd : in std_logic_vector(3 downto 0);
		leds : out std_logic_vector(0 to 6));
end sevenSeg3;

architecture behaviour of sevenSeg3 is
begin
	process(bcd)
		begin
		case bcd is
			when "0000" => leds <= "0000001";
			when "0001" => leds <= "0000000";
			when others => leds <= "-------"; --an error
		end case;
	end process;
end behaviour;
