; Sorts
(declare-sort Entity 0)

; Constants
(declare-const sally Entity)

; Predicates (uninterpreted for each class/characteristic)
(declare-fun Numpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Impus (Entity) Bool
)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Earthy (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Aggressive (Entity) Bool)
(declare-fun Wooden (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Temperate (Entity) Bool)

; Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (Numpus x) (Vumpus x))))
(assert (forall ((x Entity)) (=> (Numpus x) (Earthy x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Transparent x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Small x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Aggressive x)))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Wooden x)))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Jompus x))))
(assert (forall ((x Entity)) (=> (Jompus x) (not (Nervous x)))))
(assert (forall ((x Entity)) (=> (Jompus x) (Zumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Temperate x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Impus x))))
(assert (forall ((x Entity)) (=> (Impus x) (Blue x))))
(assert (forall ((x Entity)) (=> (Impus x) (Yumpus x))))

; Facts
(assert (Numpus sally))

; Test scenario: Sally is not wooden.
(assert (not (Wooden sally)))

; Check question
(check-sat)
(get-model)