; Reasoning Steps:
; 1. Wren is a dumpus (Given).
; 2. Dumpuses are numpuses (Rule 6).
; 3. Numpuses are zumpuses (Rule 8).
; 4. Zumpuses are tumpuses (Rule 10).
; 5. Tumpuses are vumpuses (Rule 13).
; 6. Vumpuses are not liquid (Rule 14).
; 7. Therefore, Wren is not liquid.
; 8. To verify "Wren is liquid", we assert (is-liquid wren).
; 9. Expected result: unsat (False).

; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Functions (Predicates)
; Categories
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)

; Properties
(declare-fun is-dull (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-feisty (Thing) Bool)
(declare-fun is-mean (Thing) Bool)
(declare-fun is-earthy (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-liquid (Thing) Bool)
(declare-fun is-spicy (Thing) Bool)

; 3. Declare Constants
(declare-const wren Thing)

; 4. Assert Knowledge Base (Rules)
; Wumpuses are dull
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-dull x))))
; Wumpuses are rompuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-rompus x))))
; Every rompus is not cold
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-cold x)))))
; Rompuses are dumpuses
(assert (forall ((x Thing)) (=> (is-rompus x) (is-dumpus x))))
; Dumpuses are feisty
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-feisty x))))
; Dumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-numpus x))))
; Numpuses are mean
(assert (forall ((x Thing)) (=> (is-numpus x) (is-mean x))))
; Numpuses are zumpuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-zumpus x))))
; Every zumpus is not earthy
(assert (forall ((x Thing)) (=> (is-zumpus x) (not (is-earthy x)))))
; Every zumpus is a tumpus
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-tumpus x))))
; Every tumpus is opaque
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-opaque x))))
; Impuses are liquid
(assert (forall ((x Thing)) (=> (is-impus x) (is-liquid x))))
; Tumpuses are vumpuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-vumpus x))))
; Every vumpus is not liquid
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-liquid x)))))
; Vumpuses are jompuses
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-jompus x))))
; Each jompus is not spicy
(assert (forall ((x Thing)) (=> (is-jompus x) (not (is-spicy x)))))
; Jompuses are yumpuses
(assert (forall ((x Thing)) (=> (is-jompus x) (is-yumpus x))))

; Fact: Wren is a dumpus
(assert (is-dumpus wren))

; 5. Verification
; Test Statement: Wren is liquid
(assert (is-liquid wren))

; 6. Check Satisfiability
(check-sat)
(get-model)