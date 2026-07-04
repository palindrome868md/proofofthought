; Sorts
(declare-sort Thing 0)

; Predicates (uninterpreted)
(declare-fun numpus (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun zumpus (Thing) Bool)
(declare-fun impus (Thing) Bool)
(declare-fun yumpus (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun rompus (Thing) Bool)
(declare-fun jompus (Thing) Bool)
(declare-fun dumpus (Thing) Bool)
(declare-fun tumpus (Thing) Bool)
(declare-fun kind (Thing) Bool)
(declare-fun wooden (Thing) Bool)
(declare-fun nervous (Thing) Bool)
(declare-fun hot (Thing) Bool)
(declare-fun transparent (Thing) Bool)
(declare-fun earthy (Thing) Bool)
(declare-fun small (Thing) Bool)
(declare-fun dull (Thing) Bool)

; Constants
(declare-const fae Thing)

; Knowledge base
; 1. Numpuses are kind.
(assert (forall ((x Thing)) (=> (numpus x) (kind x))))
; 2. Each numpus is a wumpus.
(assert (forall ((x Thing)) (=> (numpus x) (wumpus x))))
; 3. Wumpuses are not wooden.
(assert (forall ((x Thing)) (=> (wumpus x) (not (wooden x)))))
; 4. Every zumpus is not dull.
(assert (forall ((x Thing)) (=> (zumpus x) (not (dull x)))))
; 5. Wumpuses are impuses.
(assert (forall ((x Thing)) (=> (wumpus x) (impus x))))
; 6. Impuses are not nervous.
(assert (forall ((x Thing)) (=> (impus x) (not (nervous x)))))
; 7. Each impus is a yumpus.
(assert (forall ((x Thing)) (=> (impus x) (yumpus x))))
; 8. Every yumpus is hot.
(assert (forall ((x Thing)) (=> (yumpus x) (hot x))))
; 9. Every yumpus is a vumpus.
(assert (forall ((x Thing)) (=> (yumpus x) (vumpus x))))
; 10. Every vumpus is transparent.
(assert (forall ((x Thing)) (=> (vumpus x) (transparent x))))
; 11. Vumpuses are rompuses.
(assert (forall ((x Thing)) (=> (vumpus x) (rompus x))))
; 12. Rompuses are not small.
(assert (forall ((x Thing)) (=> (rompus x) (not (small x)))))
; 13. Rompuses are jompuses.
(assert (forall ((x Thing)) (=> (rompus x) (jompus x))))
; 14. Jompuses are dull.
(assert (forall ((x Thing)) (=> (jompus x) (dull x))))
; 15. Jompuses are dumpuses.
(assert (forall ((x Thing)) (=> (jompus x) (dumpus x))))
; 16. Each dumpus is earthy.
(assert (forall ((x Thing)) (=> (dumpus x) (earthy x))))
; 17. Every dumpus is a tumpus.
(assert (forall ((x Thing)) (=> (dumpus x) (tumpus x))))
; 18. Fae is an impus.
(assert (impus fae))

; Test: Is Fae dull?
(assert (dull fae))
(check-sat)
(get-model)