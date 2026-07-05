; Domain
(declare-sort Thing 0)

; Predicates
(declare-fun Tumpus (Thing) Bool)
(declare-fun Impus (Thing) Bool)
(declare-fun Jompus (Thing) Bool)
(declare-fun Zumpus (Thing) Bool)
(declare-fun Wumpus (Thing) Bool)
(declare-fun Numpus (Thing) Bool)
(declare-fun Vumpus (Thing) Bool)
(declare-fun Rompus (Thing) Bool)
(declare-fun Yumpus (Thing) Bool)
(declare-fun Fruity (Thing) Bool)
(declare-fun Dull (Thing) Bool)
(declare-fun Large (Thing) Bool)
(declare-fun Dumpus (Thing) Bool)
(declare-fun Happy (Thing) Bool)
(declare-fun Orange (Thing) Bool)
(declare-fun Transparent (Thing) Bool)
(declare-fun Sweet (Thing) Bool)
(declare-fun Kind (Thing) Bool)

; Constants
(declare-const Fae Thing)

; Knowledge base

; 1. Tumpuses are kind
(assert (forall ((x Thing)) (=> (Tumpus x) (Kind x))))
; 2. Every tumpus is an impus
(assert (forall ((x Thing)) (=> (Tumpus x) (Impus x))))
; 3. Impuses are not dull
(assert (forall ((x Thing)) (=> (Impus x) (not (Dull x)))))
; 4. Impuses are jompuses
(assert (forall ((x Thing)) (=> (Impus x) (Jompus x))))
; 5. Jompuses are not large
(assert (forall ((x Thing)) (=> (Jompus x) (not (Large x)))))
; 6. Jompuses are zumpuses
(assert (forall ((x Thing)) (=> (Jompus x) (Zumpus x))))
; 7. Every zumpus is happy
(assert (forall ((x Thing)) (=> (Zumpus x) (Happy x))))
; 8. Zumpuses are wumpuses
(assert (forall ((x Thing)) (=> (Zumpus x) (Wumpus x))))
; 9. Every dumpus is not fruity
(assert (forall ((x Thing)) (=> (Dumpus x) (not (Fruity x)))))
; 10. Each wumpus is sweet
(assert (forall ((x Thing)) (=> (Wumpus x) (Sweet x))))
; 11. Wumpuses are yumpuses
(assert (forall ((x Thing)) (=> (Wumpus x) (Yumpus x))))
; 12. Yumpuses are orange
(assert (forall ((x Thing)) (=> (Yumpus x) (Orange x))))
; 13. Every yumpus is a numpus
(assert (forall ((x Thing)) (=> (Yumpus x) (Numpus x))))
; 14. Numpuses are transparent
(assert (forall ((x Thing)) (=> (Numpus x) (Transparent x))))
; 15. Each numpus is a vumpus
(assert (forall ((x Thing)) (=> (Numpus x) (Vumpus x))))
; 16. Vumpuses are fruity
(assert (forall ((x Thing) ) (=> (Vumpus x) (Fruity x))))
; 17. Every vumpus is a rompus
(assert (forall ((x Thing)) (=> (Vumpus x) (Rompus x))))
; 18. Fae is a zumpus
(assert (Zumpus Fae))

; Test: Fae is not fruity
(assert (not (Fruity Fae)))

; Check satisfiability
(check-sat)