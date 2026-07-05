; Sorts
(declare-sort Thing 0)

; Predicates (unary properties)
(declare-fun zumpus (Thing) Bool)
(declare-fun dull (Thing) Bool)
(declare-fun transparent (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun numpus (Thing) Bool)
(declare-fun blue (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun liquid (Thing) Bool)
(declare-fun tumpus (Thing) Bool)
(declare-fun spicy (Thing) Bool)
(declare-fun rompus (Thing) Bool)
(declare-fun yumpus (Thing) Bool)
(declare-fun floral (Thing) Bool)
(declare-fun impus (Thing) Bool)
(declare-fun hot (Thing) Bool)
(declare-fun jompus (Thing) Bool)
(declare-fun large (Thing) Bool)
(declare-fun dumpus (Thing) Bool)

; Constants
(declare-const sam Thing)

; Knowledge base
(assert (forall ((x Thing)) (=> (zumpus x) (dull x))))
(assert (forall ((x Thing)) (=> (vumpus x) (not (transparent x)))))
(assert (forall ((x Thing)) (=> (vumpus x) (numpus x))))
(assert (forall ((x Thing)) (=> (numpus x) (blue x))))
(assert (forall ((x Thing)) (=> (numpus x) (wumpus x))))
(assert (forall ((x Thing)) (=> (wumpus x) (liquid x))))
(assert (forall ((x Thing)) (=> (wumpus x) (tumpus x))))
(assert (forall ((x Thing)) (=> (tumpus x) (not (spicy x)))))
(assert (forall ((x Thing)) (=> (tumpus x) (rompus x))))
(assert (forall ((x Thing)) (=> (rompus x) (not (dull x)))))
(assert (forall ((x Thing)) (=> (rompus x) (yumpus x))))
(assert (forall ((x Thing)) (=> (yumpus x) (floral x))))
(assert (forall ((x Thing)) (=> (yumpus x) (impus x))))
(assert (forall ((x Thing)) (=> (impus x) (hot x))))
(assert (forall ((x Thing)) (=> (impus x) (jompus x))))
(assert (forall ((x Thing)) (=> (jompus x) (large x))))
(assert (forall ((x Thing)) (=> (jompus x) (dumpus x))))

; Facts: Sam is a vumpus
(assert (vumpus sam))

; Test: Is "Sam is not dull" true?
(assert (not (dull sam)))
(check-sat)
(get-model)