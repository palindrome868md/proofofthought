; Declare sorts
(declare-sort Entity 0)

; Declare predicates
(declare-fun Yumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Bright (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Mean (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Temperate (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Large (Entity) Bool)

; Constant Stella
(declare-const Stella Entity)

; Knowledge base
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Temperate x)))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Rompus x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Large x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Impus x))))
(assert (forall ((x Entity)) (=> (Impus x) (not (Blue x)))))
(assert (forall ((x Entity)) (=> (Impus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Nervous x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Bright x))))
(assert (forall ((x Entity)) (=> (Numpus x) (not (Bright x)))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Zumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Fruity x)))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Opaque x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Vumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Mean x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))

; Stella is a yumpus
(assert (Yumpus Stella))

; Test: Stella is not bright
(assert (not (Bright Stella)))

; Check satisfiability
(check-sat)