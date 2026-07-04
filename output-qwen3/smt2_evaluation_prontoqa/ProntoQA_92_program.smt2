; Reasoning Steps:
; 1. Identify the goal: Determine if "Sally is metallic" is True or False.
; 2. Map the logic chain from the text:
;    - Sally is a Wumpus.
;    - Wumpus -> Dumpus.
;    - Dumpus -> Zumpus.
;    - Zumpus -> Rompus.
;    - Rompus -> Impus.
;    - Impus -> Metallic.
; 3. Conclusion: Sally must be Metallic.
; 4. Verification Strategy: Assert the Knowledge Base, assert "Sally is Metallic", and check satisfiability.
;    - If SAT: The statement is consistent/True given the KB.
;    - If UNSAT: The statement contradicts the KB (False).
; 5. Expected Result: SAT (True).

; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Constants
(declare-const sally Entity)

; 3. Declare Functions (Predicates for Categories and Properties)
; Categories
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)

; Properties
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-shy (Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-metallic (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-spicy (Entity) Bool)

; 4. Assert Knowledge Base (Rules)
; Wumpuses are transparent
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-transparent x))))
; Each wumpus is a dumpus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-dumpus x))))
; Dumpuses are shy
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-shy x))))
; Every dumpus is a zumpus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-zumpus x))))
; Each zumpus is cold
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-cold x))))
; Zumpuses are rompuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-rompus x))))
; Every rompus is not red
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-red x)))))
; Rompuses are impuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-impus x))))
; Each impus is metallic
(assert (forall ((x Entity)) (=> (is-impus x) (is-metallic x))))
; Each impus is a numpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-numpus x))))
; Every numpus is fruity
(assert (forall ((x Entity)) (=> (is-numpus x) (is-fruity x))))
; Numpuses are jompuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-jompus x))))
; Tumpuses are not metallic
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-metallic x)))))
; Jompuses are dull
(assert (forall ((x Entity)) (=> (is-jompus x) (is-dull x))))
; Jompuses are vumpuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-vumpus x))))
; Vumpuses are spicy
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-spicy x))))
; Every vumpus is a yumpus
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-yumpus x))))

; 5. Assert Knowledge Base (Facts)
; Sally is a wumpus
(assert (is-wumpus sally))

; 6. Verification
; Test: Is Sally metallic?
; We assert the statement. If SAT, it is True (consistent). If UNSAT, it is False (contradiction).
(assert (is-metallic sally))

; 7. Check Satisfiability
(check-sat)
(get-model)