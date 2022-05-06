library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is 
	port( 
		x : in unsigned(15 downto 0);
		y : in unsigned(15 downto 0);
		sel_op : in unsigned(1 downto 0);
		isHigher : out std_logic;
		out_ula : out unsigned(15 downto 0)
		);
end entity;

architecture a_ula of ula is
begin
	-- MUX seleciona a operação
	out_ula <= 	x+y when sel_op = "00" else
				x-y when sel_op = "01" else
				x/y when sel_op = "10" else 
				"0000000000000000";
	-- se x > y então isHigher = 1
	isHigher <= '1' when sel_op = "11" and x>y else
				'0' when sel_op = "11" and x<=y else 
				'0';
end architecture;
