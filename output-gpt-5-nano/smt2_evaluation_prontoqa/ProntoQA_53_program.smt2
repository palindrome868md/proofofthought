; Sorts
(declare-sort Thing 0)

; Predicates
(declare-fun numpus (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun zumpus (Thing) Bool)
(declare-fun impus (Thing) Bool)
(declare-fun yumpus (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun rompuse (Thing) Bool)
(declare-fun jompus (Thing) Bool)
(declare-fun dumpus (Thing) Bool)
(declare-fun tumpus (Thing) Bool)
(declare-fun kind (Thing) Bool)
(declare-fun wooden (Thing) Bool)
(declare-fun nervous (Thing) Bool)
(declare-fun hot (Thing) Bool)
(declare-fun transparent (Thing) Bool)
(declare-fun small (Thing) Bool)
(declare-fun earthy (Thing) Bool)
(declare-fun dull (Thing) Bool)

; Knowledge base (universal rules)
(assert (forall ((x Thing)) (=> (numpus x) (kind x))))
(assert (forall ((x Thing)) (=> (numpus x) (wumpus x))))
(assert (forall ((x Thing)) (=> (wumpus x) (not (wooden x)))))
(assert (forall ((x Thing)) (=> (zumpus x) (not (dull x)))))
(assert (forall ((x Thing)) (=> (wumpus x) (impus x))))
(assert (forall ((x Thing)) (=> (impus x) (not (nervous x)))))
(assert (forall ((x Thing)) (=> (impus x) (yumpus x))))
(assert (forall ((x Thing)) (=> (yumpus x) (hot x))))
(assert (forall ((x Thing)) (=> (yumpus x) (vumpus x))))
(assert (forall ((x Thing)) (=> (vumpus x) (transparent x))))
(assert (forall ((x Thing)) (=> (vumpus x) (rompuse x))))
(assert (forall ((x Thing)) (=> (rompuse x) (not (small x)))))
(assert (forall ((x Thing)) (=> (rompuse x) (jompus x))))
(assert (forall ((x Thing)) (=> (jompus x) (dull x))))
(assert (forall ((x Thing)) (=> (jompus x) (dumpus x))))
(assert (forall ((x Thing)) (=> (dumpus x) (earthy x))))
(assert (forall ((x Thing)) (=> (dumpus x) (tumpus x))))

; Fae is an impus
(declare-const fae Thing)
(assert (impus fae))

; Test: Is Fae dull?
(assert (dull fae))

; Check the query
(check-sat)