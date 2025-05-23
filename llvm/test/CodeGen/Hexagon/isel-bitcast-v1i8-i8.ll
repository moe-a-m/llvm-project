; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=hexagon < %s | FileCheck %s

; This shouldn't crash.

define i8 @fred(ptr %a0) #0 {
; CHECK-LABEL: fred:
; CHECK:       // %bb.0:
; CHECK-NEXT:    {
; CHECK-NEXT:     r0 = memw(r0+#0)
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r0 = extractu(r0,#8,#16)
; CHECK-NEXT:     jumpr r31
; CHECK-NEXT:    }
  %v0 = load <4 x i8>, ptr %a0, align 4
  %v1 = shufflevector <4 x i8> %v0, <4 x i8> undef, <1 x i32> <i32 2>
  %v2 = bitcast <1 x i8> %v1 to i8
  ret i8 %v2
}

attributes #0 = { nounwind "target-cpu"="hexagonv66" }
