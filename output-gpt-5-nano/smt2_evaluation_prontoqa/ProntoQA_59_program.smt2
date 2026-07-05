; Declare sorts
(declare-sort Entity 0)

; Declare predicates (uninterpreted unary relations)
(declare-fun rompus (Entity) Bool)
(declare-fun mean (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)

; Additional properties
(declare-fun brown (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun sour (Entity) Bool)

; Constants
(declare-const Max Entity)

; Axioms / Knowledge base
(assert (forall ((x Entity)) (=> (rompus x) (mean x))))
(assert (forall ((x Entity)) (=> (rompus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (brown x))))
(assert (forall ((x Entity)) (=> (wumpus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (nervous x))))
(assert (forall ((x Entity)) (=> (yumpus x) (large x))))
(assert (forall ((x Entity)) (=> (yumpus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (dull x))))
(assert (forall ((x Entity)) (=> (vumpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (earthy x))))
(assert (forall ((x Entity)) (=> (zumpus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (not (sour x)))))
(assert (forall ((x Entity)) (=> (numpus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (transparent x))))
(assert (forall ((x Entity)) (=> (impus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (not nervous x))))
(assert (forall ((x Entity)) (=> (dumpus x) (jompus x))))
(assert (vumpus Max))  ; Max is a vumpus

; Test: Max is not nervous
(assert (not nervous Max))

; Check satisfiability
(check-sat)