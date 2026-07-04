; Reasoning Steps:
; 1. Analyze the chain of classification for Stella:
;    - Fact: Stella is a vumpus.
;    - Rule: Vumpuses are dumpuses. => Stella is a dumpus.
;    - Rule: Each dumpus is a rompus. => Stella is a rompus.
;    - Rule: Each rompus is a wumpus. => Stella is a wumpus.
;    - Rule: Every wumpus is a zumpus. => Stella is a zumpus.
; 2. Analyze the property 'feisty' for Zumpuses:
;    - Rule: Zumpuses are not feisty. => Stella is not feisty.
; 3. Formulate the verification:
;    - To test "Stella is feisty", we assert (feisty Stella).
;    - If the solver returns 'unsat', the statement contradicts the knowledge base (False).
;    - If the solver returns 'sat', the statement is consistent (True).
; 4. Expected Outcome: unsat (Statement is False).

; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Constants
(declare-const Stella Entity)

; 3. Declare Functions (Category Predicates)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)

; 4. Declare Functions (Property Predicates)
(declare-fun large (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun bitter (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun feisty (Entity) Bool)
(declare-fun floral (Entity) Bool)

; 5. Assert Knowledge Base (Rules)
; Each impus is large
(assert (forall ((x Entity)) (=> (is-impus x) (large x))))
; Impuses are jompuses
(assert (forall ((x Entity)) (=> (is-impus x) (is-jompus x))))
; Jompuses are dull
(assert (forall ((x Entity)) (=> (is-jompus x) (dull x))))
; Each jompus is a vumpus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-vumpus x))))
; Vumpuses are bitter
(assert (forall ((x Entity)) (=> (is-vumpus x) (bitter x))))
; Vumpuses are dumpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-dumpus x))))
; Each dumpus is kind
(assert (forall ((x Entity)) (=> (is-dumpus x) (kind x))))
; Each dumpus is a rompus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-rompus x))))
; Rompuses are metallic
(assert (forall ((x Entity)) (=> (is-rompus x) (metallic x))))
; Each rompus is a wumpus
(assert (forall ((x Entity)) (=> (is-rompus x) (is-wumpus x))))
; Every wumpus is blue
(assert (forall ((x Entity)) (=> (is-wumpus x) (blue x))))
; Every wumpus is a zumpus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-zumpus x))))
; Numpuses are feisty
(assert (forall ((x Entity)) (=> (is-numpus x) (feisty x))))
; Zumpuses are not feisty
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (feisty x)))))
; Every zumpus is a yumpus
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-yumpus x))))
; Each yumpus is floral
(assert (forall ((x Entity)) (=> (is-yumpus x) (floral x))))
; Each yumpus is a tumpus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-tumpus x))))

; 6. Assert Facts
; Stella is a vumpus
(assert (is-vumpus Stella))

; 7. Verification Query
; Test the statement: Stella is feisty
(assert (feisty Stella))

; 8. Check Satisfiability
(check-sat)
(get-model)