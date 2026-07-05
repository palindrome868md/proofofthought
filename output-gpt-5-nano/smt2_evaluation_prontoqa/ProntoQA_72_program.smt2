(declare-sort Creature 0)
(declare-const sam Creature)

; Predicates
(declare-fun is-wumpus (Creature) Bool)
(declare-fun is-jompus (Creature) Bool)
(declare-fun is-vumpus (Creature) Bool)
(declare-fun is-impus (Creature) Bool)
(declare-fun is-zumpus (Creature) Bool)
(declare-fun is-numpus (Creature) Bool)
(declare-fun is-dumpus (Creature) Bool)
(declare-fun is-fruity (Creature) Bool)
(declare-fun is-sour (Creature) Bool)
(declare-fun is-bright (Creature) Bool)
(declare-fun is-tumpus (Creature) Bool)
(declare-fun is-yumpus (Creature) Bool)
(declare-fun is-aggressive (Creature) Bool)
(declare-fun is-small (Creature) Bool)
(declare-fun is-liquid (Creature) Bool)
(declare-fun is-orange (Creature) Bool)
(declare-fun is-transparent (Creature) Bool)
(declare-fun is-rompus (Creature) Bool)

; Knowledge base / facts
(assert (is-wumpus sam))

; Rules / universal implications
(assert (forall ((x Creature)) (=> (is-wumpus x) (is-jompus x))))
(assert (forall ((x Creature)) (=> (is-jompus x) (is-vumpus x))))
(assert (forall ((x Creature)) (=> (is-vumpus x) (is-orange x))))
(assert (forall ((x Creature)) (=> (is-vumpus x) (is-impus x))))
(assert (forall ((x Creature)) (=> (is-impus x) (not (is-transparent x)))))
(assert (forall ((x Creature)) (=> (is-impus x) (is-zumpus x))))
(assert (forall ((x Creature)) (=> (is-zumpus x) (is-fruity x))))
(assert (forall ((x Creature)) (=> (is-zumpus x) (is-numpus x))))
(assert (forall ((x Creature)) (=> (is-numpus x) (is-sour x))))
(assert (forall ((x Creature)) (=> (is-numpus x) (is-dumpus x))))
(assert (forall ((x Creature)) (=> (is-wumpus x) (is-bright x))))
(assert (forall ((x Creature)) (=> (is-jompus x) (not (is-liquid x))))))
(assert (forall ((x Creature)) (=> (is-rompus x) (not (is-fruity x))))))
(assert (forall ((x Creature)) (=> (is-tumpus x) (is-yumpus x))))
(assert (forall ((x Creature)) (=> (is-yumpus x) (is-aggressive x))))

; Test query: Is Sam fruity?
(assert (is-fruity sam))

(check-sat)