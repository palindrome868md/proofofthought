; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun impus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun rompuses (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun luminous (Entity) Bool)
(declare-fun shy (Entity) Bool)
(declare-fun angry (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun sour (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun large (Entity) Bool)

; Constants
(declare-const polly Entity)

; Knowledge base (rules)
(assert (forall ((x Entity)) (=> (impus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (shy x))))
(assert (forall ((x Entity)) (=> (zumpus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (large x))))
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (angry x))))
(assert (forall ((x Entity)) (=> (yumpus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (not (earthy x)))))
(assert (forall ((x Entity)) (=> (vumpus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (not (sour x)))))
(assert (forall ((x Entity)) (=> (dumpus x) (not (angry x)))))
(assert (forall ((x Entity)) (=> (jompus x) (rompuses x))))
(assert (forall ((x Entity)) (=> (rompuses x) (not (opaque x)))))
(assert (forall ((x Entity)) (=> (rompuses x) (wumpus x))))
(assert (impus polly))

; Test scenario: Polly is angry
(assert (angry polly))

; Check satisfiability and optionally view a model
(check-sat)
(get-model)