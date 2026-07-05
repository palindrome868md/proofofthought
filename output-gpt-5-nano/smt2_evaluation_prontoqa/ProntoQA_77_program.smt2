; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-bitter (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)

; Constants
(declare-const sam Entity)

; Knowledge base (facts and rules)

; 1) Sam is a dumpus.
(assert (is-dumpus sam))

; 2) Jompuses are dull. (∀x. is-jompus(x) → is-dull(x))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-dull x))))

; 3) Each jompus is a rompus. (∀x. is-jompus(x) → is-rompus(x))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-rompus x))))

; 4) Each rompus is nervous. (∀x. is-rompus(x) → is-nervous(x))
(assert (forall ((x Entity)) (=> (is-rompus x) (is-nervous x))))

; 5) Rompuses are dumpuses. (∀x. is-rompus(x) → is-dumpus(x))
(assert (forall ((x Entity)) (=> (is-rompus x) (is-dumpus x))))

; 6) Every dumpus is kind. (∀x. is-dumpus(x) → is-kind(x))
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-kind x))))

; 7) Dumpuses are wumpuses. (∀x. is-dumpus(x) → is-wumpus(x))
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-wumpus x))))

; 8) Tumpuses are not opaque. (∀x. is-tumpus(x) → (not is-opaque(x)))
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-opaque x)))))

; 9) Each wumpus is bitter. (∀x. is-wumpus(x) → is-bitter(x))
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-bitter x))))

; 10) Each wumpus is a zumpus. (∀x. is-wumpus(x) → is-zumpus(x))
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-zumpus x))))

; 11) Every zumpus is fruity. (∀x. is-zumpus(x) → is-fruity(x))
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-fruity x))))

; 12) Zumpuses are impuses. (∀x. is-zumpus(x) → is-impus(x))
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-impus x))))

; 13) Impuses are wooden. (∀x. is-impus(x) → is-wooden(x))
(assert (forall ((x Entity)) (=> (is-impus x) (is-wooden x))))

; 14) Each impus is a yumpus. (∀x. is-impus(x) → is-yumpus(x))
(assert (forall ((x Entity)) (=> (is-impus x) (is-yumpus x))))

; 15) Every yumpus is opaque. (∀x. is-yumpus(x) → is-opaque(x))
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-opaque x))))

; 16) Every yumpus is a vumpus. (∀x. is-yumpus(x) → is-vumpus(x))
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-vumpus x))))

; 17) Every vumpus is small. (∀x. is-vumpus(x) → is-small(x))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-small x))))

; 18) Vumpuses are numpuses. (∀x. is-vumpus(x) → is-numpus(x))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-numpus x))))

; Question scenario to test: "Sam is not opaque."
(assert (not (is-opaque sam)))

; Check satisfiability and provide a model if any
(check-sat)
(get-model)