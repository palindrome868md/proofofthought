; Sorts
(declare-sort Entity 0)

; Constants
(declare-const wren Entity)

; Predicates (unary properties)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-aggressive (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-feisty (Entity) Bool)

; 1) Wren is a tumpus
(assert (is-tumpus wren))

; Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-sour x))))
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-yumpus x))))
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-aggressive x))))
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-tumpus x))))
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-transparent x))))
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-vumpus x))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-wooden x))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-jompus x))))
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-feisty x)))))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-large x))))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-numpus x))))
(assert (forall ((x Entity)) (=> (is-numpus x) (is-red x))))
(assert (forall ((x Entity)) (=> (is-numpus x) (is-rompus x))))
(assert (forall ((x Entity)) (=> (is-rompus x) (is-feisty x))))
(assert (forall ((x Entity)) (=> (is-rompus x) (is-zumpus x))))

; Test: Wren is not feisty
(assert (not (is-feisty wren)))

; Check satisfiability and model
(check-sat)
(get-model)