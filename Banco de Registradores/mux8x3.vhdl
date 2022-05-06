library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity mux8x3 is
 port(	sel : in unsigned(2 downto 0);
 		disable: in std_logic;
 		r0, r1, r2, r3, r4, r5, r6, r7 : in unsigned(15 downto 0);
 		saida : out unsigned(15 downto 0)
 );
end entity;

architecture a_mux8x3 of mux8x3 is
begin
	saida <= "0000000000000000" when disable='1' else
	r0 when sel="000" else
	r1 when sel="001" else
	r2 when sel="010" else
	r3 when sel="011" else
	r4 when sel="100" else
	r5 when sel="101" else
	r6 when sel="110" else
	r7 when sel="111" else
 "0000000000000000";
end architecture;