; Declare sorts
(declare-sort Thing 0)

; Declare predicates (uninterpreted properties)
(declare-fun impus (Thing) Bool)
(declare-fun earthy (Thing) Bool)
(declare-fun rompuses (Thing) Bool)
(declare-fun kind (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun temperate (Thing) Bool)
(declare-fun dumpus (Thing) Bool)
(declare-fun wooden (Thing) Bool)
(declare-fun numpus (Thing) Bool)
(declare-fun blue (Thing) Bool)
(declare-fun yumpus (Thing) Bool)
(declare-fun large (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun dull (Thing) Bool)
(declare-fun tumpus (Thing) Bool)
(declare-fun jompus (Thing) Bool)
(declare-fun nervous (Thing) Bool)
(declare-fun zumpus (Thing) Bool)

; Stella
(declare-const stella Thing)

; Knowledge base
(assert (impus stella))

; 1) Each impus is earthy
(assert (forall ((x Thing)) (=> (impus x) (earthy x))))
; 2) Impuses are rompuses
(assert (forall ((x Thing)) (=> (impus x) (rompuses x))))
; 3) Rompuses are kind
(assert (forall ((x Thing)) (=> (rompuses x) (kind x))))
; 4) Rompuses are wumpuses
(assert (forall ((x Thing)) (=> (rompuses x) (wumpus x))))
; 5) Each wumpus is temperate
(assert (forall ((x Thing)) (=> (wumpus x) (temperate x))))
; 6) Each wumpus is a dumpus
(assert (forall ((x Thing)) (=> (wumpus x) (dumpus x))))
; 7) Dumpuses are wooden
(assert (forall ((x Thing)) (=> (dumpus x) (wooden x))))
; 8) Each dumpus is a numpus
(assert (forall ((x Thing)) (=> (dumpus x) (numpus x))))
; 9) Each numpus is not blue
(assert (forall ((x Thing)) (=> (numpus x) (not (blue x)))))
; 10) Each numpus is a yumpus
(assert (forall ((x Thing)) (=> (numpus x) (yumpus x))))
; 11) Each yumpus is large
(assert (forall ((x Thing)) (=> (yumpus x) (large x))))
; 12) Every yumpus is a vumpus
(assert (forall ((x Thing)) (=> (yumpus x) (vumpus x))))
; 13) Vumpuses are dull
(assert (forall ((x Thing)) (=> (vumpus x) (dull x))))
; 14) Tumpuses are blue
(assert (forall ((x Thing)) (=> (tumpus x) (blue x))))
; 15) Vumpuses are jompuses
(assert (forall ((x Thing)) (=> (vumpus x) (jompus x))))
; 16) Each jompus is nervous
(assert (forall ((x Thing)) (=> (jompus x) (nervous x))))
; 17) Jompuses are zumpuses
(assert (forall ((x Thing)) (=> (jompus x) (zumpus x))))

; Test: Stella is blue
(assert (blue stella))

; Check satisfiability
(check-sat)
(get-model)