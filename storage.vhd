library ieee;
use ieee.std_logic_1164.all;

entity storage is
port(A : in std_logic_vector(7 downto 0);
	  reset, clock : in std_logic;
	  q : out std_logic_vector(7 downto 0));
end storage;

architecture behaviour of storage is
begin
	process(A, reset, clock)
		begin
			if reset = '1' then
			q <= "00000000";
			elsif clock'event and clock = '1' then
			q <= A;
			end if;
	end process;
end behaviour;
