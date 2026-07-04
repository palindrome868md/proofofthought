; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for types and properties)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-sweet (Entity) Bool)
(declare-fun is-brown (Entity) Bool)
(declare-fun is-aggressive (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-metallic (Entity) Bool)
(declare-fun is-cold (Entity) Bool)

; 3. Declare constants
(declare-const Polly Entity)

; 4. Assert knowledge base
; Fact: Polly is a rompus
(assert (is-rompus Polly))

; Rule: Every tumpus is a rompus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-rompus x))))
; Rule: Tumpuses are large
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-large x))))
; Rule: Rompuses are not transparent
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-transparent x)))))
; Rule: Each rompus is a zumpus
(assert (forall ((x Entity)) (=> (is-rompus x) (is-zumpus x))))
; Rule: Every zumpus is sweet
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-sweet x))))
; Rule: Each zumpus is a vumpus
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-vumpus x))))
; Rule: Every vumpus is brown
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-brown x))))
; Rule: Vumpuses are yumpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-yumpus x))))
; Rule: Yumpuses are not aggressive
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-aggressive x)))))
; Rule: Yumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-numpus x))))
; Rule: Numpuses are dull
(assert (forall ((x Entity)) (=> (is-numpus x) (is-dull x))))
; Rule: Each numpus is an impus
(assert (forall ((x Entity)) (=> (is-numpus x) (is-impus x))))
; Rule: Impuses are not metallic
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-metallic x)))))
; Rule: Each impus is a jompus
(assert (forall ((x Entity)) (=> (is-impus x) (is-jompus x))))
; Rule: Every dumpus is not dull
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-dull x)))))
; Rule: Jompuses are not cold
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-cold x)))))
; Rule: Jompuses are wumpuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-wumpus x))))

; 5. Verification
; Question: Is the following statement true or false? Polly is not dull.
; We assert the statement "Polly is not dull" to check if it is consistent with the KB.
; Logical Chain: Polly -> Rompus -> Zumpus -> Vumpus -> Yumpus -> Numpus -> Dull.
; Therefore, Polly IS dull. Asserting she is NOT dull should result in unsat.
(assert (not (is-dull Polly)))

; 6. Check satisfiability
(check-sat)
(get-model)