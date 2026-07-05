; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-bitter (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-amenable (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-temperate (Entity) Bool
)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-floral (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-bright (Entity) Bool)

; Constants
(declare-const Sally Entity)

; Knowledge base
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-small x))))
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-vumpus x))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-red x))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-numpus x))))
(assert (forall ((x Entity)) (=> (is-numpus x) (is-bitter x))))
(assert (forall ((x Entity)) (=> (is-numpus x) (is-wumpus x))))
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-amenable x)))))
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-bright x))))
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-dumpus x))))
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-temperate x))))
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-rompus x))))
(assert (forall ((x Entity)) (=> (is-rompus x) (is-floral x))))
(assert (forall ((x Entity)) (=> (is-rompus x) (is-tumpus x))))
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-opaque x))))
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-jompus x))))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-amenable x))))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-zumpus x))))

; Sally is a wumpus
(assert (is-wumpus Sally))

; Test: Is Sally amenable?
(assert (is-amenable Sally))
(check-sat)