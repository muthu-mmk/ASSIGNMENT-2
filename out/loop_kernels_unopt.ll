; ModuleID = 'llvm/loop_kernels.c'
source_filename = "llvm/loop_kernels.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = dso_local global [256 x [256 x float]] zeroinitializer, align 16
@B = dso_local global [256 x [256 x float]] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_by_column() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %36, %0
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 256
  br i1 %5, label %6, label %39

6:                                                ; preds = %3
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %32, %6
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 256
  br i1 %9, label %10, label %35

10:                                               ; preds = %7
  %11 = load i32, ptr %2, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %12
  %14 = load i32, ptr %1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [256 x float], ptr %13, i64 0, i64 %15
  %17 = load float, ptr %16, align 4
  %18 = load i32, ptr %2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %19
  %21 = load i32, ptr %1, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [256 x float], ptr %20, i64 0, i64 %22
  %24 = load float, ptr %23, align 4
  %25 = fadd float %17, %24
  %26 = load i32, ptr %2, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %27
  %29 = load i32, ptr %1, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [256 x float], ptr %28, i64 0, i64 %30
  store float %25, ptr %31, align 4
  br label %32

32:                                               ; preds = %10
  %33 = load i32, ptr %2, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %2, align 4
  br label %7, !llvm.loop !6

35:                                               ; preds = %7
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %1, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %1, align 4
  br label %3, !llvm.loop !8

39:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local float @sum_array(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store float 0.000000e+00, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %16, %1
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 1024
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %4, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds float, ptr %9, i64 %11
  %13 = load float, ptr %12, align 4
  %14 = load float, ptr %3, align 4
  %15 = fadd float %14, %13
  store float %15, ptr %3, align 4
  br label %16

16:                                               ; preds = %8
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %4, align 4
  br label %5, !llvm.loop !9

19:                                               ; preds = %5
  %20 = load float, ptr %3, align 4
  ret float %20
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.2 (https://github.com/llvm/llvm-project b2417f51dbbd7435eb3aaf203de24de6754da50e)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
