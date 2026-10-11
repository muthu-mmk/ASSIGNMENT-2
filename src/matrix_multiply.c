// Loop optimization experiments on dense matrix multiplication, C = A * B.
//
// All matrices are n x n, row-major, stored in flat arrays of double.
// Every variant computes the same result; they differ only in how the loops
// are arranged:
//
//   baseline      i-j-k order, the textbook version
//   interchange   i-k-j order, so the inner loop walks along rows
//   tiled         the matrices are processed in tile x tile blocks
//   unrolled      interchange, with the inner loop unrolled by 4
//   tiled+unrolled   both of the above
//
// Usage: ./matrix_multiply [n] [tile] [repeats]     (defaults: 512 32 3)
// n must be a multiple of tile, and tile a multiple of 4.

#define _POSIX_C_SOURCE 200809L

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define IDX(row, col) ((size_t)(row) * (size_t)n + (size_t)(col))

typedef void (*multiply_fn)(const double *restrict A, const double *restrict B,
                            double *restrict C, int n, int tile);

// ---------------------------------------------------------------- variants

static void multiply_baseline(const double *restrict A,
                              const double *restrict B, double *restrict C,
                              int n, int tile) {
  (void)tile;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      double sum = 0.0;
      for (int k = 0; k < n; k++)
        sum += A[IDX(i, k)] * B[IDX(k, j)];   // B is read down a column
      C[IDX(i, j)] = sum;
    }
  }
}

static void multiply_interchange(const double *restrict A,
                                 const double *restrict B, double *restrict C,
                                 int n, int tile) {
  (void)tile;
  memset(C, 0, sizeof(double) * (size_t)n * (size_t)n);
  for (int i = 0; i < n; i++) {
    for (int k = 0; k < n; k++) {
      double a = A[IDX(i, k)];
      for (int j = 0; j < n; j++)
        C[IDX(i, j)] += a * B[IDX(k, j)];     // everything is read along a row
    }
  }
}

static void multiply_tiled(const double *restrict A, const double *restrict B,
                           double *restrict C, int n, int tile) {
  memset(C, 0, sizeof(double) * (size_t)n * (size_t)n);
  for (int ii = 0; ii < n; ii += tile) {
    for (int kk = 0; kk < n; kk += tile) {
      for (int jj = 0; jj < n; jj += tile) {
        for (int i = ii; i < ii + tile; i++) {
          for (int k = kk; k < kk + tile; k++) {
            double a = A[IDX(i, k)];
            for (int j = jj; j < jj + tile; j++)
              C[IDX(i, j)] += a * B[IDX(k, j)];
          }
        }
      }
    }
  }
}

static void multiply_unrolled(const double *restrict A,
                              const double *restrict B, double *restrict C,
                              int n, int tile) {
  (void)tile;
  memset(C, 0, sizeof(double) * (size_t)n * (size_t)n);
  for (int i = 0; i < n; i++) {
    for (int k = 0; k < n; k++) {
      double a = A[IDX(i, k)];
      for (int j = 0; j < n; j += 4) {
        C[IDX(i, j)]     += a * B[IDX(k, j)];
        C[IDX(i, j + 1)] += a * B[IDX(k, j + 1)];
        C[IDX(i, j + 2)] += a * B[IDX(k, j + 2)];
        C[IDX(i, j + 3)] += a * B[IDX(k, j + 3)];
      }
    }
  }
}

static void multiply_tiled_unrolled(const double *restrict A,
                                    const double *restrict B,
                                    double *restrict C, int n, int tile) {
  memset(C, 0, sizeof(double) * (size_t)n * (size_t)n);
  for (int ii = 0; ii < n; ii += tile) {
    for (int kk = 0; kk < n; kk += tile) {
      for (int jj = 0; jj < n; jj += tile) {
        for (int i = ii; i < ii + tile; i++) {
          for (int k = kk; k < kk + tile; k++) {
            double a = A[IDX(i, k)];
            for (int j = jj; j < jj + tile; j += 4) {
              C[IDX(i, j)]     += a * B[IDX(k, j)];
              C[IDX(i, j + 1)] += a * B[IDX(k, j + 1)];
              C[IDX(i, j + 2)] += a * B[IDX(k, j + 2)];
              C[IDX(i, j + 3)] += a * B[IDX(k, j + 3)];
            }
          }
        }
      }
    }
  }
}

// ----------------------------------------------------------------- harness

struct variant {
  const char *name;
  multiply_fn run;
};

static const struct variant variants[] = {
    {"baseline (i-j-k)", multiply_baseline},
    {"interchange (i-k-j)", multiply_interchange},
    {"tiled", multiply_tiled},
    {"unrolled x4", multiply_unrolled},
    {"tiled + unrolled", multiply_tiled_unrolled},
};

static double now_seconds(void) {
  struct timespec ts;
  clock_gettime(CLOCK_MONOTONIC, &ts);
  return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;
}

// Fixed, repeatable values so every run multiplies the same matrices.
static void fill(double *m, int n, int seed) {
  for (size_t i = 0; i < (size_t)n * (size_t)n; i++)
    m[i] = (double)((i * 7 + (size_t)seed * 13) % 17) / 16.0;
}

static double max_difference(const double *x, const double *y, int n) {
  double worst = 0.0;
  for (size_t i = 0; i < (size_t)n * (size_t)n; i++) {
    double d = fabs(x[i] - y[i]);
    if (d > worst)
      worst = d;
  }
  return worst;
}

int main(int argc, char **argv) {
  int n = argc > 1 ? atoi(argv[1]) : 512;
  int tile = argc > 2 ? atoi(argv[2]) : 32;
  int repeats = argc > 3 ? atoi(argv[3]) : 3;

  if (n <= 0 || tile <= 0 || repeats <= 0 || tile % 4 != 0 || n % tile != 0) {
    fprintf(stderr,
            "usage: %s [n] [tile] [repeats]\n"
            "n must be a multiple of tile, tile a multiple of 4\n",
            argv[0]);
    return 1;
  }

  size_t bytes = sizeof(double) * (size_t)n * (size_t)n;
  double *A = malloc(bytes);
  double *B = malloc(bytes);
  double *C = malloc(bytes);
  double *reference = malloc(bytes);
  if (!A || !B || !C || !reference) {
    fprintf(stderr, "out of memory\n");
    return 1;
  }

  fill(A, n, 1);
  fill(B, n, 2);

  // the baseline result is what every other variant is checked against
  multiply_baseline(A, B, reference, n, tile);

  printf("n = %d, tile = %d, best of %d runs\n\n", n, tile, repeats);
  printf("%-22s %10s %9s %12s\n", "variant", "time (s)", "speedup",
         "max error");

  double baseline_time = 0.0;
  int count = (int)(sizeof(variants) / sizeof(variants[0]));

  for (int v = 0; v < count; v++) {
    double best = 1e30;
    for (int r = 0; r < repeats; r++) {
      double start = now_seconds();
      variants[v].run(A, B, C, n, tile);
      double elapsed = now_seconds() - start;
      if (elapsed < best)
        best = elapsed;
    }
    if (v == 0)
      baseline_time = best;

    printf("%-22s %10.4f %8.2fx %12.2e\n", variants[v].name, best,
           baseline_time / best, max_difference(C, reference, n));
  }

  free(A);
  free(B);
  free(C);
  free(reference);
  return 0;
}
