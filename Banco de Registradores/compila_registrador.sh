echo "-----------------------------banco8regs-------------------------------------"
ghdl -a	 banco8regs.vhdl
ghdl -e	 banco8regs
echo "-----------------------------banco8regs-------------------------------------"
ghdl -a	 reg16bits.vhdl
ghdl -e	 reg16bits
echo "-----------------------------decoder3x8-------------------------------------"
ghdl -a	 decoder3x8.vhdl
ghdl -e	 decoder3x8
echo "-----------------------------mux3x8-----------------------------------------"
ghdl -a	 mux8x3.vhdl
ghdl -e	 mux8x3
echo "-----------------------------banco8regs_tb----------------------------------"
ghdl -a	 banco8regs_tb.vhdl
ghdl -e	 banco8regs_tb
echo "-----------------------------ghw----------------------------------"
ghdl -r banco8regs_tb --wave=banco8regs_tb.ghw --stop-time=98000ns

gtkwave banco8regs_tb.ghw



