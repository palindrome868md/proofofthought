; Reasoning Steps:
; 1. Fae is a zumpus (Given).
; 2. Zumpuses are numpuses (Rule 6) -> Fae is a numpus.
; 3. Numpuses are yumpuses (Rule 8) -> Fae is a yumpus.
; 4. Yumpuses are rompus (Rule 11) -> Fae is a rompus.
; 5. Rompus are dumpus (Rule 13) -> Fae is a dumpus.
; 6. Dumpuses are not bright (Rule 14) -> Fae is NOT bright.
; 7. Question: Is Fae bright?
; 8. Verification: Assert (is-bright fae). Since KB implies (not (is-bright fae)), this creates a contradiction.
; 9. Expected Result: unsat (False).

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for types and properties)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-luminous (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-mean (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-orange (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)

; 3. Declare constants
(declare-const fae Entity)

; 4. Assert knowledge base (facts)
; Each impus is sour.
(assert (forall ((x Entity)) (=> (is-impus x) (is-sour x))))
; Each impus is a vumpus.
(assert (forall ((x Entity)) (=> (is-impus x) (is-vumpus x))))
; Each vumpus is cold.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-cold x))))
; Vumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-zumpus x))))
; Zumpuses are not luminous.
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (is-luminous x)))))
; Zumpuses are numpuses.
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-numpus x))))
; Every numpus is earthy.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-earthy x))))
; Every numpus is a yumpus.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-yumpus x))))
; Yumpuses are not mean.
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-mean x)))))
; Each tumpus is bright.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-bright x))))
; Each yumpus is a rompus.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-rompus x))))
; Each rompus is orange.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-orange x))))
; Every rompus is a dumpus.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-dumpus x))))
; Dumpuses are not bright.
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-bright x)))))
; Dumpuses are jompuses.
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-jompus x))))
; Every jompus is small.
(assert (forall ((x Entity)) (=> (is-jompus x) (is-small x))))
; Jompuses are wumpuses.
(assert (forall ((x Entity)) (=> (is-jompus x) (is-wumpus x))))
; Fae is a zumpus.
(assert (is-zumpus fae))

; 5. Test the statement: Fae is bright.
; We assert the statement to check if it is consistent with the KB.
; If unsat, the statement is False (contradicts KB).
(assert (is-bright fae))

; 6. Check satisfiability
(check-sat)
(get-model)