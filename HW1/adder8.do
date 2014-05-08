add list -nodelta
configure list -strobestart {9 ns}  -strobeperiod {10 ns}
configure list -usestrobe 1

add list -notrigger -hex -width 4  -label a          a
add list -notrigger -hex -width 4  -label b          b
add list -notrigger -hex -width 10 -label sum_out    sum_out
add list -notrigger -hex -width 8  -label c_out      c_out

force a x"50"
force b x"50"
run 10 ns

force a x"1f"
force b x"1f"
run 10 ns

force a x"25"
force b x"3f"
run 10 ns

force a x"3f"
force b x"25"
run 10 ns

force a x"ff"
force b x"ff"
run 10 ns

force a x"00"
force b x"ff"
run 10 ns

force a x"ff"
force b x"00"
run 10 ns

force a x"ba"
force b x"5e"
run 10 ns

force a x"f1"
force b x"1f"
run 10 ns

force a x"ff"
force b x"33"
run 10 ns

force a x"33"
force b x"ff"
run 10 ns

force a x"33"
force b x"cc"
run 10 ns

force a x"cc"
force b x"33"
run 10 ns

force a x"4e"
force b x"6e"
run 10 ns

force a x"6e"
force b x"4e"
run 10 ns

force a x"12"
force b x"ef"
run 10 ns

force a x"ef"
force b x"12"
run 10 ns

force a x"27"
force b x"72"
run 10 ns

force a x"72"
force b x"27"
run 10 ns

force a x"22"
force b x"33"
run 10 ns

force a x"33"
force b x"22"
run 10 ns

force a x"aa"
force b x"bb"
run 10 ns

write list adder8.list
quit
