; Declare sorts
(declare-sort Entity 0)

; Declare predicates (uninterpreted)
(declare-fun impus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun bitter (Entity) Bool)
(declare-fun dull (Entity) Bool)

; Constant
(declare-const alex Entity)

; Knowledge base (rules)
(assert (forall ((x Entity)) (=> (impus x) (small x))))
(assert (forall ((x Entity)) (=> (zumpus x) (not (fruity x)))))
(assert (forall ((x Entity)) (=> (zumpus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (bitter x))))
(assert (forall ((x Entity)) (=> (numpus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (not (wooden x)))))
(assert (forall ((x Entity)) (=> (wumpus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (not (temperate x)))))
(assert (forall ((x Entity)) (=> (yumpus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (dull x))))
(assert (forall ((x Entity)) (=> (dumpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (not (small x)))))
(assert (forall ((x Entity)) (=> (tumpus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (nervous x))))
(assert (forall ((x Entity)) (=> (jompus x) (vumpus x))))

; Facts
(assert (rompus alex))

; Test: Alex is small
(assert (small alex))

; Check satisfiability
(check-sat)