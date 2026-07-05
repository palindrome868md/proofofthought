(declare-sort Entity 0)

; Predicates for kinds
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)

; Predicates for properties
(declare-fun fruity (Entity) Bool)
(declare-fun nervous (Entity) Bool)  ; not used in reasoning but declared for completeness
(declare-fun large (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun spicy (Entity) Bool)
(declare-fun metallic (Entity) Bool)

; Sam
(declare-const sam Entity)

; Knowledge base
(assert (is-vumpus sam))

; Rules (translated from problem statements)
(assert (forall ((x Entity)) (=> (is-tumpus x) (fruity x))))
(assert (forall ((x Entity)) (=> (is-numpus x) (large x))))
(assert (forall ((x Entity)) (=> (is-numpus x) (is-rompus x))))
(assert (forall ((x Entity)) (=> (is-rompus x) (red x))))
(assert (forall ((x Entity)) (=> (is-rompus x) (is-vumpus x))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (temperate x))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-jompus x))))
(assert (forall ((x Entity)) (=> (is-jompus x) (spicy x))))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-impus x))))
(assert (forall ((x Entity)) (=> (is-impus x) (not (metallic x)))))
(assert (forall ((x Entity)) (=> (is-impus x) (is-wumpus x))))
(assert (forall ((x Entity)) (=> (is-wumpus x) (bright x))))
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-zumpus x))))
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (fruity x)))))
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-dumpus x))))

; Test: Is "Sam is not fruity" satisfiable given the KB? (Scenario: Sam is not fruity)
(assert (not (fruity sam)))
(check-sat)