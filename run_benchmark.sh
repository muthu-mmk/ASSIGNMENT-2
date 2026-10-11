#!/bin/sh
# Builds the benchmark and runs it for a few matrix sizes.
# The table is printed and also saved to out/benchmark.txt.
#   TILE=64 ./run_benchmark.sh      to try another tile size

TILE=${TILE:-32}

make -s || exit 1
mkdir -p out

for n in 256 512 1024; do
  ./build/matrix_multiply "$n" "$TILE" 3
  echo
done | tee out/benchmark.txt
