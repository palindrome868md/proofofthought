; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (Predicates for types and properties)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)

(declare-fun is-sour (Entity) Bool)
(declare-fun is-angry (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-hot (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)

; 3. Declare constants
(declare-const sam Entity)

; 4. Assert knowledge base (facts and rules)

; Vumpuses are sour
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-sour x))))

; Each vumpus is a zumpus
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-zumpus x))))

; Every zumpus is angry
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-angry x))))

; Each zumpus is a tumpus
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-tumpus x))))

; Tumpuses are not small
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-small x)))))

; Every tumpus is a yumpus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-yumpus x))))

; Each yumpus is not blue
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-blue x)))))

; Yumpuses are rompuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-rompus x))))

; Each rompus is not fruity
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-fruity x)))))

; Wumpuses are fruity
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-fruity x))))

; Every rompus is a numpus
(assert (forall ((x Entity)) (=> (is-rompus x) (is-numpus x))))

; Numpuses are hot
(assert (forall ((x Entity)) (=> (is-numpus x) (is-hot x))))

; Each numpus is an impus
(assert (forall ((x Entity)) (=> (is-numpus x) (is-impus x))))

; Every impus is transparent
(assert (forall ((x Entity)) (=> (is-impus x) (is-transparent x))))

; Every impus is a dumpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-dumpus x))))

; Dumpuses are wooden
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-wooden x))))

; Every dumpus is a jompus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-jompus x))))

; Sam is a vumpus
(assert (is-vumpus sam))

; 5. Verification
; Question: Is the following statement true or false? Sam is not fruity.
; We assert the statement "Sam is not fruity" to test its validity against the KB.
(assert (not (is-fruity sam)))

; Check satisfiability
; sat = True (Statement is consistent/true given KB)
; unsat = False (Statement contradicts KB)
(check-sat)
(get-model)