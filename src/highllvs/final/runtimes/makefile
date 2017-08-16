all:
	arm-linux-gcc -static -o lookup.exe optimized_lookup.c
	arm-linux-gcc -static -o mmm.exe optimized_mmm.c
	
clean:
	rm *.exe
	rm *.s

stats:
	perf stat -r 100 qemu-arm lookup.exe
	perf stat -r 100 qemu-arm mmm.exe

assembly:
	arm-linux-gcc -static -S -o lookup.s optimized_lookup.c
	arm-linux-gcc -static -S -o mmm.s optimized_mmm.c
