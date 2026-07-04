; ==============================================================================
; Reasoning Steps:
; ==============================================================================
; 1. Analyze Knowledge Base (KB):
;    - Fact: Erin is red.
;    - Rule: All red things are nice. (forall x, is-red(x) => is-nice(x))
;    - Rule: If Erin is nice, then Erin is cold. (is-nice(erin) => is-cold(erin))
;    - Rule: If Erin is cold, then Erin is big. (is-cold(erin) => is-big(erin))
;
; 2. Logical Deduction:
;    - From "Erin is red" and "All red things are nice", we derive "Erin is nice".
;    - From "Erin is nice" and "If Erin is nice then Erin is cold", we derive "Erin is cold".
;
; 3. Analyze Question:
;    - Statement to verify: "Erin is not cold."
;
; 4. Verification Strategy:
;    - Assert the Knowledge Base.
;    - Assert the Statement ("Erin is not cold").
;    - Check Satisfiability.
;    - If 'unsat': The statement contradicts the KB (Statement is False).
;    - If 'sat': The statement is consistent with the KB (Statement is Possible/True).
;
; 5. Expected Result:
;    - Since KB proves "Erin is cold", asserting "Erin is not cold" creates a contradiction.
;    - Expected: unsat.
; ==============================================================================

; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Functions (Predicates)
(declare-fun is-red (Thing) Bool)
(declare-fun is-nice (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-big (Thing) Bool)

; 3. Declare Constants
(declare-const erin Thing)

; 4. Assert Knowledge Base (Facts and Rules)
; Fact: Erin is red
(assert (is-red erin))

; Rule: Red things are nice
(assert (forall ((x Thing))
  (=> (is-red x) (is-nice x))))

; Rule: If Erin is nice then Erin is cold
(assert (=> (is-nice erin) (is-cold erin)))

; Rule: If Erin is cold then Erin is big
(assert (=> (is-cold erin) (is-big erin)))

; 5. Assert Question Scenario
; Question: Erin is not cold.
(assert (not (is-cold erin)))

; 6. Check Satisfiability
(check-sat)

; 7. Get Model (if sat)
(get-model)