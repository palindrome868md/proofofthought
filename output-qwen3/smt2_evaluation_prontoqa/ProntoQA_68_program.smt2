; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-large (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-fruity (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-spicy (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-liquid (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)

; 3. Declare constants
(declare-const wren Thing)

; 4. Assert knowledge base (facts and rules)
; Rompuses are large
(assert (forall ((x Thing)) (=> (is-rompus x) (is-large x))))
; Every rompus is a wumpus
(assert (forall ((x Thing)) (=> (is-rompus x) (is-wumpus x))))
; Every wumpus is not blue
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (is-blue x)))))
; Wumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-numpus x))))
; Numpuses are cold
(assert (forall ((x Thing)) (=> (is-numpus x) (is-cold x))))
; Numpuses are impuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-impus x))))
; Every impus is fruity
(assert (forall ((x Thing)) (=> (is-impus x) (is-fruity x))))
; Each impus is a jompus
(assert (forall ((x Thing)) (=> (is-impus x) (is-jompus x))))
; Every jompus is spicy
(assert (forall ((x Thing)) (=> (is-jompus x) (is-spicy x))))
; Jompuses are zumpuses
(assert (forall ((x Thing)) (=> (is-jompus x) (is-zumpus x))))
; Each vumpus is not spicy
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-spicy x)))))
; Zumpuses are not dull
(assert (forall ((x Thing)) (=> (is-zumpus x) (not (is-dull x)))))
; Zumpuses are yumpuses
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-yumpus x))))
; Yumpuses are liquid
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-liquid x))))
; Each yumpus is a tumpus
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-tumpus x))))
; Every tumpus is opaque
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-opaque x))))
; Tumpuses are dumpuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-dumpus x))))
; Wren is a rompus
(assert (is-rompus wren))

; 5. Test the statement: Wren is spicy
(assert (is-spicy wren))

; 6. Check satisfiability
(check-sat)
(get-model)