sim:
	verilator --trace -cc --exe --build -j 0 -CFLAGS -g bicubic_core.v main.cpp

clean:
	rm -rf obj_dir/

run: sim
	./obj_dir/Vbicubic_core

vcd: run
	gtkwave ./waveform.vcd