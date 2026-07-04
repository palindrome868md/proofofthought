; Domain
(declare-sort Entity 0)

; Constants
(declare-const max Entity)

; Predicates
(declare-fun Zumpus (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Sweet (Entity) Bool)

; Knowledge base
(assert (Vumpus max))

; Rules
(assert (forall ((x Entity)) (=> (Zumpus x) (Small x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Impus x))))
(assert (forall ((x Entity)) (=> (Impus x) (Sweet x))))
(assert (forall ((x Entity)) (=> (Impus x) (Vumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Dull x)))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Rompus x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Cold x))))
(assert (forall ((x Entity)) (=> (Numpus x) (not (Cold x)))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Yumpus x))))

; Test: Max is not cold
(assert (not (Cold max)))

; Check satisfiability
(check-sat)