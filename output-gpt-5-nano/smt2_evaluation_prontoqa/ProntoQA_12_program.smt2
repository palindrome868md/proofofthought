; Sorts
(declare-sort Thing 0)

; Predicates (unary)
(declare-fun Tumpus (Thing) Bool)
(declare-fun Numpus (Thing) Bool)
(declare-fun Vumpus (Thing) Bool)
(declare-fun Dumpus (Thing) Bool)
(declare-fun Zumpus (Thing) Bool)
(declare-fun Yumpus (Thing) Bool)
(declare-fun Rompus (Thing) Bool)
(declare-fun Impuse (Thing) Bool)
(declare-fun Wumpus (Thing) Bool)
(declare-fun Jompus (Thing) Bool)
(declare-fun Floral (Thing) Bool)
(declare-fun Orange (Thing) Bool)
(declare-fun Small (Thing) Bool)
(declare-fun Sour (Thing) Bool)
(declare-fun Cold (Thing) Bool)
(declare-fun Opaque (Thing) Bool)
(declare-fun Dull (Thing) Bool)
(declare-fun Amenable (Thing) Bool)

; Constants
(declare-const Fae Thing)

; Knowledge base
; Fae is a dumpus
(assert (Dumpus Fae))

; Basic relations
(assert (forall ((x Thing)) (=> (Tumpus x) (Numpus x))))
(assert (forall ((x Thing)) (=> (Numpus x) (Small x))))
(assert (forall ((x Thing)) (=> (Numpus x) (Vumpus x))))
(assert (forall ((x Thing)) (=> (Vumpus x) (Sour x))))
(assert (forall ((x Thing)) (=> (Vumpus x) (Dumpus x))))
(assert (forall ((x Thing)) (=> (Dumpus x) (Cold x))))
(assert (forall ((x Thing)) (=> (Dumpus x) (Zumpus x))))
(assert (forall ((x Thing)) (=> (Zumpus x) (Dull x))))
(assert (forall ((x Thing)) (=> (Zumpus x) (Yumpus x))))
(assert (forall ((x Thing)) (=> (Jompus x) (Floral x))))
(assert (forall ((x Thing)) (=> (Yumpus x) (not (Amenable x)))))
(assert (forall ((x Thing)) (=> (Yumpus x) (Rompus x))))
(assert (forall ((x Thing)) (=> (Rompus x) (Opaque x))))
(assert (forall ((x Thing)) (=> (Rompus x) (Impuse x))))
(assert (forall ((x Thing)) (=> (Impuse x) (not (Floral x)))))
(assert (forall ((x Thing)) (=> (Impuse x) (Wumpus x))))

; Test: Is "Fae is not floral" true?
(assert (not (Floral Fae)))
(check-sat)
(get-model)