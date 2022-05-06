echo "-----------------------------banco8regs-------------------------------------"
ghdl -a	 banco8regs.vhdl
ghdl -e	 banco8regs
echo "-----------------------------mux2x1-----------------------------------------"
ghdl -a	 mux2x1.vhdl
ghdl -e	 mux2x1
echo "-----------------------------mux3x8-----------------------------------------"
ghdl -a	 mux8x3.vhdl
ghdl -e	 mux8x3
echo "-----------------------------reg16bits-----------------------------------------"
ghdl -a	 reg16bits.vhdl
ghdl -e	 reg16bits
echo "-----------------------------ula------------------------------------------------"
ghdl -a	 ula.vhdl
ghdl -e	 ula
echo "-----------------------------banco_com_ula---------------------------------"
ghdl -a	 banco_com_ula.vhdl
ghdl -e	 banco_com_ula
echo "-----------------------------banco_com_ula_tb---------------------------------"
ghdl -a	 banco_com_ula_tb.vhdl
ghdl -e	 banco_com_ula_tb
echo "-----------------------------ghw----------------------------------"
ghdl -r banco_com_ula_tb --wave=banco_com_ula_tb.ghw --stop-time=98000ns

gtkwave banco_com_ula_tb.ghw

