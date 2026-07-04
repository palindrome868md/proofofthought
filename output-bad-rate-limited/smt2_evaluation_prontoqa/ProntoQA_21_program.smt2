; Declare sorts
(declare-sort Entity 0)

; Declare constants
(declare-const max Entity)

; Declare predicates
(declare-fun vumpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun orange (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun sour (Entity) Bool)
(declare-fun transparent (Entity) Bool)

; Knowledge base (rules)
(assert (forall ((x Entity)) (=> (vumpus x) (earthy x))))
(assert (forall ((x Entity)) (=> (vumpus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (not (wooden x)))))

(assert (forall ((x Entity)) (=> (dumpus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (kind x))))
(assert (forall ((x Entity)) (=> (numpus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (small x))))
(assert (forall ((x Entity)) (=> (rompus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (bright x))))
(assert (forall ((x Entity)) (=> (jompus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (orange x))))
(assert (forall ((x Entity)) (=> (yumpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (sour x))))
(assert (forall ((x Entity)) (=> (zumpus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (transparent x))))
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (not (orange x)))))

; Facts
(assert (dumpus max))

; Test: Is Max orange?
(assert (orange max))

; Check satisfiability and get a model
(check-sat)
(get-model)