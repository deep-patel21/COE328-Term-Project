library ieee;
use ieee.std_logic_1164.all;

entity decod4to16 is
port(w : in std_logic_vector(3 downto 0);
	  En : in std_logic;
	  y : out std_logic_vector(0 to 15));
end decod4to16;

architecture structure of decod4to16 is
component decod
port (w : in std_logic_vector(1 downto 0);
	   En : in  std_logic;
		y : out std_logic_vector(0 to 3));
end component;
	signal m : std_logic_vector(0 to 3);
begin
	g1 : for i in 0 to 3 generate
	dec_ri : decod port map(w(1 downto 0), m(i), y(4*i to 4* i+3));
	g2 : if i = 3 generate
	dec_left : decod port map(w(i downto i-1), En, m);
	end generate;
	end generate;
end structure;