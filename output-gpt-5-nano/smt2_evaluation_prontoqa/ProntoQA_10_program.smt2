; Declare a single domain for all entities
(declare-sort Thing 0)

; Predicates (uninterpreted in this problem)
(declare-fun impus (Thing) Bool)
(declare-fun earthy (Thing) Bool)
(declare-fun jompus (Thing) Bool)
(declare-fun small (Thing) Bool)
(declare-fun rompuses (Thing) Bool)
(declare-fun amenable (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun wooden (Thing) Bool)
(declare-fun zumpus (Thing) Bool)
(declare-fun temperate (Thing) Bool)
(declare-fun dumpus (Thing) Bool)
(declare-fun dull (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun shy (Thing) Bool)
(declare-fun yumpus (Thing) Bool)
(declare-fun sweet (Thing) Bool)
(declare-fun numpus (Thing) Bool)
(declare-fun tumpus (Thing) Bool)

; Constants / individuals
(declare-const fae Thing)

; Knowledge base (facts)
; Fae is a wumpus
(assert (wumpus fae))

; Rules (implications)
(assert (forall ((x Thing)) (=> (impus x) (earthy x))))
(assert (forall ((x Thing)) (=> (impus x) (jompus x))))
(assert (forall ((x Thing)) (=> (jompus x) (small x))))
(assert (forall ((x Thing)) (=> (jompus x) (rompuses x))))
(assert (forall ((x Thing)) (=> (rompuses x) (not (amenable x)))))
(assert (forall ((x Thing)) (=> (rompuses x) (wumpus x))))
(assert (forall ((x Thing)) (=> (wumpus x) (wooden x))))
(assert (forall ((x Thing)) (=> (wumpus x) (zumpus x))))
(assert (forall ((x Thing)) (=> (zumpus x) (temperate x))))
(assert (forall ((x Thing)) (=> (zumpus x) (dumpus x))))
(assert (forall ((x Thing)) (=> (dumpus x) (dull x))))
(assert (forall ((x Thing)) (=> (dumpus x) (vumpus x))))
(assert (forall ((x Thing)) (=> (vumpus x) (not (shy x)))))
(assert (forall ((x Thing)) (=> (yumpus x) (sweet x))))
(assert (forall ((x Thing)) (=> (numpus x) (not (sweet x)))))
(assert (forall ((x Thing)) (=> (numpus x) (tumpus x))))

; Fae is a wumpus already asserted; no need to re-assert here

; Test question: Is Fae sweet?
; If the knowledge base entails not sweet for fae, then this is unsat.
(assert (sweet fae))

; Check satisfiability: we expect unsat (i.e., "Fae is sweet" is false)
(check-sat)