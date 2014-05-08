add list -nodelta
configure list -strobestart {9 ns}  -strobeperiod {10 ns}
configure list -usestrobe 1

add list -notrigger -hex -width 12  -label in_a	         in_a
add list -notrigger -hex -width 12  -label in_b	         in_b
add list -notrigger -hex -width 12  -label opcode        opcode
add list -notrigger -hex -width 12  -label alu_out       alu_out
add list -notrigger -hex -width 12  -label alu_carry     alu_carry
add list -notrigger -hex -width 12  -label alu_zero      alu_zero

view signals
add wave -r in_a
add wave -r in_b
add wave -r opcode
add wave -r alu_out
add wave -r alu_carry
add wave -r alu_zero

force in_a x"01"
force in_b x"0A"
force opcode x"01"
run 10 ns

force in_a x"ff"
force in_b x"01"
force opcode x"01"
run 10 ns

force in_a x"ff"
force in_b x"fe"
force opcode x"02"
run 10 ns

force in_a x"ff"
force in_b x"01"
force opcode x"02"
run 10 ns

force in_a x"01"
force in_b x"00"
force opcode x"03"
run 10 ns

force in_a x"ff"
force in_b x"00"
force opcode x"03"
run 10 ns

force in_a x"02"
force in_b x"00"
force opcode x"04"
run 10 ns

force in_a x"ff"
force in_b x"4e"
force opcode x"04"
run 10 ns

force in_a x"ff"
force in_b x"4e"
force opcode x"05"
run 10 ns

force in_a x"41"
force in_b x"4e"
force opcode x"05"
run 10 ns

force in_a x"10"
force in_b x"f0"
force opcode x"05"
run 10 ns

force in_a x"e1"
force in_b x"4e"
force opcode x"06"
run 10 ns

force in_a x"ff"
force in_b x"00"
force opcode x"06"
run 10 ns

force in_a x"ff"
force in_b x"fe"
force opcode x"07"
run 10 ns

force in_a x"ff"
force in_b x"00"
force opcode x"08"
run 10 ns

force in_a x"0f"
force in_b x"00"
force opcode x"08"
run 10 ns

force in_a x"0f"
force in_b x"00"
force opcode x"09"
run 10 ns

force in_a x"f0"
force in_b x"00"
force opcode x"09"
run 10 ns

force in_a x"ff"
force in_b x"00"
force opcode x"0a"
run 10 ns

force in_a x"00"
force in_b x"00"
force opcode x"0a"
run 10 ns

force in_a x"ff"
force in_b x"00"
force opcode x"0b"
run 10 ns

force in_a x"00"
force in_b x"00"
force opcode x"0b"
run 10 ns

force in_a b"000x0000"
force in_b x"11"
force opcode x"05"
run 10 ns

force in_a b"000x0000"
force in_b x"11"
force opcode x"03"
run 10 ns

force in_a x"aa"
force opcode x"C"
run 10ns

write list alu.list
quit
