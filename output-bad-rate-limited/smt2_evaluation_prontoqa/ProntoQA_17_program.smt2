; Declare the universal domain
(declare-sort Entity 0)

; Predicates representing class membership
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)

; Property we will test
(declare-fun opaque (Entity) Bool)

; Constant representing the individual in question
(declare-const Fae Entity)

; Knowledge base
(assert (is-numpus Fae))

; Rules (Every numpus -> wumpus -> jompus -> yumpus -> vumpus -> opaque)
(assert (forall ((x Entity))
  (=> (is-numpus x) (is-wumpus x))))
(assert (forall ((x Entity))
  (=> (is-wumpus x) (is-jompus x))))
(assert (forall ((x Entity))
  (=> (is-jompus x) (is-yumpus x))))
(assert (forall ((x Entity))
  (=> (is-yumpus x) (is-vumpus x))))
(assert (forall ((x Entity))
  (=> (is-vumpus x) (opaque x))))

; Test: Is it true that Fae is not opaque?
(assert (not (opaque Fae)))

; Verification
(check-sat)
(get-model)