; Reasoning Steps:
; 1. Define a generic sort 'Entity' to represent all objects (Sam, impuses, etc.).
; 2. Declare predicates for each category (is-impu, is-rompus, etc.) and property (is-bright, is-shy, etc.).
; 3. Declare constant 'sam'.
; 4. Encode the knowledge base rules as universal quantifications.
;    - Chain: Sam -> Yumpus -> Numpus -> Dumpus -> Vumpus -> Tumpus -> Not Shy.
; 5. Assert the fact: Sam is a yumpus.
; 6. Verification: To test "Sam is shy", assert (is-shy sam).
;    - Since KB implies (not (is-shy sam)), this should result in 'unsat'.
;    - 'unsat' means the statement "Sam is shy" is False.

; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Functions (Predicates)
; Categories
(declare-fun is-impu (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)

; Properties
(declare-fun is-bright (Entity) Bool)
(declare-fun is-floral (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-bitter (Entity) Bool)
(declare-fun is-mean (Entity) Bool)
(declare-fun is-shy (Entity) Bool)
(declare-fun is-temperate (Entity) Bool)

; 3. Declare Constants
(declare-const sam Entity)

; 4. Assert Knowledge Base
; Impuses are bright.
(assert (forall ((x Entity)) (=> (is-impu x) (is-bright x))))
; Every impus is a rompus.
(assert (forall ((x Entity)) (=> (is-impu x) (is-rompus x))))
; Rompuses are floral.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-floral x))))
; Each rompus is a yumpus.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-yumpus x))))
; Every yumpus is opaque.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-opaque x))))
; Yumpuses are numpuses.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-numpus x))))
; Each numpus is red.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-red x))))
; Every numpus is a dumpus.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-dumpus x))))
; Dumpuses are bitter.
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-bitter x))))
; Every dumpus is a vumpus.
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-vumpus x))))
; Vumpuses are not mean.
(assert (forall ((x Entity)) (=> (is-vumpus x) (not (is-mean x)))))
; Vumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-tumpus x))))
; Tumpuses are not shy.
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-shy x)))))
; Each wumpus is shy.
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-shy x))))
; Tumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-zumpus x))))
; Each zumpus is temperate.
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-temperate x))))
; Zumpuses are jompuses.
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-jompus x))))

; Fact: Sam is a yumpus.
(assert (is-yumpus sam))

; 5. Verification
; Question: Is Sam shy?
; We assert the statement to test. If unsat, the statement is False.
(assert (is-shy sam))

; 6. Check Satisfiability
(check-sat)
(get-model)