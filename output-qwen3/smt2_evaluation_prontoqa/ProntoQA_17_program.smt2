; Reasoning Steps:
; 1. Fae is a numpus (Given Fact).
; 2. Every numpus is a wumpus -> Fae is a wumpus.
; 3. Each wumpus is a jompus -> Fae is a jompus.
; 4. Each jompus is a yumpus -> Fae is a yumpus.
; 5. Yumpuses are vumpuses -> Fae is a vumpus.
; 6. Vumpuses are opaque -> Fae is opaque.
; 
; Question: Is the statement "Fae is not opaque" true or false?
; Logic Derivation: Fae IS opaque.
; Therefore, "Fae is not opaque" is FALSE.
; 
; SMT Verification:
; We assert the Knowledge Base and the statement "Fae is not opaque".
; If the result is 'unsat', the statement contradicts the KB (is False).
; If the result is 'sat', the statement is consistent (is True).
; Expected Result: unsat.

; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Predicates (Functions returning Bool)
; Types
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)

; Properties
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-liquid (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-temperate (Entity) Bool)

; 3. Declare Constants
(declare-const Fae Entity)

; 4. Assert Knowledge Base
; Each numpus is not nervous.
(assert (forall ((x Entity)) (=> (is-numpus x) (not (is-nervous x)))))
; Every numpus is a wumpus.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-wumpus x))))
; Wumpuses are liquid.
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-liquid x))))
; Each wumpus is a jompus.
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-jompus x))))
; Jompuses are fruity.
(assert (forall ((x Entity)) (=> (is-jompus x) (is-fruity x))))
; Zumpuses are not opaque.
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (is-opaque x)))))
; Each jompus is a yumpus.
(assert (forall ((x Entity)) (=> (is-jompus x) (is-yumpus x))))
; Every yumpus is kind.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-kind x))))
; Yumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-vumpus x))))
; Vumpuses are opaque.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-opaque x))))
; Every vumpus is an impus.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-impus x))))
; Impuses are not small.
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-small x)))))
; Impuses are rompuses.
(assert (forall ((x Entity)) (=> (is-impus x) (is-rompus x))))
; Rompuses are dull.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-dull x))))
; Rompuses are tumpuses.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-tumpus x))))
; Every tumpus is temperate.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-temperate x))))
; Every tumpus is a dumpus.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-dumpus x))))
; Fae is a numpus.
(assert (is-numpus Fae))

; 5. Verification
; Test Statement: Fae is not opaque.
(assert (not (is-opaque Fae)))

; 6. Check Satisfiability
(check-sat)
(get-model)

; Expected Output: unsat
; Interpretation: The statement "Fae is not opaque" is FALSE.