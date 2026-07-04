; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-transparent (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-liquid (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-spicy (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-floral (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-hot (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-large (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)

; 3. Declare constants
(declare-const sam Thing)

; 4. Assert knowledge base (facts)
; Zumpuses are dull
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-dull x))))
; Every vumpus is not transparent
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-transparent x)))))
; Vumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-numpus x))))
; Numpuses are blue
(assert (forall ((x Thing)) (=> (is-numpus x) (is-blue x))))
; Numpuses are wumpuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-wumpus x))))
; Wumpuses are liquid
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-liquid x))))
; Each wumpus is a tumpus
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-tumpus x))))
; Tumpuses are not spicy
(assert (forall ((x Thing)) (=> (is-tumpus x) (not (is-spicy x)))))
; Tumpuses are rompuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-rompus x))))
; Each rompus is not dull
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-dull x)))))
; Rompuses are yumpuses
(assert (forall ((x Thing)) (=> (is-rompus x) (is-yumpus x))))
; Every yumpus is floral
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-floral x))))
; Every yumpus is an impus
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-impus x))))
; Impuses are hot
(assert (forall ((x Thing)) (=> (is-impus x) (is-hot x))))
; Each impus is a jompus
(assert (forall ((x Thing)) (=> (is-impus x) (is-jompus x))))
; Every jompus is large
(assert (forall ((x Thing)) (=> (is-jompus x) (is-large x))))
; Jompuses are dumpuses
(assert (forall ((x Thing)) (=> (is-jompus x) (is-dumpus x))))
; Sam is a vumpus
(assert (is-vumpus sam))

; 5. Check satisfiability
; Question: Is the following statement true or false? Sam is not dull.
; We assert the statement "Sam is not dull" to check if it is consistent (True) or contradictory (False).
(assert (not (is-dull sam)))

(check-sat)
(get-model)