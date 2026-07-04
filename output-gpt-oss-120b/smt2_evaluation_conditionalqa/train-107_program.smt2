; -------------------------------------------------
; 1. Sorts
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
; 2. Predicates (boolean functions)
; -------------------------------------------------
(declare-fun stoppedBenefit (Person) Bool)           ; stopped IS/JSA/ESA because of work
(declare-fun returningFullTime (Person) Bool)        ; now working full‑time
(declare-fun claimContinuously26 (Person) Bool)     ; 26‑week continuous claim
(declare-fun expectWorkAtLeast5Weeks (Person) Bool) ; work expected ≥5 weeks
(declare-fun hadHousingHelp (Person) Bool)           ; previously got Mortgage Interest
(declare-fun stillHousingCosts (Person) Bool)       ; will still have housing costs
(declare-fun eligible (Person) Bool)                ; Mortgage Interest Run‑On eligibility

; -------------------------------------------------
; 3. The individual in question
; -------------------------------------------------
(declare-const me Person)

; -------------------------------------------------
; 4. Knowledge base (facts from the scenario)
; -------------------------------------------------
; The person stopped the income‑based benefit because they are returning to work
(assert (stoppedBenefit me))
(assert (returningFullTime me))

; They were already receiving Mortgage Interest support
(assert (hadHousingHelp me))
(assert (stillHousingCosts me))

; The scenario does **not** tell us that they have a 26‑week continuous claim,
; so we explicitly state that this condition is *not* satisfied.
(assert (not (claimContinuously26 me)))

; (We do not assert anything about expectWorkAtLeast5Weeks;
; it may be true or false – it does not affect the final result
; because the missing 26‑week condition already blocks eligibility.)

; -------------------------------------------------
; 5. Eligibility definition (exact equivalence)
; -------------------------------------------------
; If all conditions hold, the person is eligible.
(assert (=> (and (stoppedBenefit me)
                 (returningFullTime me)
                 (claimContinuously26 me)
                 (expectWorkAtLeast5Weeks me)
                 (hadHousingHelp me)
                 (stillHousingCosts me))
            (eligible me)))

; Conversely, being eligible implies that all conditions must hold.
(assert (=> (eligible me)
            (and (stoppedBenefit me)
                 (returningFullTime me)
                 (claimContinuously26 me)
                 (expectWorkAtLeast5Weeks me)
                 (hadHousingHelp me)
                 (stillHousingCosts me))))

; -------------------------------------------------
; 6. Question to test: “Is the person eligible?”
; -------------------------------------------------
(assert (eligible me))

; -------------------------------------------------
; 7. Check the result
; -------------------------------------------------
(check-sat)   ; Expected: unsat (the person is NOT eligible)
(get-model)   ; Optional: shows why the query is unsatisfiable