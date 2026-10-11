#!/bin/sh
# Runs LLVM's own loop unrolling and loop interchange passes on the kernels in
# llvm/loop_kernels.c. The IR after each step and the interchange remarks are
# saved in out/.
# Override the tools if needed:  CLANG=clang-<N> OPT=opt-<N> ./run_llvm_loops.sh

CLANG=${CLANG:-clang}
OPT=${OPT:-opt}

mkdir -p out

"$CLANG" -S -emit-llvm -O0 -Xclang -disable-O0-optnone llvm/loop_kernels.c \
    -o out/loop_kernels_unopt.ll || exit 1

# put the loops in the canonical form the loop passes expect
"$OPT" -S -passes="mem2reg,loop-simplify,lcssa" out/loop_kernels_unopt.ll \
    -o out/loop_kernels_canonical.ll || exit 1

# unroll by 4
"$OPT" -S -passes="loop-unroll" -unroll-count=4 out/loop_kernels_canonical.ll \
    -o out/loop_kernels_unrolled.ll || exit 1

# interchange, with remarks that say what the pass decided and why
"$OPT" -S -passes="loop-interchange" \
    -pass-remarks=loop-interchange \
    -pass-remarks-missed=loop-interchange \
    -pass-remarks-analysis=loop-interchange \
    out/loop_kernels_canonical.ll -o out/loop_kernels_interchanged.ll \
    2> out/interchange_remarks.txt || exit 1

echo "fadd instructions before unrolling: $(grep -c ' fadd ' out/loop_kernels_canonical.ll)"
echo "fadd instructions after unrolling:  $(grep -c ' fadd ' out/loop_kernels_unrolled.ll)"

if cmp -s out/loop_kernels_canonical.ll out/loop_kernels_interchanged.ll; then
  echo "interchange: IR unchanged, see out/interchange_remarks.txt for the reason"
else
  echo "interchange: loops were interchanged"
fi
