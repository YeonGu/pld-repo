sim:
	verilator --trace -cc --exe --build --timing -j 0 -CFLAGS "-std=c++17 -g -pthread -fcoroutines" sim-main.cpp memc.v 

clean:
	rm -rf obj_dir/

run: sim
	./obj_dir/Vmemc

vcd: run
	# gtkwave ./waveform.vcd
	/mnt/e/Xilinx/gtkwave/bin/gtkwave.exe ./waveform.vcd