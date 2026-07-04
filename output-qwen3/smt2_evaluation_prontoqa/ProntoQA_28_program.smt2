; Reasoning Steps:
; 1. Alex is a rompus (Given Fact).
; 2. Rompuses are wumpuses (Rule 7). Therefore, Alex is a wumpus.
; 3. Wumpuses are yumpuses (Rule 9). Therefore, Alex is a yumpus.
; 4. Yumpuses are dumpuses (Rule 11). Therefore, Alex is a dumpus.
; 5. Dumpuses are tumpuses (Rule 13). Therefore, Alex is a tumpus.
; 6. Tumpuses are not small (Rule 14). Therefore, Alex is not small.
; 7. Question: Is "Alex is small" true?
; 8. Verification: Assert (is-small alex). If unsat, the statement is False.

; 1. Declare sorts
(declare-sort Creature 0)

; 2. Declare functions (predicates)
(declare-fun is-impus (Creature) Bool)
(declare-fun is-zumpus (Creature) Bool)
(declare-fun is-numpus (Creature) Bool)
(declare-fun is-rompus (Creature) Bool)
(declare-fun is-wumpus (Creature) Bool)
(declare-fun is-yumpus (Creature) Bool)
(declare-fun is-dumpus (Creature) Bool)
(declare-fun is-tumpus (Creature) Bool)
(declare-fun is-jompus (Creature) Bool)
(declare-fun is-vumpus (Creature) Bool)

(declare-fun is-small (Creature) Bool)
(declare-fun is-fruity (Creature) Bool)
(declare-fun is-bitter (Creature) Bool)
(declare-fun is-kind (Creature) Bool)
(declare-fun is-wooden (Creature) Bool)
(declare-fun is-temperate (Creature) Bool)
(declare-fun is-dull (Creature) Bool)
(declare-fun is-nervous (Creature) Bool)

; 3. Declare constants
(declare-const alex Creature)

; 4. Assert knowledge base (facts and rules)
; 1. Each impus is small.
(assert (forall ((x Creature)) (=> (is-impus x) (is-small x))))

; 2. Each zumpus is not fruity.
(assert (forall ((x Creature)) (=> (is-zumpus x) (not (is-fruity x)))))

; 3. Every zumpus is a numpus.
(assert (forall ((x Creature)) (=> (is-zumpus x) (is-numpus x))))

; 4. Each numpus is bitter.
(assert (forall ((x Creature)) (=> (is-numpus x) (is-bitter x))))

; 5. Numpuses are rompuses.
(assert (forall ((x Creature)) (=> (is-numpus x) (is-rompus x))))

; 6. Rompuses are kind.
(assert (forall ((x Creature)) (=> (is-rompus x) (is-kind x))))

; 7. Rompuses are wumpuses.
(assert (forall ((x Creature)) (=> (is-rompus x) (is-wumpus x))))

; 8. Every wumpus is not wooden.
(assert (forall ((x Creature)) (=> (is-wumpus x) (not (is-wooden x)))))

; 9. Wumpuses are yumpuses.
(assert (forall ((x Creature)) (=> (is-wumpus x) (is-yumpus x))))

; 10. Every yumpus is not temperate.
(assert (forall ((x Creature)) (=> (is-yumpus x) (not (is-temperate x)))))

; 11. Yumpuses are dumpuses.
(assert (forall ((x Creature)) (=> (is-yumpus x) (is-dumpus x))))

; 12. Every dumpus is dull.
(assert (forall ((x Creature)) (=> (is-dumpus x) (is-dull x))))

; 13. Dumpuses are tumpuses.
(assert (forall ((x Creature)) (=> (is-dumpus x) (is-tumpus x))))

; 14. Tumpuses are not small.
(assert (forall ((x Creature)) (=> (is-tumpus x) (not (is-small x)))))

; 15. Tumpuses are jompuses.
(assert (forall ((x Creature)) (=> (is-tumpus x) (is-jompus x))))

; 16. Every jompus is nervous.
(assert (forall ((x Creature)) (=> (is-jompus x) (is-nervous x))))

; 17. Each jompus is a vumpus.
(assert (forall ((x Creature)) (=> (is-jompus x) (is-vumpus x))))

; 18. Alex is a rompus.
(assert (is-rompus alex))

; 5. Verification
; Question: Is the statement "Alex is small" true?
; We assert the statement to check for consistency with the Knowledge Base.
(assert (is-small alex))

; 6. Check satisfiability
; Expected Result: unsat (False)
; Reason: Alex is a rompus -> wumpus -> yumpus -> dumpus -> tumpus -> not small.
; Asserting "Alex is small" contradicts "Alex is not small".
(check-sat)
(get-model)