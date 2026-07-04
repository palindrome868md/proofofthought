; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun Jompus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Red (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Spicy (Entity) Bool)
(declare-fun Temperate (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Small (Entity) Bool)

; Constants
(declare-const polly Entity)

; Knowledge base
(assert (Rompus polly))
(assert (forall ((x Entity)) (=> (Rompus x) (Vumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Red x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Numpus x))))
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))
(assert (forall ((x Entity)) (=> (Impus x) (Temperate x))))
(assert (forall ((x Entity)) (=> (Impus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Fruity x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Yumpus x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Liquid x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Small x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Fruity x)))))
(assert (forall ((x Entity)) (=> (Numpus x) (not (Spicy x)))))

; Query: Is Polly fruity?
(assert (not (Fruity polly)))
(check-sat)