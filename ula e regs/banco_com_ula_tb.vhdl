library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banco_com_ula_tb is
end;

architecture a_banco_com_ula_tb of banco_com_ula_tb is
	component banco_com_ula
		port( 
			const : in unsigned(15 downto 0);
			read1 : in unsigned(2 downto 0);
			read2 : in unsigned(2 downto 0);
			writeSel : in unsigned(2 downto 0);
			regOrConst : in std_logic;
			sel_op : in unsigned(1 downto 0);
			wr_en : in std_logic;
			clk : in std_logic;
			rst : in std_logic;
			isHigher : out std_logic;
			out_ula : out unsigned(15 downto 0) 
		 );
		end component;
		signal clk, rst, wr_en, regOrConst, isHigher : std_logic;
		signal const, out_ula: unsigned(15 downto 0);
		signal read1, read2, writeSel: unsigned (2 downto 0);
		signal sel_op: unsigned (1 downto 0);
		
		
		
begin 
	uut: banco_com_ula port map(
						clk => clk,
						rst => rst,
						wr_en => wr_en,
						read1 => read1,
						read2 => read2,
						out_ula => out_ula,
						writeSel => writeSel,
						const => const,
						regOrConst => regOrConst,
						sel_op => sel_op,
						isHigher => isHigher);
process
	begin
		clk <= '0';
		wait for 50 ns;
		clk <= '1';
		wait for 50 ns;
end process;
	
process -- sinal de reset
	 begin
		 rst <= '1';
		 wait for 100 ns;
		 rst <= '0';
		 wait;
end process;
process -- sinais dos casos de teste
	 begin
		 wr_en <= '0';
		 const <= "0000000000000000";
		 regOrConst <= '0';
		 sel_op <= "00";
		 read1 <= "000";
		 read2 <= "000";
		 writeSel <= "000";
		 wait for 100 ns;
		 wr_en <= '1';
		 const <= "0000000000000111";
		 regOrConst <= '1';
		 sel_op <= "00";
		 read1 <= "000";
		 read2 <= "001";
		 writeSel <= "001";
		 wait for 100 ns;
		 wr_en <= '0';
		 const <= "0000000000000011";
		 regOrConst <= '0';
		 sel_op <= "00";
		 read1 <= "001";
		 read2 <= "100";
		 writeSel <= "001";
		 wait for 100 ns;
		 wr_en <= '1';
		 const <= "0000000000000011";
		 regOrConst <= '0';
		 sel_op <= "00";
		 read1 <= "001";
		 read2 <= "001";
		 writeSel <= "111";
		wait;
	 end process;
end architecture;