; Domain
(declare-sort Entity 0)

; Constants
(declare-const polly Entity)

; Predicates
(declare-fun tumpus (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)

(declare-fun sweet (Entity) Bool)
(declare-fun brown (Entity) Bool)
(declare-fun aggressive (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun cold (Entity) Bool)

; Knowledge base
(assert (rompus polly))

; Rules (universal)
(assert (forall ((x Entity)) (=> (tumpus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (sweet x))))
(assert (forall ((x Entity)) (=> (zumpus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (brown x))))
(assert (forall ((x Entity)) (=> (vumpus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (not (aggressive x)))))
(assert (forall ((x Entity)) (=> (yumpus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (dull x))))
(assert (forall ((x Entity)) (=> (numpus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (not (metallic x)))))
(assert (forall ((x Entity)) (=> (impus x) (jompus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (not (dull x)))))
(assert (forall ((x Entity)) (=> (jompus x) (not (cold x)))))
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))

; Test: Polly is not dull
(assert (not (dull polly)))

; Check satisfiability
(check-sat)