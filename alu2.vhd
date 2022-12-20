library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity alu2 is
port(clock : in std_logic;
	  A, B : in unsigned(7 downto 0);
	  student_id : in unsigned (3 downto 0);
	  op : in unsigned (15 downto 0);
	  neg, carry : out std_logic;
	  R1 : out unsigned (3 downto 0);
	  R2 : out unsigned (3 downto 0));
end alu2;
architecture calculation of alu2 is
	signal reg1, reg2, result : unsigned(7 downto 0) := (others => '0');
	signal temp : unsigned (8 downto 0) := (others => '0');
	signal reg2Temporary : unsigned (7 downto 0) := (others => '0');
begin
	reg1 <= A;
	reg2 <= B;
	process(clock, op)
	begin
		if(rising_edge(clock)) then
			case OP is  							-- I was assigned Table H.)
				when "0000000000000001" => result <= reg1 ror 4;							--1
				when "0000000000000010" => result <= reg1 xor reg2;						--2
				when "0000000000000100" => for i in 0 to 7 loop								--3
														result(i) <= reg2(7 - i);
													end loop;
				when "0000000000001000" => temp <= ('0' & reg1) + ('0' & reg2);		--4
													result <= (temp(7 downto 0)) - 00000010;
													carry <= temp(8);		
				when "0000000000010000" => result <= reg2 rol 2;							--5
				when "0000000000100000" => for i in 0 to 7 loop								--6
														if ((i mod 2) = 0) then 
															result(i) <= not reg2(i);
														end if;
													end loop;										
				when "0000000001000000" => reg2Temporary <= reg2;
													for i in 0 to 3 loop								--7
														result(i) <= reg1(i + 4);
													end loop;
													for i in 4 to 7 loop
														result(i) <= reg2Temporary(i);
													end loop;
				when "0000000010000000" => if ((reg2(1)) = '0') then						--8
														result <= shift_right(reg2, 2);
													end if;
				when "0000000100000000" => for i in 4 to 7 loop								--9
														result(i) <= not reg1(i);
													end loop; 
				when others  => result <= "00000000";
			end case;
		end if;
	end process;
	R1 <= result(3 downto 0);
	R2 <= result(7 downto 4);
end calculation;
