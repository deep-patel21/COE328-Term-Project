library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decod is 
port(w : in std_logic_vector(1 downto 0);
	  En : in std_logic;
	  y : out std_logic_vector(0 to 3));
end decod;

architecture code of decod is
	signal Enw : std_logic_vector(2 downto 0);
begin
	Enw <= En & w;
	With Enw select
	y <= "0001" when "001",
		  "0010" when "011",
		  "0011" when "101",
		  "0100" when "111",
		  "0000" when others;
end code;
