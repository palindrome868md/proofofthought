; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Functions (Predicates)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-floral (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-spicy (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-orange (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-amenable (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-feisty (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)

; 3. Declare Constants
(declare-const Rex Thing)

; 4. Assert Knowledge Base (Rules)
; Vumpuses are floral
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-floral x))))
; Vumpuses are wumpuses
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-wumpus x))))
; Each wumpus is not spicy
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (is-spicy x)))))
; Wumpuses are zumpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-zumpus x))))
; Zumpuses are orange
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-orange x))))
; Zumpuses are tumpuses
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-tumpus x))))
; Every tumpus is dull
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-dull x))))
; Every tumpus is a dumpus
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-dumpus x))))
; Every dumpus is amenable
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-amenable x))))
; Every yumpus is not opaque
(assert (forall ((x Thing)) (=> (is-yumpus x) (not (is-opaque x)))))
; Dumpuses are impuses
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-impus x))))
; Each impus is not feisty
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-feisty x)))))
; Every impus is a jompus
(assert (forall ((x Thing)) (=> (is-impus x) (is-jompus x))))
; Each jompus is opaque
(assert (forall ((x Thing)) (=> (is-jompus x) (is-opaque x))))
; Jompuses are numpuses
(assert (forall ((x Thing)) (=> (is-jompus x) (is-numpus x))))

; 5. Assert Facts
; Rex is a zumpus
(assert (is-zumpus Rex))

; 6. Verification Scenario
; Test Statement: Rex is not opaque
(assert (not (is-opaque Rex)))

; 7. Check Satisfiability
(check-sat)
(get-model)