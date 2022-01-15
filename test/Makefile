#PATHS
GCC_LIB=gcc-build/x86_64-pc-linux-gnu/libgcc/
LC_DIR=glibc-build/
CRT_LIB=$(LC_DIR)csu/
C_LIB=$(LC_DIR)libc.a
PTHREAD_LIB=$(LC_DIR)nptl/libpthread.a
RT_LIB=$(LC_DIR)rt/librt.a
MATH_LIB=$(LC_DIR)math/libm.a
CRT_STARTS=$(CRT_LIB)crt1.o $(CRT_LIB)crti.o $(GCC_LIB)crtbeginT.o
CRT_ENDS=$(GCC_LIB)crtend.o $(CRT_LIB)crtn.o
SYS_LIBS=$(GCC_LIB)libgcc.a $(GCC_LIB)libgcc_eh.a

UKL_FLAGS=-ggdb -mno-red-zone -mcmodel=kernel -fno-pic

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------

#Unit Test
unit_test: 
	ld -r -o unit_test.ukl unit_test.o 
	ar cr UKL.a unit_test.ukl
	objcopy --prefix-symbols=ukl_ UKL.a
	- rm -rf linux/vmlinux
 #-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------

#Boot Test
 boot_test:./boot/boot_test.c 
	gcc -c -o unit_test.o ./boot/boot_test.c $(UKL_FLAGS)

runS:
	make run_sim -C ./min_initrd
