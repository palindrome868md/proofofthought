; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (Predicates for categories and properties)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)

(declare-fun earthy (Entity) Bool)
(declare-fun bitter (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun happy (Entity) Bool)
(declare-fun liquid (Entity) Bool)

; 3. Declare constants
(declare-const sam Entity)

; 4. Assert knowledge base (facts and rules)
; Rompuses are not earthy
(assert (forall ((x Entity)) (=> (is-rompus x) (not (earthy x)))))
; Every rompus is a zumpus
(assert (forall ((x Entity)) (=> (is-rompus x) (is-zumpus x))))
; Zumpuses are not bitter
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (bitter x)))))
; Every zumpus is a jompus
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-jompus x))))
; Each jompus is dull
(assert (forall ((x Entity)) (=> (is-jompus x) (dull x))))
; Jompuses are vumpuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-vumpus x))))
; Numpuses are not transparent
(assert (forall ((x Entity)) (=> (is-numpus x) (not (transparent x)))))
; Every vumpus is not kind
(assert (forall ((x Entity)) (=> (is-vumpus x) (not (kind x)))))
; Vumpuses are tumpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-tumpus x))))
; Tumpuses are temperate
(assert (forall ((x Entity)) (=> (is-tumpus x) (temperate x))))
; Every tumpus is a yumpus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-yumpus x))))
; Yumpuses are happy
(assert (forall ((x Entity)) (=> (is-yumpus x) (happy x))))
; Yumpuses are dumpuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-dumpus x))))
; Every dumpus is liquid
(assert (forall ((x Entity)) (=> (is-dumpus x) (liquid x))))
; Dumpuses are wumpuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-wumpus x))))
; Wumpuses are transparent
(assert (forall ((x Entity)) (=> (is-wumpus x) (transparent x))))
; Wumpuses are impuses
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-impus x))))

; Fact: Sam is a vumpus
(assert (is-vumpus sam))

; 5. Test: Is the statement "Sam is not transparent" true?
; We assert the statement and check for satisfiability.
; If unsat, the statement contradicts the KB (False).
; If sat, the statement is consistent (True).
(assert (not (transparent sam)))

(check-sat)
(get-model)