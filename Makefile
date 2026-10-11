# Builds the matrix multiplication benchmark.
#
#   make                        builds build/matrix_multiply with clang
#   make CC=gcc                 use a different compiler
#   make CFLAGS="-O3 -std=c11"  use different flags

CC = clang
CFLAGS = -std=c11 -O2 -Wall -Wextra
LDLIBS = -lm

build/matrix_multiply: src/matrix_multiply.c
	mkdir -p build
	$(CC) $(CFLAGS) $< -o $@ $(LDLIBS)

clean:
	rm -rf build

.PHONY: clean
