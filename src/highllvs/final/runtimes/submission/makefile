all:
	arm-linux-gcc -static -pg -o lookup.exe optimized_lookup.c
	arm-linux-gcc -static -pg -o mmm.exe optimized_mmm.c
	arm-linux-gcc -static -pg -o unoplookup.exe unoptimized_lookup.c
	arm-linux-gcc -static -pg -o unopmmm.exe unoptimized_mmm.c
	
clean:
	rm *.exe
	rm *.s

lookupstats:
	perf stat -r 100 qemu-arm unoplookup.exe
	perf stat -r 100 qemu-arm lookup.exe
mmmstats:
	perf stat -r 100 qemu-arm unopmmm.exe
	perf stat -r 100 qemu-arm mmm.exe

assembly:
	arm-linux-gcc -static -S -o lookup.s optimized_lookup.c
	arm-linux-gcc -static -S -o mmm.s optimized_mmm.c
