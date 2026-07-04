; Declare sorts
(declare-sort Entity 0)

; Declare predicates
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-mean (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-orange (Entity) Bool)
(declare-fun is-sweet (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)

; Declare constant for Sam
(declare-const sam Entity)

; Knowledge base
; 1. Numpuses are not mean
(assert (forall ((x Entity)) (=> (is-numpus x) (not (is-mean x)))))

; 2. Numpuses are impuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-impus x))))

; 3. Every impus is not fruity
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-fruity x)))))

; 4. Impuses are zumpuses
(assert (forall ((x Entity)) (=> (is-impus x) (is-zumpus x))))

; 5. Each zumpus is small
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-small x))))

; 6. Zumpuses are tumpuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-tumpus x))))

; 7. Every tumpus is transparent
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-transparent x))))

; 8. Each tumpus is a jompus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-jompus x))))

; 9. Wumpuses are not orange
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-orange x)))))

; 10. Each jompus is not bright
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-bright x)))))

; 11. Jompuses are dumpuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-dumpus x))))

; 12. Dumpuses are orange
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-orange x))))

; 13. Each dumpus is a vumpus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-vumpus x))))

; 14. Every vumpus is sweet
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-sweet x))))

; 15. Vumpuses are yumpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-yumpus x))))

; 16. Yumpuses are wooden
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-wooden x))))

; 17. Every yumpus is a rompus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-rompus x))))

; 18. Sam is an impus
(assert (is-impus sam))

; Test: Is Sam orange?
(assert (is-orange sam))

; Check satisfiability
(check-sat)
(get-model)