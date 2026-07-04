; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Functions (Predicates)
; Types
(declare-fun is_impus (Thing) Bool)
(declare-fun is_zumpus (Thing) Bool)
(declare-fun is_numpus (Thing) Bool)
(declare-fun is_tumpus (Thing) Bool)
(declare-fun is_yumpus (Thing) Bool)
(declare-fun is_vumpus (Thing) Bool)
(declare-fun is_jompus (Thing) Bool)
(declare-fun is_dumpus (Thing) Bool)
(declare-fun is_rompus (Thing) Bool)
(declare-fun is_wumpus (Thing) Bool)

; Properties
(declare-fun is_luminous (Thing) Bool)
(declare-fun is_shy (Thing) Bool)
(declare-fun is_cold (Thing) Bool)
(declare-fun is_large (Thing) Bool)
(declare-fun is_angry (Thing) Bool)
(declare-fun is_earthy (Thing) Bool)
(declare-fun is_sour (Thing) Bool)
(declare-fun is_opaque (Thing) Bool)

; 3. Declare Constants
(declare-const Polly Thing)

; 4. Assert Knowledge Base (Rules)
; Each impus is luminous.
(assert (forall ((x Thing)) (=> (is_impus x) (is_luminous x))))
; Every impus is a zumpus.
(assert (forall ((x Thing)) (=> (is_impus x) (is_zumpus x))))
; Every zumpus is shy.
(assert (forall ((x Thing)) (=> (is_zumpus x) (is_shy x))))
; Every zumpus is a numpus.
(assert (forall ((x Thing)) (=> (is_zumpus x) (is_numpus x))))
; Numpuses are not cold.
(assert (forall ((x Thing)) (=> (is_numpus x) (not (is_cold x)))))
; Each numpus is a tumpus.
(assert (forall ((x Thing)) (=> (is_numpus x) (is_tumpus x))))
; Tumpuses are large.
(assert (forall ((x Thing)) (=> (is_tumpus x) (is_large x))))
; Each tumpus is a yumpus.
(assert (forall ((x Thing)) (=> (is_tumpus x) (is_yumpus x))))
; Each yumpus is angry.
(assert (forall ((x Thing)) (=> (is_yumpus x) (is_angry x))))
; Yumpuses are vumpuses.
(assert (forall ((x Thing)) (=> (is_yumpus x) (is_vumpus x))))
; Vumpuses are not earthy.
(assert (forall ((x Thing)) (=> (is_vumpus x) (not (is_earthy x)))))
; Vumpuses are jompuses.
(assert (forall ((x Thing)) (=> (is_vumpus x) (is_jompus x))))
; Every jompus is not sour.
(assert (forall ((x Thing)) (=> (is_jompus x) (not (is_sour x)))))
; Dumpuses are not angry.
(assert (forall ((x Thing)) (=> (is_dumpus x) (not (is_angry x)))))
; Jompuses are rompuses.
(assert (forall ((x Thing)) (=> (is_jompus x) (is_rompus x))))
; Rompuses are not opaque.
(assert (forall ((x Thing)) (=> (is_rompus x) (not (is_opaque x)))))
; Rompuses are wumpuses.
(assert (forall ((x Thing)) (=> (is_rompus x) (is_wumpus x))))

; 5. Assert Knowledge Base (Facts)
; Polly is an impus.
(assert (is_impus Polly))

; 6. Verification
; Question: Is the following statement true or false? Polly is angry.
; We assert the statement to test its consistency with the KB.
(assert (is_angry Polly))

; 7. Check Satisfiability
(check-sat)
(get-model)