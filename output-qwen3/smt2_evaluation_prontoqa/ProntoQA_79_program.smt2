; Reasoning Steps:
; 1. Stella is an impus (Fact).
; 2. Impuses are rompuses (Rule).
; 3. Rompuses are wumpuses (Rule).
; 4. Wumpuses are dumpuses (Rule).
; 5. Dumpuses are numpuses (Rule).
; 6. Numpuses are not blue (Rule).
; 7. Therefore, Stella is not blue.
; 8. The question asks if "Stella is blue" is true.
; 9. We assert (is-blue Stella) and check satisfiability.
; 10. Expected result: unsat (False), because it contradicts the derived fact that Stella is not blue.

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for properties)
(declare-fun is-impu (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-rompu (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-temperate (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)

; 3. Declare constants
(declare-const Stella Entity)

; 4. Assert knowledge base (facts and rules)
; Each impus is earthy
(assert (forall ((x Entity)) (=> (is-impu x) (is-earthy x))))
; Impuses are rompuses
(assert (forall ((x Entity)) (=> (is-impu x) (is-rompu x))))
; Rompuses are kind
(assert (forall ((x Entity)) (=> (is-rompu x) (is-kind x))))
; Rompuses are wumpuses
(assert (forall ((x Entity)) (=> (is-rompu x) (is-wumpus x))))
; Each wumpus is temperate
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-temperate x))))
; Each wumpus is a dumpus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-dumpus x))))
; Dumpuses are wooden
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-wooden x))))
; Each dumpus is a numpus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-numpus x))))
; Each numpus is not blue
(assert (forall ((x Entity)) (=> (is-numpus x) (not (is-blue x)))))
; Each numpus is a yumpus
(assert (forall ((x Entity)) (=> (is-numpus x) (is-yumpus x))))
; Each yumpus is large
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-large x))))
; Every yumpus is a vumpus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-vumpus x))))
; Vumpuses are dull
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-dull x))))
; Tumpuses are blue
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-blue x))))
; Vumpuses are jompuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-jompus x))))
; Each jompus is nervous
(assert (forall ((x Entity)) (=> (is-jompus x) (is-nervous x))))
; Jompuses are zumpuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-zumpus x))))

; Fact: Stella is an impus
(assert (is-impu Stella))

; 5. Check satisfiability
; Question: Is Stella blue?
; We assert the statement to verify if it is consistent with the KB.
(assert (is-blue Stella))

(check-sat)
(get-model)