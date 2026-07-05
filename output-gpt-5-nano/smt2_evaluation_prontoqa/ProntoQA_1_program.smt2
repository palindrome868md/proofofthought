; Sort
(declare-sort Entity 0)

; Predicates / unary properties
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool
)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-rompuse (Entity) Bool)
(declare-fun is-shy (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-aggressive (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-small (Entity) Bool)

; Constant
(declare-const max Entity)

; Knowledge base (rules)
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-shy x)))))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-yumpus x))))
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-aggressive x))))
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-dumpus x))))
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-wooden x)))))
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-wumpus x))))
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-red x))))
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-impus x))))
(assert (forall ((x Entity)) (=> (is-impus x) (is-opaque x))))
(assert (forall ((x Entity)) (=> (is-impus x) (is-tumpus x))))
(assert (forall ((x Entity)) (=> (is-numpus x) (is-sour x))))
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-sour x)))))
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-vumpus x))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-earthy x))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-zumpus x))))
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-small x))))
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-rompuse x))))

; Max is a yumpus
(assert (is-yumpus max))

; Test scenario: Max is sour
(assert (is-sour max))

; Question: Is Max sour?
(check-sat)