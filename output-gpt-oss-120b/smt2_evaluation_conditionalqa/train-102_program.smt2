;--- Sorts (none needed beyond built‑in Bool) ---------------------------------

;--- Declarations -------------------------------------------------------------
(declare-const apply_protection Bool)      ; you apply for a protection order
(declare-const informed_others Bool)       ; you have informed the other family members

;--- Knowledge base (rules from the document) --------------------------------
; If you apply for a one‑off decision, you must inform the other people
(assert (=> apply_protection informed_others))

;--- Test scenario: applying but NOT informing the other family members -------
(assert apply_protection)          ; you do apply
(assert (not informed_others))     ; you do NOT inform them

;--- Check whether this scenario is possible ----------------------------------
(check-sat)   ; expected result: unsat (the scenario contradicts the rule)
(get-model)