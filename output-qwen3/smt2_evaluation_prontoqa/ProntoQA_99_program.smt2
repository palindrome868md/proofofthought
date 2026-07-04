; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-happy (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-liquid (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)

; 3. Declare constants
(declare-const sam Entity)

; 4. Assert knowledge base (facts and rules)
; Dumpuses are cold
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-cold x))))
; Dumpuses are rompuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-rompus x))))
; Each rompus is red
(assert (forall ((x Entity)) (=> (is-rompus x) (is-red x))))
; Rompuses are numpuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-numpus x))))
; Numpuses are dull
(assert (forall ((x Entity)) (=> (is-numpus x) (is-dull x))))
; Each numpus is a yumpus
(assert (forall ((x Entity)) (=> (is-numpus x) (is-yumpus x))))
; Yumpuses are happy
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-happy x))))
; Every yumpus is a tumpus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-tumpus x))))
; Every tumpus is not kind
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-kind x)))))
; Every tumpus is a zumpus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-zumpus x))))
; Zumpuses are large
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-large x))))
; Every zumpus is a vumpus
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-vumpus x))))
; Vumpuses are earthy
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-earthy x))))
; Every vumpus is an impus
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-impus x))))
; Jompuses are not earthy
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-earthy x)))))
; Impuses are not liquid
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-liquid x)))))
; Impuses are wumpuses
(assert (forall ((x Entity)) (=> (is-impus x) (is-wumpus x))))

; Fact: Sam is a numpus
(assert (is-numpus sam))

; 5. Verify Question: Is "Sam is not earthy" true?
; To test this, we assert the statement and check satisfiability.
; If unsat, the statement contradicts the knowledge base (is False).
; If sat, the statement is consistent (is True).
(assert (not (is-earthy sam)))

; 6. Check satisfiability
(check-sat)
(get-model)