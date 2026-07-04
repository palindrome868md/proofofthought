; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (Predicates for Categories and Properties)
; Categories
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)

; Properties
(declare-fun is-large (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-brown (Thing) Bool)
(declare-fun is-temperate (Thing) Bool)
(declare-fun is-liquid (Thing) Bool)
(declare-fun is-spicy (Thing) Bool)
(declare-fun is-nervous (Thing) Bool)

; 3. Declare constants
(declare-const wren Thing)

; 4. Assert knowledge base (facts and rules)

; Fact: Wren is a tumpus
(assert (is-tumpus wren))

; Rule: Every tumpus is large
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-large x))))

; Rule: Tumpuses are wumpuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-wumpus x))))

; Rule: Each wumpus is not opaque
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (is-opaque x)))))

; Rule: Every dumpus is not dull
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (is-dull x)))))

; Rule: Every wumpus is a rompus
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-rompus x))))

; Rule: Every rompus is brown
(assert (forall ((x Thing)) (=> (is-rompus x) (is-brown x))))

; Rule: Each rompus is a vumpus
(assert (forall ((x Thing)) (=> (is-rompus x) (is-vumpus x))))

; Rule: Each vumpus is temperate
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-temperate x))))

; Rule: Vumpuses are jompuses
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-jompus x))))

; Rule: Jompuses are dull
(assert (forall ((x Thing)) (=> (is-jompus x) (is-dull x))))

; Rule: Jompuses are numpuses
(assert (forall ((x Thing)) (=> (is-jompus x) (is-numpus x))))

; Rule: Every numpus is liquid
(assert (forall ((x Thing)) (=> (is-numpus x) (is-liquid x))))

; Rule: Each numpus is an impus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-impus x))))

; Rule: Impuses are spicy
(assert (forall ((x Thing)) (=> (is-impus x) (is-spicy x))))

; Rule: Every impus is a yumpus
(assert (forall ((x Thing)) (=> (is-impus x) (is-yumpus x))))

; Rule: Every yumpus is not nervous
(assert (forall ((x Thing)) (=> (is-yumpus x) (not (is-nervous x)))))

; Rule: Every yumpus is a zumpus
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-zumpus x))))

; 5. Verification
; Question: Is Wren dull?
; We assert the statement to check if it is satisfiable (True).
; Based on the chain: Tumpus -> Wumpus -> Rompus -> Vumpus -> Jompus -> Dull.
; Expected result: sat (True)
(assert (is-dull wren))

(check-sat)
(get-model)