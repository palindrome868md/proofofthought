; Reasoning Steps:
; 1. Wren is a tumpus (Given Fact).
; 2. Tumpuses are vumpuses (Rule 6) -> Wren is a vumpus.
; 3. Each vumpus is a jompus (Rule 8) -> Wren is a jompus.
; 4. Jompuses are numpuses (Rule 11) -> Wren is a numpus.
; 5. Numpuses are rompuses (Rule 13) -> Wren is a rompus.
; 6. Every rompus is feisty (Rule 14) -> Wren is feisty.
; 7. Query: Is "Wren is not feisty" true?
; 8. We assert (not (is-feisty wren)).
; 9. Since KB implies (is-feisty wren), this assertion creates a contradiction.
; 10. Expected result: unsat (meaning the statement "Wren is not feisty" is False).

; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Functions (Predicates for Categories)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)

; 3. Declare Functions (Predicates for Attributes)
(declare-fun is-sour (Thing) Bool)
(declare-fun is-aggressive (Thing) Bool)
(declare-fun is-transparent (Thing) Bool)
(declare-fun is-wooden (Thing) Bool)
(declare-fun is-feisty (Thing) Bool)
(declare-fun is-large (Thing) Bool)
(declare-fun is-red (Thing) Bool)

; 4. Declare Constants
(declare-const wren Thing)

; 5. Assert Knowledge Base (Rules)

; Rule 1: Every wumpus is sour.
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-sour x))))

; Rule 2: Wumpuses are yumpuses.
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-yumpus x))))

; Rule 3: Each yumpus is aggressive.
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-aggressive x))))

; Rule 4: Every yumpus is a tumpus.
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-tumpus x))))

; Rule 5: Every tumpus is transparent.
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-transparent x))))

; Rule 6: Tumpuses are vumpuses.
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-vumpus x))))

; Rule 7: Vumpuses are wooden.
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-wooden x))))

; Rule 8: Each vumpus is a jompus.
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-jompus x))))

; Rule 9: Each impus is not feisty.
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-feisty x)))))

; Rule 10: Every jompus is large.
(assert (forall ((x Thing)) (=> (is-jompus x) (is-large x))))

; Rule 11: Jompuses are numpuses.
(assert (forall ((x Thing)) (=> (is-jompus x) (is-numpus x))))

; Rule 12: Numpuses are red.
(assert (forall ((x Thing)) (=> (is-numpus x) (is-red x))))

; Rule 13: Numpuses are rompuses.
(assert (forall ((x Thing)) (=> (is-numpus x) (is-rompus x))))

; Rule 14: Every rompus is feisty.
(assert (forall ((x Thing)) (=> (is-rompus x) (is-feisty x))))

; Rule 15: Each rompus is a zumpus.
(assert (forall ((x Thing)) (=> (is-rompus x) (is-zumpus x))))

; 6. Assert Facts
; Fact 16: Wren is a tumpus.
(assert (is-tumpus wren))

; 7. Verification
; Question: Is the statement "Wren is not feisty" true?
; We assert the statement and check for satisfiability.
(assert (not (is-feisty wren)))

; 8. Check Satisfiability
(check-sat)
(get-model)