; Reasoning Steps:
; 1. Sam is a dumpus (Fact).
; 2. Dumpuses are wumpuses (Rule). Therefore, Sam is a wumpus.
; 3. Wumpuses are zumpuses (Rule). Therefore, Sam is a zumpus.
; 4. Zumpuses are impuses (Rule). Therefore, Sam is an impus.
; 5. Impuses are yumpuses (Rule). Therefore, Sam is a yumpus.
; 6. Yumpuses are opaque (Rule). Therefore, Sam is opaque.
; 7. Question: Is "Sam is not opaque" true?
; 8. Verification: Assert (not (is-opaque sam)).
; 9. Expected Result: unsat (because Sam MUST be opaque, so "Sam is not opaque" contradicts the KB).

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (Predicates)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-bitter (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)

; 3. Declare constants
(declare-const sam Entity)

; 4. Assert knowledge base (facts and rules)
; Jompuses are dull
(assert (forall ((x Entity)) (=> (is-jompus x) (is-dull x))))
; Each jompus is a rompus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-rompus x))))
; Each rompus is nervous
(assert (forall ((x Entity)) (=> (is-rompus x) (is-nervous x))))
; Rompuses are dumpuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-dumpus x))))
; Every dumpus is kind
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-kind x))))
; Dumpuses are wumpuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-wumpus x))))
; Tumpuses are not opaque
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-opaque x)))))
; Each wumpus is bitter
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-bitter x))))
; Each wumpus is a zumpus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-zumpus x))))
; Every zumpus is fruity
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-fruity x))))
; Zumpuses are impuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-impus x))))
; Impuses are wooden
(assert (forall ((x Entity)) (=> (is-impus x) (is-wooden x))))
; Each impus is a yumpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-yumpus x))))
; Every yumpus is opaque
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-opaque x))))
; Every yumpus is a vumpus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-vumpus x))))
; Every vumpus is small
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-small x))))
; Vumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-numpus x))))
; Sam is a dumpus
(assert (is-dumpus sam))

; 5. Test Scenario: Sam is not opaque
(assert (not (is-opaque sam)))

; 6. Check satisfiability
(check-sat)
(get-model)