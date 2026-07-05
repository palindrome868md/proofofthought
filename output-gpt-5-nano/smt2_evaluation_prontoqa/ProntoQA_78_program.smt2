; Domain
(declare-sort Entity 0)

; Predicates
(declare-fun impus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun happy (Entity) Bool)
(declare-fun brown (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun liquid (Entity) Bool)
(declare-fun hot (Entity) Bool)

; Constants
(declare-const Fae Entity)

; Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (impus x) (not (happy x)))))
(assert (forall ((x Entity)) (=> (impus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (brown x))))
(assert (forall ((x Entity)) (=> (vumpus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (not (earthy x)))))
(assert (forall ((x Entity)) (=> (dumpus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (transparent x))))
(assert (forall ((x Entity)) (=> (rompus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (kind x))))
(assert (forall ((x Entity)) (=> (wumpus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (small x))))
(assert (forall ((x Entity)) (=> (yumpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (liquid x))))
(assert (forall ((x Entity)) (=> (zumpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (hot x))))
(assert (forall ((x Entity)) (=> (tumpus x) (numpus x))))

; Fae facts
(assert (vumpus Fae))

; Test: negation of the target (not small Fae) to verify entailment
(assert (not (small Fae)))
(check-sat)
(get-model)