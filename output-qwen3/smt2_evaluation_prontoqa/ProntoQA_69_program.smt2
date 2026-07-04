; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-liquid (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-aggressive (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)

; 3. Declare constants
(declare-const wren Entity)

; 4. Assert knowledge base (facts and rules)

; Rule: Each tumpus is not blue.
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-blue x)))))

; Rule: Tumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-vumpus x))))

; Rule: Vumpuses are not transparent.
(assert (forall ((x Entity)) (=> (is-vumpus x) (not (is-transparent x)))))

; Rule: Every vumpus is a rompus.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-rompus x))))

; Rule: Each rompus is not fruity.
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-fruity x)))))

; Rule: Rompuses are dumpuses.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-dumpus x))))

; Rule: Every dumpus is not nervous.
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-nervous x)))))

; Rule: Each dumpus is a yumpus.
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-yumpus x))))

; Rule: Yumpuses are not liquid.
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-liquid x)))))

; Rule: Each yumpus is a jompus.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-jompus x))))

; Rule: Jompuses are not cold.
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-cold x)))))

; Rule: Zumpuses are cold.
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-cold x))))

; Rule: Each jompus is a numpus.
(assert (forall ((x Entity)) (=> (is-jompus x) (is-numpus x))))

; Rule: Numpuses are large.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-large x))))

; Rule: Numpuses are impuses.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-impus x))))

; Rule: Every impus is aggressive.
(assert (forall ((x Entity)) (=> (is-impus x) (is-aggressive x))))

; Rule: Each impus is a wumpus.
(assert (forall ((x Entity)) (=> (is-impus x) (is-wumpus x))))

; Fact: Wren is a vumpus.
(assert (is-vumpus wren))

; 5. Verification
; Question: Is the following statement true or false? Wren is not cold.
; We assert the statement "Wren is not cold" to check if it is consistent (sat) or contradictory (unsat).
(assert (not (is-cold wren)))

; Check satisfiability
(check-sat)
(get-model)