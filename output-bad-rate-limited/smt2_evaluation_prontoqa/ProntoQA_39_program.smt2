; Sorts
(declare-sort Entity 0)

; Predicates (unary relations)
(declare-fun rompus (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun happy (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun sour (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun hot (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun liquid (Entity) Bool)

; Constants
(declare-const Stella Entity)

; Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (rompus x) (amenable x))))
(assert (forall ((x Entity)) (=> (rompus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (happy x))))
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (sour x))))
(assert (forall ((x Entity)) (=> (wumpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (fruity x))))
(assert (forall ((x Entity)) (=> (zumpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (not (large x)))))
(assert (forall ((x Entity)) (=> (tumpus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (liquid x))))
(assert (forall ((x Entity)) (=> (vumpus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (hot x))))
(assert (forall ((x Entity)) (=> (jompus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (not (hot x)))))

; Facts
(assert (wumpus Stella))

; Test: Stella is not hot
(assert (not (hot Stella)))

; Check satisfiability
(check-sat)
(get-model)