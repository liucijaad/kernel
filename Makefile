all:
	nasm -f bin ./src/boot.asm -o ./bin/boot.bin

clean:
	rm -f ./bin/boot.bin
run:	
	qemu-system-x86_64 ./bin/boot.bin
