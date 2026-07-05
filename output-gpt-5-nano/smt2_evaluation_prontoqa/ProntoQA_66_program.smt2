; Sort
(declare-sort Creature 0)

; Predicates (uninterpreted)
(declare-fun impus (Creature) Bool)
(declare-fun yumpus (Creature) Bool)
(declare-fun jompus (Creature) Bool)
(declare-fun wumpus (Creature) Bool)
(declare-fun vumpus (Creature) Bool)
(declare-fun rompuses (Creature) Bool)
(declare-fun tumpus (Creature) Bool)
(declare-fun numpus (Creature) Bool)
(declare-fun zumpus (Creature) Bool)
(declare-fun dumpus (Creature) Bool)
(declare-fun nervous (Creature) Bool)
(declare-fun hot (Creature) Bool)
(declare-fun mean (Creature) Bool)
(declare-fun dull (Creature) Bool)
(declare-fun sweet (Creature) Bool)
(declare-fun large (Creature) Bool)

; Sam is a constant entity
(declare-const sam Creature)

; Knowledge base
(assert (wumpus sam))

; Rules / universal implications
(assert (forall ((x Creature)) (=> (impus x) (yumpus x))))
(assert (forall ((x Creature)) (=> (yumpus x) (jompus x))))
(assert (forall ((x Creature)) (=> (jompus x) (wumpus x))))
(assert (forall ((x Creature)) (=> (wumpus x) (vumpus x))))
(assert (forall ((x Creature)) (=> (vumpus x) (tumpus x))))
(assert (forall ((x Creature)) (=> (tumpus x) (numpus x))))
(assert (forall ((x Creature)) (=> (numpus x) (dull x))))
(assert (forall ((x Creature)) (=> (numpus x) (zumpus x))))
(assert (forall ((x Creature)) (=> (zumpus x) (sweet x))))
(assert (forall ((x Creature)) (=> (zumpus x) (dumpus x))))
(assert (forall ((x Creature)) (=> (rompuses x) (not (sweet x)))))

(assert (forall ((x Creature)) (=> (wumpus x) (nervous x))))
(assert (forall ((x Creature)) (=> (vumpus x) (hot x))))
(assert (forall ((x Creature)) (=> (tumpus x) (mean x))))
; Impuses are not large
(assert (forall ((x Creature)) (=> (impus x) (not (large x)))))

; Test: Is "Sam is not sweet" true?
(assert (not (sweet sam)))

; Check satisfiability
(check-sat)
(get-model)