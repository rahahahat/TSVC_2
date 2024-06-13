ifneq (,$(wildcard ./.env))
    include ./.env
    export
endif

clang:
	${LLVM}/bin/clang -Wall --target=riscv64-unknown-linux-gnu -march=rv64gcv -mabi=lp64d -O3  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -g --static  -c -o src/common.o src/common.c
	${LLVM}/bin/clang -Wall --target=riscv64-unknown-linux-gnu -march=rv64gcv -mabi=lp64d -O3  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -g --static -c -o src/dummy.o src/dummy.c
	${LLVM}/bin/clang -Wall --target=riscv64-unknown-linux-gnu -march=rv64gcv -mabi=lp64d -O3  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -g --static -c -o src/tsvc.o src/tsvc.c
	${LLVM}/bin/clang -Wall --target=riscv64-unknown-linux-gnu -march=rv64gcv -mabi=lp64d -O3  --sysroot=$(SYSROOT_DIR) --gcc-toolchain=$(GCC_TOOLCHAIN_DIR) -g --static -o bin/clang_tsvc src/*.o -lm
	rm -rf src/*.o