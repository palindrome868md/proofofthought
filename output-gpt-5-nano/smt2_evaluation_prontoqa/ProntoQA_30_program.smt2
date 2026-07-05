; Sorts
(declare-sort Creature 0)

; Predicates (uninterpreted)
(declare-fun is-impus (Creature) Bool)
(declare-fun is-jompus (Creature) Bool)
(declare-fun is-zumpus (Creature) Bool)
(declare-fun is-vumpus (Creature) Bool)
(declare-fun is-tumpus (Creature) Bool)
(declare-fun is-numpus (Creature) Bool)
(declare-fun is-dumpus (Creature) Bool)
(declare-fun is-wumpus (Creature) Bool)
(declare-fun temperate (Creature) Bool)

; Constant
(declare-const Fae Creature)

; Knowledge base
(assert (is-vumpus Fae))

; Rules (universal)
(assert (forall ((x Creature)) (=> (is-impus x) (is-jompus x))))
(assert (forall ((x Creature)) (=> (is-vumpus x) (is-tumpus x))))
(assert (forall ((x Creature)) (=> (is-tumpus x) (is-numpus x))))
(assert (forall ((x Creature)) (=> (is-numpus x) (is-dumpus x))))
(assert (forall ((x Creature)) (=> (is-dumpus x) (is-wumpus x))))
(assert (forall ((x Creature)) (=> (is-wumpus x) (temperate x))))
(assert (forall ((x Creature)) (=> (is-zumpus x) (not (temperate x)))))

; Test scenario: Is Fae temperate?
(assert (temperate Fae))

; Check satisfiability and get a model
(check-sat)
(get-model)