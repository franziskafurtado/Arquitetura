library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula_tb is
end;

architecture a_ula_tb of ula_tb is
	component ula
		port (	x : in unsigned(15 downto 0);
				y : in unsigned(15 downto 0);
				sel_op : in unsigned(1 downto 0);
				isHigher : out std_logic;
				out_ula : out unsigned(15 downto 0)
		);
		end component;
		signal x, y, out_ula: unsigned(15 downto 0);
		signal isHigher: std_logic;
		signal sel_op: unsigned(1 downto 0);
		
begin 
	uut: ula port map(
						x => x,
						y => y,
						sel_op => sel_op,
						isHigher => isHigher,
						out_ula => out_ula
					);
process
begin
	-- 1+2 -- 
	 x <= "0000000000000001";
	 y <= "0000000000000010";
	 sel_op <= "00";
	 wait for 50 ns;
	-- 400+300
	 x <= "0000000110010000";
	 y <= "0000000100101100";
	 sel_op <= "00";
	 wait for 50 ns;
	 -- 10-10
	 x <= "0000000000001010";
	 y <= "0000000000001010";
	 sel_op <= "01";
	 wait for 50 ns;
	-- 5/1
	 x <= "0000000000000101";
	 y <= "0000000000000001";
	 sel_op <= "10";
	 wait for 50 ns;
	-- 4/4
	 x <= "0000000000000100";
	 y <= "0000000000000100";
	 sel_op <= "10";
	 wait for 50 ns;
	-- 70/96
	 x <= "0000000001000110";
	 y <= "0000000001100000";
	 sel_op <= "10";
	 wait for 50 ns;
	-- 30>246?
	 x <= "0000000000011110";
	 y <= "0000000011110110";
	 sel_op <= "11";
	 wait for 50 ns;
	-- 3>1?
	 x <= "0000000000000011";
	 y <= "0000000000000001";
	 sel_op <= "11";
	 wait for 50 ns;
	 
	 wait;
	 end process;
end architecture;