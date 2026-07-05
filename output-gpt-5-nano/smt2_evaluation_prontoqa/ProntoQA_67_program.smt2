; Declare sorts
(declare-sort Entity 0)

; Predicates (unary)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-orange (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-mean (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-sweet (Entity) Bool)

; Constant
(declare-const sam Entity)

; Knowledge base (universal rules)
(assert (forall ((p Entity)) (=> (is-numpus p) (not (is-mean p)))))
(assert (forall ((p Entity)) (=> (is-numpus p) (is-impus p))))
(assert (forall ((p Entity)) (=> (is-impus p) (not (is-fruity p)))))
(assert (forall ((p Entity)) (=> (is-impus p) (is-zumpus p))))
(assert (forall ((p Entity)) (=> (is-zumpus p) (is-small p))))
(assert (forall ((p Entity)) (=> (is-zumpus p) (is-tumpus p))))
(assert (forall ((p Entity)) (=> (is-tumpus p) (is-transparent p))))
(assert (forall ((p Entity)) (=> (is-tumpus p) (is-jompus p))))
(assert (forall ((p Entity)) (=> (is-jompus p) (is-dumpus p))))
(assert (forall ((p Entity)) (=> (is-dumpus p) (is-orange p))))
(assert (forall ((p Entity)) (=> (is-dumpus p) (is-vumpus p))))
(assert (forall ((p Entity)) (=> (is-vumpus p) (is-sweet p))))
(assert (forall ((p Entity)) (=> (is-vumpus p) (is-yumpus p))))
(assert (forall ((p Entity)) (=> (is-yumpus p) (is-wooden p))))
(assert (forall ((p Entity)) (=> (is-yumpus p) (is-rompus p))))
(assert (forall ((p Entity)) (=> (is-wumpus p) (not (is-orange p)))))

; Fact: Sam is an impus
(assert (is-impus sam))

; Test: Is Sam orange? (negation to determine truth of the statement)
(assert (not (is-orange sam)))

; Check satisfiability
(check-sat)
(get-model)