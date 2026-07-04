; Reasoning Steps:
; 1. Rex is a zumpus (Premise 18).
; 2. Zumpuses are tumpuses (Premise 6) -> Rex is a tumpus.
; 3. Each tumpus is a jompus (Premise 8) -> Rex is a jompus.
; 4. Every jompus is an impus (Premise 10) -> Rex is an impus.
; 5. Impuses are dumpuses (Premise 12) -> Rex is a dumpus.
; 6. Dumpuses are angry (Premise 13) -> Rex is angry.
; 7. Statement to test: "Rex is not angry".
; 8. This contradicts the derived fact "Rex is angry".
; 9. Expected result: unsat (Statement is False).

; Declare Sorts
(declare-sort Entity 0)

; Declare Functions (Predicates for Classes and Properties)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-liquid (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-happy (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-angry (Entity) Bool)
(declare-fun is-orange (Entity) Bool)

; Declare Constants
(declare-const rex Entity)

; Knowledge Base Assertions
; 1. Vumpuses are liquid
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-liquid x))))
; 2. Vumpuses are rompuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-rompus x))))
; 3. Every rompus is fruity
(assert (forall ((x Entity)) (=> (is-rompus x) (is-fruity x))))
; 4. Each rompus is a zumpus
(assert (forall ((x Entity)) (=> (is-rompus x) (is-zumpus x))))
; 5. Every zumpus is bright
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-bright x))))
; 6. Zumpuses are tumpuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-tumpus x))))
; 7. Each tumpus is happy
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-happy x))))
; 8. Each tumpus is a jompus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-jompus x))))
; 9. Jompuses are large
(assert (forall ((x Entity)) (=> (is-jompus x) (is-large x))))
; 10. Every jompus is an impus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-impus x))))
; 11. Impuses are cold
(assert (forall ((x Entity)) (=> (is-impus x) (is-cold x))))
; 12. Impuses are dumpuses
(assert (forall ((x Entity)) (=> (is-impus x) (is-dumpus x))))
; 13. Dumpuses are angry
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-angry x))))
; 14. Each dumpus is a yumpus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-yumpus x))))
; 15. Each yumpus is not orange
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-orange x)))))
; 16. Every wumpus is not angry
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-angry x)))))
; 17. Yumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-numpus x))))
; 18. Rex is a zumpus
(assert (is-zumpus rex))

; Verification: Test the statement "Rex is not angry"
; If this assertion leads to unsat, the statement is False.
; If this assertion leads to sat, the statement is True (possible).
(assert (not (is-angry rex)))

; Check Satisfiability
(check-sat)
(get-model)