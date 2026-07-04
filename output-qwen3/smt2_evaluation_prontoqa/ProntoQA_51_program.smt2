; Reasoning Steps:
; 1. Analyze the premises to determine the properties of Max.
;    - Fact: Max is a vumpus.
;    - Rule: Every vumpus is a dumpus. -> Max is a dumpus.
;    - Rule: Dumpuses are rompuses. -> Max is a rompus.
;    - Rule: Rompuses are wumpuses. -> Max is a wumpus.
;    - Rule: Wumpuses are tumpuses. -> Max is a tumpus.
;    - Rule: Every tumpus is cold. -> Max is cold.
; 2. Analyze the statement to verify: "Max is not cold."
; 3. Compare derived fact (Max is cold) with statement (Max is not cold).
;    - They contradict each other.
; 4. SMT2 Verification Strategy:
;    - Assert the Knowledge Base (all rules and facts).
;    - Assert the statement to test: (not (cold Max)).
;    - Check satisfiability.
;    - If 'unsat', the statement contradicts the KB (Statement is False).
;    - If 'sat', the statement is consistent (Statement is True).
; 5. Expected Result: unsat (Statement is False).

(declare-sort Entity 0)

; Declare predicates for each property mentioned in the text
(declare-fun zumpus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun sweet (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun feisty (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)

; Declare constant for the specific entity Max
(declare-const Max Entity)

; --- Knowledge Base Assertions ---

; 1. Every zumpus is small.
(assert (forall ((x Entity)) (=> (zumpus x) (small x))))

; 2. Each zumpus is an impus.
(assert (forall ((x Entity)) (=> (zumpus x) (impus x))))

; 3. Every impus is sweet.
(assert (forall ((x Entity)) (=> (impus x) (sweet x))))

; 4. Impuses are vumpuses.
(assert (forall ((x Entity)) (=> (impus x) (vumpus x))))

; 5. Each vumpus is not feisty.
(assert (forall ((x Entity)) (=> (vumpus x) (not (feisty x)))))

; 6. Every vumpus is a dumpus.
(assert (forall ((x Entity)) (=> (vumpus x) (dumpus x))))

; 7. Every dumpus is not dull.
(assert (forall ((x Entity)) (=> (dumpus x) (not (dull x)))))

; 8. Dumpuses are rompuses.
(assert (forall ((x Entity)) (=> (dumpus x) (rompus x))))

; 9. Every rompus is transparent.
(assert (forall ((x Entity)) (=> (rompus x) (transparent x))))

; 10. Rompuses are wumpuses.
(assert (forall ((x Entity)) (=> (rompus x) (wumpus x))))

; 11. Each wumpus is not earthy.
(assert (forall ((x Entity)) (=> (wumpus x) (not (earthy x)))))

; 12. Wumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (tumpus x))))

; 13. Every tumpus is cold.
(assert (forall ((x Entity)) (=> (tumpus x) (cold x))))

; 14. Numpuses are not cold.
(assert (forall ((x Entity)) (=> (numpus x) (not (cold x)))))

; 15. Tumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))

; 16. Max is a vumpus.
(assert (vumpus Max))

; --- Verification ---
; Test Statement: "Max is not cold."
; We assert this statement to check if it is satisfiable given the KB.
(assert (not (cold Max)))

; Check satisfiability
; Expected: unsat (because KB implies Max IS cold)
(check-sat)

; Get model (will indicate no model exists if unsat)
(get-model)