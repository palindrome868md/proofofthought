; Sorts
(declare-sort Entity 0)

; Constants
(declare-const sam Entity)

; Predicates (unary relations)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-impuse (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)

; Temperate property
(declare-fun temperate (Entity) Bool)

; Knowledge base: Sam is a tumpus
(assert (is-tumpus sam))

; Chain rules to derive Sam's successors
(assert (forall ((x Entity))
  (=> (is-tumpus x) (is-rompus x))))
(assert (forall ((x Entity))
  (=> (is-rompus x) (is-dumpus x))))
(assert (forall ((x Entity))
  (=> (is-dumpus x) (is-zumpus x))))
(assert (forall ((x Entity))
  (=> (is-zumpus x) (is-impuse x))))
(assert (forall ((x Entity))
  (=> (is-impuse x) (is-wumpus x))))
(assert (forall ((x Entity))
  (=> (is-wumpus x) (is-yumpus x))))
(assert (forall ((x Entity))
  (=> (is-yumpus x) (is-jompus x))))
(assert (forall ((x Entity))
  (=> (is-jompus x) (is-vumpus x))))

; Impuses are not temperate
(assert (forall ((x Entity))
  (=> (is-impuse x) (not (temperate x)))))

; Test: Is "Sam is not temperate" true?
(assert (not (temperate sam)))

; Check satisfiability and get a model
(check-sat)
(get-model)