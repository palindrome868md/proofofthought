; Sorts
(declare-sort Entity 0)

; Predicates (unary)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Floral (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Impuse (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Feisty (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Orange (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Wooden (Entity) Bool)
(declare-fun Aggressive (Entity) Bool)
(declare-fun Sour (Entity) Bool)

; Constants
(declare-const fae Entity)

; Knowledge base (facts)
(assert (Jompus fae))

; Universal rules
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Wooden x)))))
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Sour x)))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Floral x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Impuse x))))
(assert (forall ((x Entity)) (=> (Impuse x) (Yumpus x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Feisty x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Orange x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Rompus x))))
(assert (forall ((x Entity)) (=> (Rompus x) (not (Aggressive x)))))
(assert (forall ((x Entity)) (=> (Rompus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Transparent x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Impuse x))))
(assert (forall ((x Entity)) (=> (Numpus x) (not (Orange x)))))

; Query: Is Fae orange?
(assert (Orange fae))

; Check result
(check-sat)
(get-model)