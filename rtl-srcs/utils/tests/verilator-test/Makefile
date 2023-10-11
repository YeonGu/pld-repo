sim:
	verilator --trace -cc --exe --build --timing -j 0 -CFLAGS "-g" main.cpp top.v

clean:
	rm -rf obj_dir/

run: sim
	./obj_dir/Vtop

vcd: run
	# gtkwave ./waveform.vcd
	/mnt/e/Xilinx/gtkwave/bin/gtkwave.exe ./waveform.vcd