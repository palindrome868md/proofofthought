; -------------------------------------------------
; 1. Sorts
; -------------------------------------------------
(declare-sort Problem 0)

; -------------------------------------------------
; 2. Predicates (functions returning Bool)
; -------------------------------------------------
(declare-fun easy (Problem) Bool)
(declare-fun hard (Problem) Bool)
(declare-fun recommended (Problem) Bool)   ; recommended to novices
(declare-fun starred (Problem) Bool)       ; starred by >1000 users

; -------------------------------------------------
; 3. Constants for the concrete problems
; -------------------------------------------------
(declare-const two_sum Problem)
(declare-const four_sum Problem)

; -------------------------------------------------
; 4. Knowledge base (premises)
; -------------------------------------------------
; Premise 2: recommended -> easy
(assert (forall ((p Problem)) (=> (recommended p) (easy p))))

; Premise 3: every problem is easy OR hard, but NOT both
(assert (forall ((p Problem)) (or (easy p) (hard p))))
(assert (forall ((p Problem)) (not (and (easy p) (hard p)))))

; Premise 4: starred -> hard
(assert (forall ((p Problem)) (=> (starred p) (hard p))))

; Premise 5: 2Sum is recommended to novices
(assert (recommended two_sum))

; Premise 6: 4Sum is starred by >1000 users
(assert (starred four_sum))

; -------------------------------------------------
; 5. Statement to verify:
;    "4Sum is recommended to novices"
; -------------------------------------------------
(assert (recommended four_sum))

; -------------------------------------------------
; 6. Check satisfiability
; -------------------------------------------------
(check-sat)   ; Expected output: unsat  (statement contradicts the premises)
(get-model)  ; (optional) shows a model when the problem is sat