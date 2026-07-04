; Declare sorts
(declare-sort Thing 0)

; Declare predicates (uninterpreted unary relations)
(declare-fun Yumpus (Thing) Bool)
(declare-fun Rompus (Thing) Bool)
(declare-fun Happy (Thing) Bool)
(declare-fun Impus (Thing) Bool)
(declare-fun Dumpus (Thing) Bool)
(declare-fun Opaque (Thing) Bool)
(declare-fun Tumpus (Thing) Bool)
(declare-fun Wumpus (Thing) Bool)
(declare-fun Vumpus (Thing) Bool)
(declare-fun Fruity (Thing) Bool)
(declare-fun Jompus (Thing) Bool)
(declare-fun Zumpus (Thing) Bool)
(declare-fun Dull (Thing) Bool)
(declare-fun Small (Thing) Bool)
(declare-fun Orange (Thing) Bool)
(declare-fun Hot (Thing) Bool)
(declare-fun Numpus (Thing) Bool)
(declare-fun Amenable (Thing) Bool)

; Declare constants
(declare-const Sally Thing)

; Knowledge base

; 1) Yumpuses are rompus
(assert (forall ((x Thing)) (=> (Yumpus x) (Rompus x))))
; 2) Rompuses are happy
(assert (forall ((x Thing)) (=> (Rompus x) (Happy x))))
; 3) Rompuses are impuses
(assert (forall ((x Thing)) (=> (Rompus x) (Impus x))))
; 4) Each impus is not amenable
(assert (forall ((x Thing)) (=> (Impus x) (not (Amenable x)))))
; 5) Every impus is a dumpus
(assert (forall ((x Thing)) (=> (Impus x) (Dumpus x))))
; 6) Dumpuses are opaque
(assert (forall ((x Thing)) (=> (Dumpus x) (Opaque x))))
; 7) Dumpuses are tumpuses
(assert (forall ((x Thing)) (=> (Dumpus x) (Tumpus x))))
; 8) Numpuses are small
(assert (forall ((x Thing)) (=> (Numpus x) (Small x))))
; 9) Tumpuses are orange
(assert (forall ((x Thing)) (=> (Tumpus x) (Orange x))))
; 10) Every tumpus is a wumpus
(assert (forall ((x Thing)) (=> (Tumpus x) (Wumpus x))))
; 11) Wumpuses are not small
(assert (forall ((x Thing)) (=> (Wumpus x) (not (Small x)))))
; 12) Wumpuses are vumpuses
(assert (forall ((x Thing)) (=> (Wumpus x) (Vumpus x))))
; 13) Every vumpus is fruity
(assert (forall ((x Thing)) (=> (Vumpus x) (Fruity x))))
; 14) Every vumpus is a jompus
(assert (forall ((x Thing)) (=> (Vumpus x) (Jompus x))))
; 15) Jompuses are not dull
(assert (forall ((x Thing)) (=> (Jompus x) (not (Dull x)))))
; 16) Every jompus is a zumpus
(assert (forall ((x Thing)) (=> (Jompus x) (Zumpus x))))
; 17) Yumpuses are hot
(assert (forall ((x Thing)) (=> (Yumpus x) (Hot x))))

; 18) Sally is a rompus
(assert (Rompus Sally))

; Test: Is Sally small?
(assert (Small Sally))

; Check satisfiability of the KB with the test
(check-sat)