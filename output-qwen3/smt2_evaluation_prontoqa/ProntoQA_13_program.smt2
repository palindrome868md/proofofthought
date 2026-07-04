; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates for properties and classes)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-floral (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-hot (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-large (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-spicy (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-amenable (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-metallic (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)

; 3. Declare constants
(declare-const max Thing)

; 4. Assert knowledge base (facts and rules)
; Each yumpus is opaque
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-opaque x))))
; Each yumpus is a dumpus
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-dumpus x))))
; Vumpuses are not dull
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-dull x)))))
; Dumpuses are floral
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-floral x))))
; Each dumpus is a zumpus
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-zumpus x))))
; Each zumpus is hot
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-hot x))))
; Every zumpus is an impus
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-impus x))))
; Each impus is large
(assert (forall ((x Thing)) (=> (is-impus x) (is-large x))))
; Every impus is a rompus
(assert (forall ((x Thing)) (=> (is-impus x) (is-rompus x))))
; Rompuses are spicy
(assert (forall ((x Thing)) (=> (is-rompus x) (is-spicy x))))
; Each rompus is a numpus
(assert (forall ((x Thing)) (=> (is-rompus x) (is-numpus x))))
; Numpuses are amenable
(assert (forall ((x Thing)) (=> (is-numpus x) (is-amenable x))))
; Each numpus is a jompus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-jompus x))))
; Jompuses are dull
(assert (forall ((x Thing)) (=> (is-jompus x) (is-dull x))))
; Each jompus is a wumpus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-wumpus x))))
; Wumpuses are not metallic
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (is-metallic x)))))
; Every wumpus is a tumpus
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-tumpus x))))
; Max is a zumpus
(assert (is-zumpus max))

; 5. Verify Question: Is Max dull?
; Assert the statement to test
(assert (is-dull max))

; Check satisfiability
(check-sat)
(get-model)