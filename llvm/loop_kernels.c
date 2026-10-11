// Two small kernels for running LLVM's own loop passes on.

#define N 256

float A[N][N];
float B[N][N];

// The inner loop walks down a column, so consecutive accesses are N floats
// apart. Swapping the two loops would make the inner loop walk along a row.
void add_by_column(void) {
  for (int i = 0; i < N; i++)
    for (int j = 0; j < N; j++)
      A[j][i] = A[j][i] + B[j][i];
}

// A single loop with a constant trip count, a plain target for unrolling.
float sum_array(const float *x) {
  float total = 0.0f;
  for (int i = 0; i < 1024; i++)
    total += x[i];
  return total;
}
