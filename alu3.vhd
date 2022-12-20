library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity alu3 is
port(clock : in std_logic;
	  A, B : in unsigned(7 downto 0);
	  student_id : in unsigned (3 downto 0);
	  op : in unsigned (15 downto 0);
	  R2 : out unsigned (3 downto 0));
end alu3;
architecture calculation of alu3 is
	signal reg1, reg2, result : unsigned(7 downto 0) := (others => '0');
	signal digit1, digit2 : unsigned(7 downto 0);
begin
	reg2 <= B;
	digit1 <= "00000101";
	digit2 <= "00000000";
	process(clock, op)
	begin
		if(rising_edge(clock)) then				
			case op is
			when "0000000000000001" => if(digit1 > student_id) then
													result <= "00000001";
												elsif(digit2 > student_id) then
													result <= "00000001";
												else result <= "00000000";
												end if;
			when "0000000000000010" => if(digit1 > student_id) then
													result <= "00000001";
												elsif(digit2 > student_id) then
													result <= "00000001";
												else result <= "00000000";
												end if;
			when "0000000000000100" => if(digit1 > student_id) then
													result <= "00000001";
												elsif(digit2 > student_id) then
													result <= "00000001";
												else result <= "00000000";
												end if;
			when "0000000000001000" => if(digit1 > student_id) then
													result <= "00000001";
												elsif(digit2 > student_id) then
													result <= "00000001";
												else result <= "00000000";
												end if;
			when "0000000000010000" => if(digit1 > student_id) then
													result <= "00000001";
												elsif(digit2 > student_id) then
													result <= "00000001";
												else result <= "00000000";
												end if;
			when "0000000000100000" => if(digit1 > student_id) then
													result <= "00000001";
												elsif(digit2 > student_id) then
													result <= "00000001";
												else result <= "00000000";
												end if;
			when "0000000001000000" => if(digit1 > student_id) then
													result <= "00000001";
												elsif(digit2 > student_id) then
													result <= "00000001";
												else result <= "00000000";
												end if;
			when "0000000010000000" => if(digit1 > student_id) then
													result <= "00000001";
												elsif(digit2 > student_id) then
													result <= "00000001";
												else result <= "00000000";
												end if;
			when "0000000100000000" => if(digit1 > student_id) then
													result <= "00000001";
												elsif(digit2 > student_id) then
													result <= "00000001";
												else result <= "00000000";
												end if;
			when others  => result <= "00000000";
			end case;
		end if;
	end process;
	R2 <= result(3 downto 0);
end calculation;

