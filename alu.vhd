library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity alu is
port(clock : in std_logic;
	  A, B : in unsigned(7 downto 0);
	  student_id : in unsigned (3 downto 0);
	  op : in unsigned (15 downto 0);
	  neg, carry : out std_logic;
	  R1 : out unsigned (3 downto 0);
	  R2 : out unsigned (3 downto 0));
end alu;
architecture calculation of alu is
	signal reg1, reg2, result : unsigned(7 downto 0) := (others => '0');
	signal temp : unsigned (8 downto 0) := (others => '0');
begin
	reg1 <= A;
	reg2 <= B;
	process(clock, op)
	begin
		if(rising_edge(clock)) then
			case op is
			when "0000000000000001" => temp <= ('0' & reg1) + ('0' & reg2);
												result <= temp(7 downto 0);
												carry <= temp(8);
			when "0000000000000010" => if(reg1 >= reg2) then
													result <= reg1 - reg2;
													neg <= '0';
												else result <= reg2 - reg1;
													  neg <= '1';
												end if;
			when "0000000000000100" => for i in 0 to 7 loop
													result(i) <= not reg1(i);
												end loop;
			when "0000000000001000" => result <= reg1 nand reg2;
			when "0000000000010000" => result <= reg1 nor reg2;
			when "0000000000100000" => result <= reg1 and reg2;
			when "0000000001000000" => result <= reg1 xor reg2;	
			when "0000000010000000" => result <= reg1 or reg2;
			when "0000000100000000" => result <= reg1 xnor reg2;
			when others  => result <= "00000000";
			end case;
		end if;
	end process;
	R1 <= result(3 downto 0);
	R2 <= result(7 downto 4);
end calculation;
