; Sorts
(declare-sort Entity 0)

; Constants
(declare-const Fae Entity)

; Predicates
(declare-fun zumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun sour (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun aggressive (Entity) Bool)
(declare-fun orange (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun feisty (Entity) Bool)

; Knowledge base (axioms)
(assert (forall ((x Entity)) (=> (zumpus x) (not (wooden x)))))
(assert (forall ((x Entity)) (=> (zumpus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (not (sour x)))))
(assert (forall ((x Entity)) (=> (vumpus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (floral x))))
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (transparent x))))
(assert (forall ((x Entity)) (=> (wumpus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (feisty x))))
(assert (forall ((x Entity)) (=> (numpus x) (not (orange x)))))
(assert (forall ((x Entity)) (=> (yumpus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (orange x))))
(assert (forall ((x Entity)) (=> (dumpus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (not (aggressive x)))))
(assert (forall ((x Entity)) (=> (rompus x) (tumpus x))))

; Specific instance
(assert (jompus Fae))

; Test question: Is Fae orange?
(assert (orange Fae))

; Verification
(check-sat)
(get-model)