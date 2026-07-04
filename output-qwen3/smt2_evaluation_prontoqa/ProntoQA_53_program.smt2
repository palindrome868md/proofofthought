; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Functions (Predicates)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-hot (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)

; 3. Declare Constants
(declare-const fae Entity)

; 4. Assert Knowledge Base (Rules and Facts)

; Numpuses are kind.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-kind x))))

; Each numpus is a wumpus.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-wumpus x))))

; Wumpuses are not wooden.
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-wooden x)))))

; Every zumpus is not dull.
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (is-dull x)))))

; Wumpuses are impuses.
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-impus x))))

; Impuses are not nervous.
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-nervous x)))))

; Each impus is a yumpus.
(assert (forall ((x Entity)) (=> (is-impus x) (is-yumpus x))))

; Every yumpus is hot.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-hot x))))

; Every yumpus is a vumpus.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-vumpus x))))

; Every vumpus is transparent.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-transparent x))))

; Vumpuses are rompuses.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-rompus x))))

; Rompuses are not small.
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-small x)))))

; Rompuses are jompuses.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-jompus x))))

; Jompuses are dull.
(assert (forall ((x Entity)) (=> (is-jompus x) (is-dull x))))

; Jompuses are dumpuses.
(assert (forall ((x Entity)) (=> (is-jompus x) (is-dumpus x))))

; Each dumpus is earthy.
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-earthy x))))

; Every dumpus is a tumpus.
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-tumpus x))))

; Fact: Fae is an impus.
(assert (is-impus fae))

; 5. Verification
; Question: Is Fae dull?
; We assert the statement to check if it is consistent (sat) or contradictory (unsat).
(assert (is-dull fae))

; 6. Check Satisfiability
(check-sat)
(get-model)