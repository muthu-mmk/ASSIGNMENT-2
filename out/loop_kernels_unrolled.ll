; ModuleID = 'out/loop_kernels_canonical.ll'
source_filename = "llvm/loop_kernels.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = dso_local global [256 x [256 x float]] zeroinitializer, align 16
@B = dso_local global [256 x [256 x float]] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_by_column() #0 {
  br label %1

1:                                                ; preds = %553, %0
  %.0 = phi i32 [ 0, %0 ], [ %554, %553 ]
  %2 = icmp ult i32 %.0, 256
  br i1 %2, label %3, label %627

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %76, %3
  %.01 = phi i32 [ 0, %3 ], [ %77, %76 ]
  %5 = icmp ult i32 %.01, 256
  br i1 %5, label %6, label %78

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
  %23 = add nuw nsw i32 %.01, 1
  br label %24

24:                                               ; preds = %22
  %25 = sext i32 %23 to i64
  %26 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %25
  %27 = sext i32 %.0 to i64
  %28 = getelementptr inbounds [256 x float], ptr %26, i64 0, i64 %27
  %29 = load float, ptr %28, align 4
  %30 = sext i32 %23 to i64
  %31 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %30
  %32 = sext i32 %.0 to i64
  %33 = getelementptr inbounds [256 x float], ptr %31, i64 0, i64 %32
  %34 = load float, ptr %33, align 4
  %35 = fadd float %29, %34
  %36 = sext i32 %23 to i64
  %37 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %36
  %38 = sext i32 %.0 to i64
  %39 = getelementptr inbounds [256 x float], ptr %37, i64 0, i64 %38
  store float %35, ptr %39, align 4
  br label %40

40:                                               ; preds = %24
  %41 = add nuw nsw i32 %.01, 2
  br label %42

42:                                               ; preds = %40
  %43 = sext i32 %41 to i64
  %44 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %43
  %45 = sext i32 %.0 to i64
  %46 = getelementptr inbounds [256 x float], ptr %44, i64 0, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = sext i32 %41 to i64
  %49 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %48
  %50 = sext i32 %.0 to i64
  %51 = getelementptr inbounds [256 x float], ptr %49, i64 0, i64 %50
  %52 = load float, ptr %51, align 4
  %53 = fadd float %47, %52
  %54 = sext i32 %41 to i64
  %55 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %54
  %56 = sext i32 %.0 to i64
  %57 = getelementptr inbounds [256 x float], ptr %55, i64 0, i64 %56
  store float %53, ptr %57, align 4
  br label %58

58:                                               ; preds = %42
  %59 = add nuw nsw i32 %.01, 3
  br label %60

60:                                               ; preds = %58
  %61 = sext i32 %59 to i64
  %62 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %61
  %63 = sext i32 %.0 to i64
  %64 = getelementptr inbounds [256 x float], ptr %62, i64 0, i64 %63
  %65 = load float, ptr %64, align 4
  %66 = sext i32 %59 to i64
  %67 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %66
  %68 = sext i32 %.0 to i64
  %69 = getelementptr inbounds [256 x float], ptr %67, i64 0, i64 %68
  %70 = load float, ptr %69, align 4
  %71 = fadd float %65, %70
  %72 = sext i32 %59 to i64
  %73 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %72
  %74 = sext i32 %.0 to i64
  %75 = getelementptr inbounds [256 x float], ptr %73, i64 0, i64 %74
  store float %71, ptr %75, align 4
  br label %76

76:                                               ; preds = %60
  %77 = add nuw nsw i32 %.01, 4
  br label %4, !llvm.loop !6

78:                                               ; preds = %4
  br label %79

79:                                               ; preds = %78
  %80 = add nuw nsw i32 %.0, 1
  br label %81

81:                                               ; preds = %79
  br label %82

82:                                               ; preds = %157, %81
  %.01.1 = phi i32 [ 0, %81 ], [ %158, %157 ]
  %83 = icmp ult i32 %.01.1, 256
  br i1 %83, label %87, label %84

84:                                               ; preds = %82
  br label %85

85:                                               ; preds = %84
  %86 = add nuw nsw i32 %.0, 2
  br label %159

87:                                               ; preds = %82
  %88 = sext i32 %.01.1 to i64
  %89 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %88
  %90 = sext i32 %80 to i64
  %91 = getelementptr inbounds [256 x float], ptr %89, i64 0, i64 %90
  %92 = load float, ptr %91, align 4
  %93 = sext i32 %.01.1 to i64
  %94 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %93
  %95 = sext i32 %80 to i64
  %96 = getelementptr inbounds [256 x float], ptr %94, i64 0, i64 %95
  %97 = load float, ptr %96, align 4
  %98 = fadd float %92, %97
  %99 = sext i32 %.01.1 to i64
  %100 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %99
  %101 = sext i32 %80 to i64
  %102 = getelementptr inbounds [256 x float], ptr %100, i64 0, i64 %101
  store float %98, ptr %102, align 4
  br label %103

103:                                              ; preds = %87
  %104 = add nuw nsw i32 %.01.1, 1
  br label %105

105:                                              ; preds = %103
  %106 = sext i32 %104 to i64
  %107 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %106
  %108 = sext i32 %80 to i64
  %109 = getelementptr inbounds [256 x float], ptr %107, i64 0, i64 %108
  %110 = load float, ptr %109, align 4
  %111 = sext i32 %104 to i64
  %112 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %111
  %113 = sext i32 %80 to i64
  %114 = getelementptr inbounds [256 x float], ptr %112, i64 0, i64 %113
  %115 = load float, ptr %114, align 4
  %116 = fadd float %110, %115
  %117 = sext i32 %104 to i64
  %118 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %117
  %119 = sext i32 %80 to i64
  %120 = getelementptr inbounds [256 x float], ptr %118, i64 0, i64 %119
  store float %116, ptr %120, align 4
  br label %121

121:                                              ; preds = %105
  %122 = add nuw nsw i32 %.01.1, 2
  br label %123

123:                                              ; preds = %121
  %124 = sext i32 %122 to i64
  %125 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %124
  %126 = sext i32 %80 to i64
  %127 = getelementptr inbounds [256 x float], ptr %125, i64 0, i64 %126
  %128 = load float, ptr %127, align 4
  %129 = sext i32 %122 to i64
  %130 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %129
  %131 = sext i32 %80 to i64
  %132 = getelementptr inbounds [256 x float], ptr %130, i64 0, i64 %131
  %133 = load float, ptr %132, align 4
  %134 = fadd float %128, %133
  %135 = sext i32 %122 to i64
  %136 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %135
  %137 = sext i32 %80 to i64
  %138 = getelementptr inbounds [256 x float], ptr %136, i64 0, i64 %137
  store float %134, ptr %138, align 4
  br label %139

139:                                              ; preds = %123
  %140 = add nuw nsw i32 %.01.1, 3
  br label %141

141:                                              ; preds = %139
  %142 = sext i32 %140 to i64
  %143 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %142
  %144 = sext i32 %80 to i64
  %145 = getelementptr inbounds [256 x float], ptr %143, i64 0, i64 %144
  %146 = load float, ptr %145, align 4
  %147 = sext i32 %140 to i64
  %148 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %147
  %149 = sext i32 %80 to i64
  %150 = getelementptr inbounds [256 x float], ptr %148, i64 0, i64 %149
  %151 = load float, ptr %150, align 4
  %152 = fadd float %146, %151
  %153 = sext i32 %140 to i64
  %154 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %153
  %155 = sext i32 %80 to i64
  %156 = getelementptr inbounds [256 x float], ptr %154, i64 0, i64 %155
  store float %152, ptr %156, align 4
  br label %157

157:                                              ; preds = %141
  %158 = add nuw nsw i32 %.01.1, 4
  br label %82, !llvm.loop !6

159:                                              ; preds = %85
  br label %160

160:                                              ; preds = %235, %159
  %.01.2 = phi i32 [ 0, %159 ], [ %236, %235 ]
  %161 = icmp ult i32 %.01.2, 256
  br i1 %161, label %165, label %162

162:                                              ; preds = %160
  br label %163

163:                                              ; preds = %162
  %164 = add nuw nsw i32 %.0, 3
  br label %237

165:                                              ; preds = %160
  %166 = sext i32 %.01.2 to i64
  %167 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %166
  %168 = sext i32 %86 to i64
  %169 = getelementptr inbounds [256 x float], ptr %167, i64 0, i64 %168
  %170 = load float, ptr %169, align 4
  %171 = sext i32 %.01.2 to i64
  %172 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %171
  %173 = sext i32 %86 to i64
  %174 = getelementptr inbounds [256 x float], ptr %172, i64 0, i64 %173
  %175 = load float, ptr %174, align 4
  %176 = fadd float %170, %175
  %177 = sext i32 %.01.2 to i64
  %178 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %177
  %179 = sext i32 %86 to i64
  %180 = getelementptr inbounds [256 x float], ptr %178, i64 0, i64 %179
  store float %176, ptr %180, align 4
  br label %181

181:                                              ; preds = %165
  %182 = add nuw nsw i32 %.01.2, 1
  br label %183

183:                                              ; preds = %181
  %184 = sext i32 %182 to i64
  %185 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %184
  %186 = sext i32 %86 to i64
  %187 = getelementptr inbounds [256 x float], ptr %185, i64 0, i64 %186
  %188 = load float, ptr %187, align 4
  %189 = sext i32 %182 to i64
  %190 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %189
  %191 = sext i32 %86 to i64
  %192 = getelementptr inbounds [256 x float], ptr %190, i64 0, i64 %191
  %193 = load float, ptr %192, align 4
  %194 = fadd float %188, %193
  %195 = sext i32 %182 to i64
  %196 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %195
  %197 = sext i32 %86 to i64
  %198 = getelementptr inbounds [256 x float], ptr %196, i64 0, i64 %197
  store float %194, ptr %198, align 4
  br label %199

199:                                              ; preds = %183
  %200 = add nuw nsw i32 %.01.2, 2
  br label %201

201:                                              ; preds = %199
  %202 = sext i32 %200 to i64
  %203 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %202
  %204 = sext i32 %86 to i64
  %205 = getelementptr inbounds [256 x float], ptr %203, i64 0, i64 %204
  %206 = load float, ptr %205, align 4
  %207 = sext i32 %200 to i64
  %208 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %207
  %209 = sext i32 %86 to i64
  %210 = getelementptr inbounds [256 x float], ptr %208, i64 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = fadd float %206, %211
  %213 = sext i32 %200 to i64
  %214 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %213
  %215 = sext i32 %86 to i64
  %216 = getelementptr inbounds [256 x float], ptr %214, i64 0, i64 %215
  store float %212, ptr %216, align 4
  br label %217

217:                                              ; preds = %201
  %218 = add nuw nsw i32 %.01.2, 3
  br label %219

219:                                              ; preds = %217
  %220 = sext i32 %218 to i64
  %221 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %220
  %222 = sext i32 %86 to i64
  %223 = getelementptr inbounds [256 x float], ptr %221, i64 0, i64 %222
  %224 = load float, ptr %223, align 4
  %225 = sext i32 %218 to i64
  %226 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %225
  %227 = sext i32 %86 to i64
  %228 = getelementptr inbounds [256 x float], ptr %226, i64 0, i64 %227
  %229 = load float, ptr %228, align 4
  %230 = fadd float %224, %229
  %231 = sext i32 %218 to i64
  %232 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %231
  %233 = sext i32 %86 to i64
  %234 = getelementptr inbounds [256 x float], ptr %232, i64 0, i64 %233
  store float %230, ptr %234, align 4
  br label %235

235:                                              ; preds = %219
  %236 = add nuw nsw i32 %.01.2, 4
  br label %160, !llvm.loop !6

237:                                              ; preds = %163
  br label %238

238:                                              ; preds = %313, %237
  %.01.3 = phi i32 [ 0, %237 ], [ %314, %313 ]
  %239 = icmp ult i32 %.01.3, 256
  br i1 %239, label %243, label %240

240:                                              ; preds = %238
  br label %241

241:                                              ; preds = %240
  %242 = add nuw nsw i32 %.0, 4
  br label %315

243:                                              ; preds = %238
  %244 = sext i32 %.01.3 to i64
  %245 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %244
  %246 = sext i32 %164 to i64
  %247 = getelementptr inbounds [256 x float], ptr %245, i64 0, i64 %246
  %248 = load float, ptr %247, align 4
  %249 = sext i32 %.01.3 to i64
  %250 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %249
  %251 = sext i32 %164 to i64
  %252 = getelementptr inbounds [256 x float], ptr %250, i64 0, i64 %251
  %253 = load float, ptr %252, align 4
  %254 = fadd float %248, %253
  %255 = sext i32 %.01.3 to i64
  %256 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %255
  %257 = sext i32 %164 to i64
  %258 = getelementptr inbounds [256 x float], ptr %256, i64 0, i64 %257
  store float %254, ptr %258, align 4
  br label %259

259:                                              ; preds = %243
  %260 = add nuw nsw i32 %.01.3, 1
  br label %261

261:                                              ; preds = %259
  %262 = sext i32 %260 to i64
  %263 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %262
  %264 = sext i32 %164 to i64
  %265 = getelementptr inbounds [256 x float], ptr %263, i64 0, i64 %264
  %266 = load float, ptr %265, align 4
  %267 = sext i32 %260 to i64
  %268 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %267
  %269 = sext i32 %164 to i64
  %270 = getelementptr inbounds [256 x float], ptr %268, i64 0, i64 %269
  %271 = load float, ptr %270, align 4
  %272 = fadd float %266, %271
  %273 = sext i32 %260 to i64
  %274 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %273
  %275 = sext i32 %164 to i64
  %276 = getelementptr inbounds [256 x float], ptr %274, i64 0, i64 %275
  store float %272, ptr %276, align 4
  br label %277

277:                                              ; preds = %261
  %278 = add nuw nsw i32 %.01.3, 2
  br label %279

279:                                              ; preds = %277
  %280 = sext i32 %278 to i64
  %281 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %280
  %282 = sext i32 %164 to i64
  %283 = getelementptr inbounds [256 x float], ptr %281, i64 0, i64 %282
  %284 = load float, ptr %283, align 4
  %285 = sext i32 %278 to i64
  %286 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %285
  %287 = sext i32 %164 to i64
  %288 = getelementptr inbounds [256 x float], ptr %286, i64 0, i64 %287
  %289 = load float, ptr %288, align 4
  %290 = fadd float %284, %289
  %291 = sext i32 %278 to i64
  %292 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %291
  %293 = sext i32 %164 to i64
  %294 = getelementptr inbounds [256 x float], ptr %292, i64 0, i64 %293
  store float %290, ptr %294, align 4
  br label %295

295:                                              ; preds = %279
  %296 = add nuw nsw i32 %.01.3, 3
  br label %297

297:                                              ; preds = %295
  %298 = sext i32 %296 to i64
  %299 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %298
  %300 = sext i32 %164 to i64
  %301 = getelementptr inbounds [256 x float], ptr %299, i64 0, i64 %300
  %302 = load float, ptr %301, align 4
  %303 = sext i32 %296 to i64
  %304 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %303
  %305 = sext i32 %164 to i64
  %306 = getelementptr inbounds [256 x float], ptr %304, i64 0, i64 %305
  %307 = load float, ptr %306, align 4
  %308 = fadd float %302, %307
  %309 = sext i32 %296 to i64
  %310 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %309
  %311 = sext i32 %164 to i64
  %312 = getelementptr inbounds [256 x float], ptr %310, i64 0, i64 %311
  store float %308, ptr %312, align 4
  br label %313

313:                                              ; preds = %297
  %314 = add nuw nsw i32 %.01.3, 4
  br label %238, !llvm.loop !6

315:                                              ; preds = %241
  br label %316

316:                                              ; preds = %391, %315
  %.01.4 = phi i32 [ 0, %315 ], [ %392, %391 ]
  %317 = icmp ult i32 %.01.4, 256
  br i1 %317, label %321, label %318

318:                                              ; preds = %316
  br label %319

319:                                              ; preds = %318
  %320 = add nuw nsw i32 %.0, 5
  br label %393

321:                                              ; preds = %316
  %322 = sext i32 %.01.4 to i64
  %323 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %322
  %324 = sext i32 %242 to i64
  %325 = getelementptr inbounds [256 x float], ptr %323, i64 0, i64 %324
  %326 = load float, ptr %325, align 4
  %327 = sext i32 %.01.4 to i64
  %328 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %327
  %329 = sext i32 %242 to i64
  %330 = getelementptr inbounds [256 x float], ptr %328, i64 0, i64 %329
  %331 = load float, ptr %330, align 4
  %332 = fadd float %326, %331
  %333 = sext i32 %.01.4 to i64
  %334 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %333
  %335 = sext i32 %242 to i64
  %336 = getelementptr inbounds [256 x float], ptr %334, i64 0, i64 %335
  store float %332, ptr %336, align 4
  br label %337

337:                                              ; preds = %321
  %338 = add nuw nsw i32 %.01.4, 1
  br label %339

339:                                              ; preds = %337
  %340 = sext i32 %338 to i64
  %341 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %340
  %342 = sext i32 %242 to i64
  %343 = getelementptr inbounds [256 x float], ptr %341, i64 0, i64 %342
  %344 = load float, ptr %343, align 4
  %345 = sext i32 %338 to i64
  %346 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %345
  %347 = sext i32 %242 to i64
  %348 = getelementptr inbounds [256 x float], ptr %346, i64 0, i64 %347
  %349 = load float, ptr %348, align 4
  %350 = fadd float %344, %349
  %351 = sext i32 %338 to i64
  %352 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %351
  %353 = sext i32 %242 to i64
  %354 = getelementptr inbounds [256 x float], ptr %352, i64 0, i64 %353
  store float %350, ptr %354, align 4
  br label %355

355:                                              ; preds = %339
  %356 = add nuw nsw i32 %.01.4, 2
  br label %357

357:                                              ; preds = %355
  %358 = sext i32 %356 to i64
  %359 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %358
  %360 = sext i32 %242 to i64
  %361 = getelementptr inbounds [256 x float], ptr %359, i64 0, i64 %360
  %362 = load float, ptr %361, align 4
  %363 = sext i32 %356 to i64
  %364 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %363
  %365 = sext i32 %242 to i64
  %366 = getelementptr inbounds [256 x float], ptr %364, i64 0, i64 %365
  %367 = load float, ptr %366, align 4
  %368 = fadd float %362, %367
  %369 = sext i32 %356 to i64
  %370 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %369
  %371 = sext i32 %242 to i64
  %372 = getelementptr inbounds [256 x float], ptr %370, i64 0, i64 %371
  store float %368, ptr %372, align 4
  br label %373

373:                                              ; preds = %357
  %374 = add nuw nsw i32 %.01.4, 3
  br label %375

375:                                              ; preds = %373
  %376 = sext i32 %374 to i64
  %377 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %376
  %378 = sext i32 %242 to i64
  %379 = getelementptr inbounds [256 x float], ptr %377, i64 0, i64 %378
  %380 = load float, ptr %379, align 4
  %381 = sext i32 %374 to i64
  %382 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %381
  %383 = sext i32 %242 to i64
  %384 = getelementptr inbounds [256 x float], ptr %382, i64 0, i64 %383
  %385 = load float, ptr %384, align 4
  %386 = fadd float %380, %385
  %387 = sext i32 %374 to i64
  %388 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %387
  %389 = sext i32 %242 to i64
  %390 = getelementptr inbounds [256 x float], ptr %388, i64 0, i64 %389
  store float %386, ptr %390, align 4
  br label %391

391:                                              ; preds = %375
  %392 = add nuw nsw i32 %.01.4, 4
  br label %316, !llvm.loop !6

393:                                              ; preds = %319
  br label %394

394:                                              ; preds = %469, %393
  %.01.5 = phi i32 [ 0, %393 ], [ %470, %469 ]
  %395 = icmp ult i32 %.01.5, 256
  br i1 %395, label %399, label %396

396:                                              ; preds = %394
  br label %397

397:                                              ; preds = %396
  %398 = add nuw nsw i32 %.0, 6
  br label %471

399:                                              ; preds = %394
  %400 = sext i32 %.01.5 to i64
  %401 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %400
  %402 = sext i32 %320 to i64
  %403 = getelementptr inbounds [256 x float], ptr %401, i64 0, i64 %402
  %404 = load float, ptr %403, align 4
  %405 = sext i32 %.01.5 to i64
  %406 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %405
  %407 = sext i32 %320 to i64
  %408 = getelementptr inbounds [256 x float], ptr %406, i64 0, i64 %407
  %409 = load float, ptr %408, align 4
  %410 = fadd float %404, %409
  %411 = sext i32 %.01.5 to i64
  %412 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %411
  %413 = sext i32 %320 to i64
  %414 = getelementptr inbounds [256 x float], ptr %412, i64 0, i64 %413
  store float %410, ptr %414, align 4
  br label %415

415:                                              ; preds = %399
  %416 = add nuw nsw i32 %.01.5, 1
  br label %417

417:                                              ; preds = %415
  %418 = sext i32 %416 to i64
  %419 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %418
  %420 = sext i32 %320 to i64
  %421 = getelementptr inbounds [256 x float], ptr %419, i64 0, i64 %420
  %422 = load float, ptr %421, align 4
  %423 = sext i32 %416 to i64
  %424 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %423
  %425 = sext i32 %320 to i64
  %426 = getelementptr inbounds [256 x float], ptr %424, i64 0, i64 %425
  %427 = load float, ptr %426, align 4
  %428 = fadd float %422, %427
  %429 = sext i32 %416 to i64
  %430 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %429
  %431 = sext i32 %320 to i64
  %432 = getelementptr inbounds [256 x float], ptr %430, i64 0, i64 %431
  store float %428, ptr %432, align 4
  br label %433

433:                                              ; preds = %417
  %434 = add nuw nsw i32 %.01.5, 2
  br label %435

435:                                              ; preds = %433
  %436 = sext i32 %434 to i64
  %437 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %436
  %438 = sext i32 %320 to i64
  %439 = getelementptr inbounds [256 x float], ptr %437, i64 0, i64 %438
  %440 = load float, ptr %439, align 4
  %441 = sext i32 %434 to i64
  %442 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %441
  %443 = sext i32 %320 to i64
  %444 = getelementptr inbounds [256 x float], ptr %442, i64 0, i64 %443
  %445 = load float, ptr %444, align 4
  %446 = fadd float %440, %445
  %447 = sext i32 %434 to i64
  %448 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %447
  %449 = sext i32 %320 to i64
  %450 = getelementptr inbounds [256 x float], ptr %448, i64 0, i64 %449
  store float %446, ptr %450, align 4
  br label %451

451:                                              ; preds = %435
  %452 = add nuw nsw i32 %.01.5, 3
  br label %453

453:                                              ; preds = %451
  %454 = sext i32 %452 to i64
  %455 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %454
  %456 = sext i32 %320 to i64
  %457 = getelementptr inbounds [256 x float], ptr %455, i64 0, i64 %456
  %458 = load float, ptr %457, align 4
  %459 = sext i32 %452 to i64
  %460 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %459
  %461 = sext i32 %320 to i64
  %462 = getelementptr inbounds [256 x float], ptr %460, i64 0, i64 %461
  %463 = load float, ptr %462, align 4
  %464 = fadd float %458, %463
  %465 = sext i32 %452 to i64
  %466 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %465
  %467 = sext i32 %320 to i64
  %468 = getelementptr inbounds [256 x float], ptr %466, i64 0, i64 %467
  store float %464, ptr %468, align 4
  br label %469

469:                                              ; preds = %453
  %470 = add nuw nsw i32 %.01.5, 4
  br label %394, !llvm.loop !6

471:                                              ; preds = %397
  br label %472

472:                                              ; preds = %547, %471
  %.01.6 = phi i32 [ 0, %471 ], [ %548, %547 ]
  %473 = icmp ult i32 %.01.6, 256
  br i1 %473, label %477, label %474

474:                                              ; preds = %472
  br label %475

475:                                              ; preds = %474
  %476 = add nuw nsw i32 %.0, 7
  br label %549

477:                                              ; preds = %472
  %478 = sext i32 %.01.6 to i64
  %479 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %478
  %480 = sext i32 %398 to i64
  %481 = getelementptr inbounds [256 x float], ptr %479, i64 0, i64 %480
  %482 = load float, ptr %481, align 4
  %483 = sext i32 %.01.6 to i64
  %484 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %483
  %485 = sext i32 %398 to i64
  %486 = getelementptr inbounds [256 x float], ptr %484, i64 0, i64 %485
  %487 = load float, ptr %486, align 4
  %488 = fadd float %482, %487
  %489 = sext i32 %.01.6 to i64
  %490 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %489
  %491 = sext i32 %398 to i64
  %492 = getelementptr inbounds [256 x float], ptr %490, i64 0, i64 %491
  store float %488, ptr %492, align 4
  br label %493

493:                                              ; preds = %477
  %494 = add nuw nsw i32 %.01.6, 1
  br label %495

495:                                              ; preds = %493
  %496 = sext i32 %494 to i64
  %497 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %496
  %498 = sext i32 %398 to i64
  %499 = getelementptr inbounds [256 x float], ptr %497, i64 0, i64 %498
  %500 = load float, ptr %499, align 4
  %501 = sext i32 %494 to i64
  %502 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %501
  %503 = sext i32 %398 to i64
  %504 = getelementptr inbounds [256 x float], ptr %502, i64 0, i64 %503
  %505 = load float, ptr %504, align 4
  %506 = fadd float %500, %505
  %507 = sext i32 %494 to i64
  %508 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %507
  %509 = sext i32 %398 to i64
  %510 = getelementptr inbounds [256 x float], ptr %508, i64 0, i64 %509
  store float %506, ptr %510, align 4
  br label %511

511:                                              ; preds = %495
  %512 = add nuw nsw i32 %.01.6, 2
  br label %513

513:                                              ; preds = %511
  %514 = sext i32 %512 to i64
  %515 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %514
  %516 = sext i32 %398 to i64
  %517 = getelementptr inbounds [256 x float], ptr %515, i64 0, i64 %516
  %518 = load float, ptr %517, align 4
  %519 = sext i32 %512 to i64
  %520 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %519
  %521 = sext i32 %398 to i64
  %522 = getelementptr inbounds [256 x float], ptr %520, i64 0, i64 %521
  %523 = load float, ptr %522, align 4
  %524 = fadd float %518, %523
  %525 = sext i32 %512 to i64
  %526 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %525
  %527 = sext i32 %398 to i64
  %528 = getelementptr inbounds [256 x float], ptr %526, i64 0, i64 %527
  store float %524, ptr %528, align 4
  br label %529

529:                                              ; preds = %513
  %530 = add nuw nsw i32 %.01.6, 3
  br label %531

531:                                              ; preds = %529
  %532 = sext i32 %530 to i64
  %533 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %532
  %534 = sext i32 %398 to i64
  %535 = getelementptr inbounds [256 x float], ptr %533, i64 0, i64 %534
  %536 = load float, ptr %535, align 4
  %537 = sext i32 %530 to i64
  %538 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %537
  %539 = sext i32 %398 to i64
  %540 = getelementptr inbounds [256 x float], ptr %538, i64 0, i64 %539
  %541 = load float, ptr %540, align 4
  %542 = fadd float %536, %541
  %543 = sext i32 %530 to i64
  %544 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %543
  %545 = sext i32 %398 to i64
  %546 = getelementptr inbounds [256 x float], ptr %544, i64 0, i64 %545
  store float %542, ptr %546, align 4
  br label %547

547:                                              ; preds = %531
  %548 = add nuw nsw i32 %.01.6, 4
  br label %472, !llvm.loop !6

549:                                              ; preds = %475
  br label %550

550:                                              ; preds = %625, %549
  %.01.7 = phi i32 [ 0, %549 ], [ %626, %625 ]
  %551 = icmp ult i32 %.01.7, 256
  br i1 %551, label %555, label %552

552:                                              ; preds = %550
  br label %553

553:                                              ; preds = %552
  %554 = add nuw nsw i32 %.0, 8
  br label %1, !llvm.loop !9

555:                                              ; preds = %550
  %556 = sext i32 %.01.7 to i64
  %557 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %556
  %558 = sext i32 %476 to i64
  %559 = getelementptr inbounds [256 x float], ptr %557, i64 0, i64 %558
  %560 = load float, ptr %559, align 4
  %561 = sext i32 %.01.7 to i64
  %562 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %561
  %563 = sext i32 %476 to i64
  %564 = getelementptr inbounds [256 x float], ptr %562, i64 0, i64 %563
  %565 = load float, ptr %564, align 4
  %566 = fadd float %560, %565
  %567 = sext i32 %.01.7 to i64
  %568 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %567
  %569 = sext i32 %476 to i64
  %570 = getelementptr inbounds [256 x float], ptr %568, i64 0, i64 %569
  store float %566, ptr %570, align 4
  br label %571

571:                                              ; preds = %555
  %572 = add nuw nsw i32 %.01.7, 1
  br label %573

573:                                              ; preds = %571
  %574 = sext i32 %572 to i64
  %575 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %574
  %576 = sext i32 %476 to i64
  %577 = getelementptr inbounds [256 x float], ptr %575, i64 0, i64 %576
  %578 = load float, ptr %577, align 4
  %579 = sext i32 %572 to i64
  %580 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %579
  %581 = sext i32 %476 to i64
  %582 = getelementptr inbounds [256 x float], ptr %580, i64 0, i64 %581
  %583 = load float, ptr %582, align 4
  %584 = fadd float %578, %583
  %585 = sext i32 %572 to i64
  %586 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %585
  %587 = sext i32 %476 to i64
  %588 = getelementptr inbounds [256 x float], ptr %586, i64 0, i64 %587
  store float %584, ptr %588, align 4
  br label %589

589:                                              ; preds = %573
  %590 = add nuw nsw i32 %.01.7, 2
  br label %591

591:                                              ; preds = %589
  %592 = sext i32 %590 to i64
  %593 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %592
  %594 = sext i32 %476 to i64
  %595 = getelementptr inbounds [256 x float], ptr %593, i64 0, i64 %594
  %596 = load float, ptr %595, align 4
  %597 = sext i32 %590 to i64
  %598 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %597
  %599 = sext i32 %476 to i64
  %600 = getelementptr inbounds [256 x float], ptr %598, i64 0, i64 %599
  %601 = load float, ptr %600, align 4
  %602 = fadd float %596, %601
  %603 = sext i32 %590 to i64
  %604 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %603
  %605 = sext i32 %476 to i64
  %606 = getelementptr inbounds [256 x float], ptr %604, i64 0, i64 %605
  store float %602, ptr %606, align 4
  br label %607

607:                                              ; preds = %591
  %608 = add nuw nsw i32 %.01.7, 3
  br label %609

609:                                              ; preds = %607
  %610 = sext i32 %608 to i64
  %611 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %610
  %612 = sext i32 %476 to i64
  %613 = getelementptr inbounds [256 x float], ptr %611, i64 0, i64 %612
  %614 = load float, ptr %613, align 4
  %615 = sext i32 %608 to i64
  %616 = getelementptr inbounds [256 x [256 x float]], ptr @B, i64 0, i64 %615
  %617 = sext i32 %476 to i64
  %618 = getelementptr inbounds [256 x float], ptr %616, i64 0, i64 %617
  %619 = load float, ptr %618, align 4
  %620 = fadd float %614, %619
  %621 = sext i32 %608 to i64
  %622 = getelementptr inbounds [256 x [256 x float]], ptr @A, i64 0, i64 %621
  %623 = sext i32 %476 to i64
  %624 = getelementptr inbounds [256 x float], ptr %622, i64 0, i64 %623
  store float %620, ptr %624, align 4
  br label %625

625:                                              ; preds = %609
  %626 = add nuw nsw i32 %.01.7, 4
  br label %550, !llvm.loop !6

627:                                              ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local float @sum_array(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %30, %1
  %.01 = phi float [ 0.000000e+00, %1 ], [ %29, %30 ]
  %.0 = phi i32 [ 0, %1 ], [ %31, %30 ]
  %3 = icmp ult i32 %.0, 1024
  br i1 %3, label %4, label %32

4:                                                ; preds = %2
  %5 = sext i32 %.0 to i64
  %6 = getelementptr inbounds float, ptr %0, i64 %5
  %7 = load float, ptr %6, align 4
  %8 = fadd float %.01, %7
  br label %9

9:                                                ; preds = %4
  %10 = add nuw nsw i32 %.0, 1
  br label %11

11:                                               ; preds = %9
  %12 = sext i32 %10 to i64
  %13 = getelementptr inbounds float, ptr %0, i64 %12
  %14 = load float, ptr %13, align 4
  %15 = fadd float %8, %14
  br label %16

16:                                               ; preds = %11
  %17 = add nuw nsw i32 %.0, 2
  br label %18

18:                                               ; preds = %16
  %19 = sext i32 %17 to i64
  %20 = getelementptr inbounds float, ptr %0, i64 %19
  %21 = load float, ptr %20, align 4
  %22 = fadd float %15, %21
  br label %23

23:                                               ; preds = %18
  %24 = add nuw nsw i32 %.0, 3
  br label %25

25:                                               ; preds = %23
  %26 = sext i32 %24 to i64
  %27 = getelementptr inbounds float, ptr %0, i64 %26
  %28 = load float, ptr %27, align 4
  %29 = fadd float %22, %28
  br label %30

30:                                               ; preds = %25
  %31 = add nuw nsw i32 %.0, 4
  br label %2, !llvm.loop !10

32:                                               ; preds = %2
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
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
