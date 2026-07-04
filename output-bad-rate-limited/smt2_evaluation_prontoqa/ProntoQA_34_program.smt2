; Declare sorts
(declare-sort Entity 0)

; Declare constants
(declare-const Sam Entity)

; Declare predicates (unary relations)
(declare-fun impuse (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun shy (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun bitter (Entity) Bool)
(declare-fun mean (Entity) Bool)
(declare-fun bright (Entity) Bool)

; Knowledge base (rules)
(assert (forall ((x Entity)) (=> (impuse x) (bright x))))
(assert (forall ((x Entity)) (=> (impuse x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (floral x))))
(assert (forall ((x Entity)) (=> (rompus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (opaque x))))
(assert (forall ((x Entity)) (=> (yumpus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (red x))))
(assert (forall ((x Entity)) (=> (numpus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (bitter x))))
(assert (forall ((x Entity)) (=> (dumpus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (not (mean x)))))
(assert (forall ((x Entity)) (=> (vumpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (not (shy x)))))
(assert (forall ((x Entity)) (=> (wumpus x) (shy x))))
(assert (forall ((x Entity)) (=> (tumpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (temperate x))))
(assert (forall ((x Entity)) (=> (zumpus x) (jompus x))))
; Fact: Sam is a yumpus
(assert (yumpus Sam))

; Test: Is Sam shy?
(assert (shy Sam))

; Check satisfiability
(check-sat)