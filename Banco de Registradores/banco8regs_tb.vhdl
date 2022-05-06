library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity banco8regs_tb is
end;

architecture a_banco8regs_tb of banco8regs_tb is
	component banco8regs is
		port( 
			read1 : in unsigned(2 downto 0) := (others => '0');
			read2 : in unsigned(2 downto 0) := (others => '0');
			datawrite : in unsigned(15 downto 0) := (others => '0');
			writeSel : in unsigned(2 downto 0) := (others => '0');
			wr_en : in std_logic := '0';
			clk : in std_logic := '0';
			rst : in std_logic := '0';
			out1 : out unsigned(15 downto 0) := (others => '0');
			out2 : out unsigned(15 downto 0) := (others => '0')
		);
		end component;
		constant period_time : time := 100 ns;
		signal finished : std_logic := '0';
		signal clk, rst, wr_en: std_logic := '0';
		signal out1, out2, datawrite: unsigned(15 downto 0) := (others => '0');
		signal read1, read2, writeSel: unsigned (2 downto 0) := (others => '0');
		
		
begin 
	uut: banco8regs port map(
						clk => clk,
						rst => rst,
						wr_en => wr_en,
						read1 => read1,
						read2 => read2,
						out1 => out1,
						out2 => out2,
						datawrite => datawrite, 
						writeSel => writeSel
					);
reset_global: process
begin
	rst <= '1';
	wait for period_time*2;
	rst <= '0';
	wait;
end process;

sim_time_proc: process
begin
	wait for 10 us;
	finished <= '1';
	wait;
end process sim_time_proc;

clk_proc: process
begin
	while finished /= '1' loop		
	clk <= '0';
	wait for period_time/2;
	clk <= '1';
	wait for period_time/2;
	end loop;
	wait;
end process clk_proc;
	

process -- sinais dos casos de teste
	 begin
		
		 wait for 100 ns;
		 wr_en <= '1';
		 read1 <= "000";
		 read2 <= "001";
		 datawrite <= "0000000000000111";
		 writeSel <= "010";
		 wait for 100 ns;
		 wr_en <= '0';
		 read1 <= "010";
		 read2 <= "001";
		 datawrite <= "0000000000000111";
		 writeSel <= "000";
		wait;
	 end process;
end architecture;