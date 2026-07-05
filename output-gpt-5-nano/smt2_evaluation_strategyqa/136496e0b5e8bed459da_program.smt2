; Question: Would it be impossible to use an Iwato scale for a twelve-tone technique composition?
; Iwato scale: six pitch classes {0, 2, 4, 7, 9, 11}.
; A 12-note row using only Iwato notes would require 12 distinct pitch classes drawn from a set of 6,
; which is impossible. Therefore the problem is UNSAT.

(declare-const r0 Int)
(declare-const r1 Int)
(declare-const r2 Int)
(declare-const r3 Int)
(declare-const r4 Int)
(declare-const r5 Int)
(declare-const r6 Int)
(declare-const r7 Int)
(declare-const r8 Int)
(declare-const r9 Int)
(declare-const r10 Int)
(declare-const r11 Int)

; Each row note must be an Iwato pitch class
(assert (or (= r0 0) (= r0 2) (= r0 4) (= r0 7) (= r0 9) (= r0 11)))
(assert (or (= r1 0) (= r1 2) (= r1 4) (= r1 7) (= r1 9) (= r1 11)))
(assert (or (= r2 0) (= r2 2) (= r2 4) (= r2 7) (= r2 9) (= r2 11)))
(assert (or (= r3 0) (= r3 2) (= r3 4) (= r3 7) (= r3 9) (= r3 11)))
(assert (or (= r4 0) (= r4 2) (= r4 4) (= r4 7) (= r4 9) (= r4 11)))
(assert (or (= r5 0) (= r5 2) (= r5 4) (= r5 7) (= r5 9) (= r5 11)))
(assert (or (= r6 0) (= r6 2) (= r6 4) (= r6 7) (= r6 9) (= r6 11)))
(assert (or (= r7 0) (= r7 2) (= r7 4) (= r7 7) (= r7 9) (= r7 11)))
(assert (or (= r8 0) (= r8 2) (= r8 4) (= r8 7) (= r8 9) (= r8 11)))
(assert (or (= r9 0) (= r9 2) (= r9 4) (= r9 7) (= r9 9) (= r9 11)))
(assert (or (= r10 0) (= r10 2) (= r10 4) (= r10 7) (= r10 9) (= r10 11)))
(assert (or (= r11 0) (= r11 2) (= r11 4) (= r11 7) (= r11 9) (= r11 11)))

; All notes must be distinct
(assert (distinct r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11))

(check-sat)