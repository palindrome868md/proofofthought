; Declarations
(declare-sort Creature 0)

(declare-fun wumpus (Creature) Bool)
(declare-fun impus (Creature) Bool)
(declare-fun numpus (Creature) Bool)
(declare-fun zumpus (Creature) Bool)
(declare-fun vumpus (Creature) Bool)
(declare-fun dumpuse (Creature) Bool)
(declare-fun tumpuse (Creature) Bool)
(declare-fun large (Creature) Bool)
(declare-fun hot (Creature) Bool)
(declare-fun earthy (Creature) Bool)
(declare-fun mean (Creature) Bool)
(declare-fun liquid (Creature) Bool)

(declare-const sam Creature)

; Knowledge base
(assert (forall ((x Creature)) (=> (wumpus x) (impus x))))
(assert (forall ((x Creature)) (=> (impus x) (not (hot x)))))
(assert (forall ((x Creature)) (=> (numpus x) (earthy x))))
(assert (forall ((x Creature)) (=> (numpus x) (vumpus x))))
(assert (forall ((x Creature)) (=> (vumpus x) (liquid x))))
(assert (forall ((x Creature)) (=> (vumpus x) (dumpuse x))))
(assert (forall ((x Creature)) (=> (dumpuse x) (not (mean x)))))
(assert (forall ((x Creature)) (=> (dumpuse x) (tumpuse x))))
(assert (forall ((x Creature)) (=> (wumpus x) (large x))))

; Sam is a wumpus
(assert (wumpus sam))

; Test: Is Sam mean?
(assert (mean sam))

; Check satisfiability
(check-sat)