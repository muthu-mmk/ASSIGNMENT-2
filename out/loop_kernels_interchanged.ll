; ModuleID = 'out/loop_kernels_canonical.ll'
source_filename = "llvm/loop_kernels.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = dso_local global [256 x [256 x float]] zeroinitializer, align 16
@B = dso_local global [256 x [256 x float]] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_by_column() #0 {
  br label %1

1:                                                ; preds = %25, %0
  %.0 = phi i32 [ 0, %0 ], [ %26, %25 ]
  %2 = icmp slt i32 %.0, 256
  br i1 %2, label %3, label %27

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %22, %3
  %.01 = phi i32 [ 0, %3 ], [ %23, %22 ]
  %5 = icmp slt i32 %.01, 256
  br i1 %5, label %6, label %24

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %7
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [256 x float], ptr %8, i64 0, i64 %9
  %11 = load float, ptr %10, align 4
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %12
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [256 x float], ptr %13, i64 0, i64 %14
  %16 = load float, ptr %15, align 4
  %17 = fadd float %11, %16
  %18 = sext i32 %.01 to i64
  %19 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %18
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [256 x float], ptr %19, i64 0, i64 %20
  store float %17, ptr %21, align 4
  br label %22

22:                                               ; preds = %6
  %23 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !6

24:                                               ; preds = %4
  br label %25

25:                                               ; preds = %24
  %26 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !8

27:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local float @sum_array(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %9, %1
  %.01 = phi float [ 0.000000e+00, %1 ], [ %8, %9 ]
  %.0 = phi i32 [ 0, %1 ], [ %10, %9 ]
  %3 = icmp slt i32 %.0, 1024
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = sext i32 %.0 to i64
  %6 = getelementptr inbounds float, ptr %0, i64 %5
  %7 = load float, ptr %6, align 4
  %8 = fadd float %.01, %7
  br label %9

9:                                                ; preds = %4
  %10 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

11:                                               ; preds = %2
  %.01.lcssa = phi float [ %.01, %2 ]
  ret float %.01.lcssa
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
