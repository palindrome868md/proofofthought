; Reasoning:
; 1. Sam is a wumpus.
; 2. Wumpuses -> Vumpuses -> Tumpuses -> Numpuses -> Zumpuses -> Sweet.
; 3. Therefore, Sam is sweet.
; 4. Statement to test: "Sam is not sweet".
; 5. We assert (not (is-sweet sam)) and check for satisfiability.
; 6. Expected: unsat (Statement is False).

(declare-sort Entity 0)

; Declare constant for Sam
(declare-const sam Entity)

; Declare predicates for types
(declare-fun is-impus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)

; Declare predicates for properties
(declare-fun is-large (Entity) Bool)
(declare-fun is-floral (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-sweet (Entity) Bool)
(declare-fun is-hot (Entity) Bool)
(declare-fun is-mean (Entity) Bool)
(declare-fun is-dull (Entity) Bool)

; Knowledge Base Assertions

; 1. Impuses are not large.
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-large x)))))

; 2. Each impus is a yumpus.
(assert (forall ((x Entity)) (=> (is-impus x) (is-yumpus x))))

; 3. Yumpuses are floral.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-floral x))))

; 4. Yumpuses are jompuses.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-jompus x))))

; 5. Jompuses are not transparent.
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-transparent x)))))

; 6. Each jompus is a wumpus.
(assert (forall ((x Entity)) (=> (is-jompus x) (is-wumpus x))))

; 7. Every wumpus is nervous.
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-nervous x))))

; 8. Wumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-vumpus x))))

; 9. Rompuses are not sweet.
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-sweet x)))))

; 10. Each vumpus is hot.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-hot x))))

; 11. Vumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-tumpus x))))

; 12. Every tumpus is mean.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-mean x))))

; 13. Tumpuses are numpuses.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-numpus x))))

; 14. Numpuses are dull.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-dull x))))

; 15. Numpuses are zumpuses.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-zumpus x))))

; 16. Zumpuses are sweet.
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-sweet x))))

; 17. Zumpuses are dumpuses.
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-dumpus x))))

; 18. Sam is a wumpus.
(assert (is-wumpus sam))

; Verification Test:
; Question: Is the statement "Sam is not sweet" true?
; We assert the statement and check for satisfiability.
; If unsat, the statement is False (contradicts KB).
(assert (not (is-sweet sam)))

; Check satisfiability
(check-sat)
(get-model)