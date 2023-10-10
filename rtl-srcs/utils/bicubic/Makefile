sim:
	verilator --trace -cc --exe --build -j 0 -CFLAGS "-g -I/usr/include/opencv4" -LDFLAGS "-lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_imgcodecs" bicubic_core.v main.cpp sim.cpp

clean:
	rm -rf obj_dir/

run: sim
	./obj_dir/Vbicubic_core

vcd: run
	# gtkwave ./waveform.vcd
	/mnt/e/Xilinx/gtkwave/bin/gtkwave.exe ./waveform.vcd