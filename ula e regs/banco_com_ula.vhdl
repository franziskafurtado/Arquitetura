library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banco_com_ula is
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
end entity;

architecture a_banco_com_ula of banco_com_ula is
component banco8regs is 
	port( 
	read1 : in unsigned(2 downto 0);
	read2 : in unsigned(2 downto 0);
	writeSel : in unsigned(2 downto 0);
	datawrite : in unsigned(15 downto 0);
	wr_en : in std_logic;
	clk : in std_logic;
	rst : in std_logic;
	out1 : out unsigned(15 downto 0);
	out2 : out unsigned(15 downto 0) 
 );
end component;
component mux2x1 is
	port( 
	 sel : in std_logic;
	 in_a, in_b : in unsigned (15 downto 0);
	 saida : out unsigned (15 downto 0)
	 );
end component;
component ula is
	port( 
		x : in unsigned(15 downto 0);
		y : in unsigned(15 downto 0);
		sel_op : in unsigned(1 downto 0);
		isHigher : out std_logic;
		out_ula : out unsigned(15 downto 0)
		);
end component;

signal saida_ula, saida1_banco, saida2_banco, saida_mux: unsigned(15 downto 0);
begin
	banco_registradores: banco8regs port map(read1 => read1, read2 => read2, writeSel=>writeSel, 
												datawrite => saida_ula, wr_en => wr_en, clk => clk, rst => rst, out1 => saida1_banco, out2 => saida2_banco);
												
	mux: mux2x1 port map(sel => regOrConst, saida=>saida_mux, 
							in_a => saida2_banco, in_b => const);
							
	c_ula: ula port map(x => saida1_banco, y => saida_mux, sel_op => sel_op, isHigher => isHigher, out_ula => saida_ula);

end architecture;