# Assignment 2: Loop optimizations

This assignment looks at how rearranging loops changes performance. It has
two parts:

1. A C benchmark that multiplies two matrices using five loop arrangements and
   times them against each other.
2. A short run of LLVM's own loop unrolling and loop interchange passes on two
   small kernels, so the same ideas can be seen at the IR level.

## The loop transformations

| variant              | what changes                                                   |
|----------------------|----------------------------------------------------------------|
| baseline (i-j-k)     | textbook order; the inner loop reads B down a column           |
| interchange (i-k-j)  | loops swapped so the inner loop reads along rows               |
| tiled                | the matrices are processed in `tile` x `tile` blocks so data is reused while it is still in cache |
| unrolled x4          | interchange, with four inner iterations written out per pass   |
| tiled + unrolled     | tiling and unrolling together                                  |

Every variant accumulates each element of C in the same order, so the results
should match the baseline exactly. The program checks this and prints the
largest difference.

## Layout

```
src/matrix_multiply.c   the benchmark and all five variants
llvm/loop_kernels.c     kernels for LLVM's loop passes
Makefile                builds build/matrix_multiply
run_benchmark.sh        builds and runs the benchmark for several sizes
run_llvm_loops.sh       runs the LLVM loop passes
```

## Part 1: matrix multiplication benchmark

Build with `clang` (or any C compiler):

```
make
make CC=gcc
```

Run it directly:

```
./build/matrix_multiply [n] [tile] [repeats]
```

The defaults are `n = 512`, `tile = 32`, `repeats = 3`. `n` must be a multiple
of `tile`, and `tile` a multiple of 4. Each variant is run `repeats` times and
the fastest time is reported.

To run several sizes and save the table:

```
./run_benchmark.sh
```

This writes `out/benchmark.txt`. Another tile size can be tried with
`TILE=64 ./run_benchmark.sh`.

The output looks like this:

```
variant                  time (s)   speedup    max error
baseline (i-j-k)           ...        1.00x     0.00e+00
interchange (i-k-j)        ...
```

`speedup` is relative to the baseline, `max error` is the largest difference
from the baseline result.

## Part 2: LLVM's loop passes

This needs `clang` and `opt` from the same LLVM version.

```
./run_llvm_loops.sh
```

It compiles `llvm/loop_kernels.c` to IR, converts the loops to canonical form
(`mem2reg`, `loop-simplify`, `lcssa`), then runs:

- `loop-unroll` with `-unroll-count=4` on `sum_array`
- `loop-interchange` on `add_by_column`, with remarks turned on

Files written to `out/`:

- `loop_kernels_unopt.ll`: IR straight from clang
- `loop_kernels_canonical.ll`: IR after `mem2reg`, `loop-simplify` and `lcssa`
- `loop_kernels_unrolled.ll`: IR after unrolling
- `loop_kernels_interchanged.ll`: IR after interchange
- `interchange_remarks.txt`: what the interchange pass decided and why

The script also prints how many `fadd` instructions the IR has before and after
unrolling, and whether interchange changed anything. Whether LLVM interchanges
a loop depends on its legality and cost checks; when it declines, the remarks
file gives the reason.

## Notes

- Timings depend on the machine, the compiler and the flags (`-O2` by
  default). Compilers can also vectorize or unroll the baseline themselves, so
  the gaps between variants are not the same everywhere.
- The first run of a function pays for cold caches, which is why the best of
  several runs is reported.
- All matrices are stored row-major in flat arrays, and the functions use
  `restrict` to tell the compiler the arrays do not overlap.
