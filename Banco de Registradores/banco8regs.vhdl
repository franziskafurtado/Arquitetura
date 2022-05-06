library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banco8regs is
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
end entity;

architecture a_banco8regs of banco8regs is
component reg16bits is 
	port( 
		 clk : in std_logic;
		 rst : in std_logic;
		 wr_en : in std_logic;
		 data_in : in unsigned(15 downto 0);
		 data_out : out unsigned(15 downto 0)
 );
end component;
component mux8x3 is
	 port( 
		 sel : in unsigned(2 downto 0);
		 disable: in std_logic;
		 r0, r1, r2, r3, r4, r5, r6, r7 : in unsigned(15 downto 0);
		 saida : out unsigned(15 downto 0)
		);
end component;
signal saida_reg0, saida_reg1, saida_reg2, saida_reg3, saida_reg4, saida_reg5, saida_reg6, saida_reg7: unsigned(15 downto 0);
signal wr_en_r0, wr_en_r1, wr_en_r2, wr_en_r3, wr_en_r4, wr_en_r5, wr_en_r6, wr_en_r7 : std_logic;
begin
	reg0: reg16bits port map(data_in => "0000000000000000", data_out => saida_reg0, clk => clk, wr_en => wr_en_r0, rst => rst); 
	reg1: reg16bits port map(data_in => datawrite, data_out => saida_reg1, clk => clk, wr_en => wr_en_r1, rst => rst);
	reg2: reg16bits port map(data_in => datawrite, data_out => saida_reg2, clk => clk, wr_en => wr_en_r2, rst => rst);
	reg3: reg16bits port map(data_in => datawrite, data_out => saida_reg3, clk => clk, wr_en => wr_en_r3, rst => rst);
	reg4: reg16bits port map(data_in => datawrite, data_out => saida_reg4, clk => clk, wr_en => wr_en_r4, rst => rst);
	reg5: reg16bits port map(data_in => datawrite, data_out => saida_reg5, clk => clk, wr_en => wr_en_r5, rst => rst);
	reg6: reg16bits port map(data_in => datawrite, data_out => saida_reg6, clk => clk, wr_en => wr_en_r6, rst => rst);
	reg7: reg16bits port map(data_in => datawrite, data_out => saida_reg7, clk => clk, wr_en => wr_en_r7, rst => rst);
	
	mux1: mux8x3 port map(sel => read1, saida=>out1, disable => wr_en, 
							r0 => saida_reg0, r1 => saida_reg1, r2 => saida_reg2, r3 => saida_reg3,
							r4 => saida_reg4, r5=> saida_reg5, r6 => saida_reg6, r7 => saida_reg7);
	mux2: mux8x3 port map(sel => read2, saida => out2, disable => wr_en,
							r0 => saida_reg0, r1 => saida_reg1, r2 => saida_reg2, r3 => saida_reg3,
							r4 => saida_reg4, r5=> saida_reg5, r6 => saida_reg6, r7 => saida_reg7);
	
	wr_en_r0 <= '0';
	wr_en_r1 <= '1' when writeSel = "001"
	else '0';
	wr_en_r2 <= '1' when writeSel = "010" 
	else '0';
	wr_en_r3 <= '1' when writeSel = "011" 
	else '0';
	wr_en_r4 <= '1' when writeSel = "100" 
	else '0';
	wr_en_r5 <= '1' when writeSel = "101" 
	else '0';
	wr_en_r6 <= '1' when writeSel = "110"
	else '0';
	wr_en_r7 <= '1' when writeSel = "111" 
	else '0';
end architecture;