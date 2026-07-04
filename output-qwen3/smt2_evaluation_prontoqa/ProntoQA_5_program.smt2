; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (Predicates for properties/categories)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-mean (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-happy (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-temperate (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-large (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-earthy (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-sour (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)

; 3. Declare constants
(declare-const alex Thing)

; 4. Assert knowledge base (facts and rules)
; Rompuses are mean
(assert (forall ((x Thing)) (=> (is-rompus x) (is-mean x))))
; Rompuses are zumpuses
(assert (forall ((x Thing)) (=> (is-rompus x) (is-zumpus x))))
; Each zumpus is not happy
(assert (forall ((x Thing)) (=> (is-zumpus x) (not (is-happy x)))))
; Each zumpus is a numpus
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-numpus x))))
; Each numpus is not temperate
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-temperate x)))))
; Each numpus is a tumpus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-tumpus x))))
; Tumpuses are not large
(assert (forall ((x Thing)) (=> (is-tumpus x) (not (is-large x)))))
; Tumpuses are yumpuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-yumpus x))))
; Every yumpus is earthy
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-earthy x))))
; Each yumpus is a jompus
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-jompus x))))
; Jompuses are blue
(assert (forall ((x Thing)) (=> (is-jompus x) (is-blue x))))
; Every jompus is a wumpus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-wumpus x))))
; Wumpuses are not dull
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (is-dull x)))))
; Wumpuses are impuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-impus x))))
; Each vumpus is dull
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-dull x))))
; Impuses are sour
(assert (forall ((x Thing)) (=> (is-impus x) (is-sour x))))
; Impuses are dumpuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-dumpus x))))
; Alex is a numpus
(assert (is-numpus alex))

; 5. Check satisfiability (Verification)
; Question: Is the following statement true or false? Alex is not dull.
; Scenario: Alex is not dull.
(assert (not (is-dull alex)))

(check-sat)
(get-model)