; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Functions (Predicates for Types and Properties)
; Types
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)

; Properties
(declare-fun is-hot (Entity) Bool)
(declare-fun is-happy (Entity) Bool)
(declare-fun is-amenable (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-orange (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-dull (Entity) Bool)

; 3. Declare Constants
(declare-const sally Entity)

; 4. Assert Knowledge Base (Facts and Rules)

; Yumpuses are hot
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-hot x))))
; Each yumpus is a rompus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-rompus x))))
; Rompuses are happy
(assert (forall ((x Entity)) (=> (is-rompus x) (is-happy x))))
; Rompuses are impuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-impus x))))
; Each impus is not amenable
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-amenable x)))))
; Every impus is a dumpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-dumpus x))))
; Dumpuses are opaque
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-opaque x))))
; Dumpuses are tumpuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-tumpus x))))
; Numpuses are small
(assert (forall ((x Entity)) (=> (is-numpus x) (is-small x))))
; Tumpuses are orange
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-orange x))))
; Every tumpus is a wumpus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-wumpus x))))
; Wumpuses are not small
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-small x)))))
; Wumpuses are vumpuses
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-vumpus x))))
; Every vumpus is fruity
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-fruity x))))
; Every vumpus is a jompus
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-jompus x))))
; Jompuses are not dull
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-dull x)))))
; Every jompus is a zumpus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-zumpus x))))

; Specific Fact: Sally is a rompus
(assert (is-rompus sally))

; 5. Verification
; Question: Is Sally small?
; We assert the statement to test if it is consistent with the KB.
(assert (is-small sally))

; 6. Check Satisfiability
(check-sat)
(get-model)