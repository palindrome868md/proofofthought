;-------------------------------------------------
;  Declarations
;-------------------------------------------------
(declare-sort Person 0)

; Facts about a person
(declare-fun state_pension_age (Person) Bool)      ; true if at/state pension age
(declare-fun regular_employment (Person) Bool)    ; true if in regular work
(declare-fun eligible_rea (Person) Bool)          ; true ⇔ eligible for Reduced Earnings Allowance
(declare-fun gets_rea (Person) Bool)              ; actually receiving REA
(declare-fun gets_retirement (Person) Bool)       ; receiving Retirement Allowance

;-------------------------------------------------
;  Knowledge base (policy rules)
;-------------------------------------------------
; Rule: when both conditions hold, the person is **not** eligible for REA
(assert (forall ((p Person))
  (=> (and (state_pension_age p) (not (regular_employment p)))
      (not (eligible_rea p)))))

; Optional: when both conditions hold, the person gets Retirement Allowance
(assert (forall ((p Person))
  (=> (and (state_pension_age p) (not (regular_employment p)))
      (gets_retirement p))))

; Usually eligibility leads to receipt, but not needed for the proof
; (assert (forall ((p Person)) (=> (eligible_rea p) (gets_rea p))))

;-------------------------------------------------
;  Scenario: "I am currently getting REA, not in regular work, will turn 66"
;-------------------------------------------------
(declare-const me Person)

; Not in regular employment
(assert (not (regular_employment me)))

; Will soon reach State Pension age (treated as true for the check)
(assert (state_pension_age me))

; Currently receiving REA (hence we assume eligibility)
(assert (gets_rea me))
; For the purpose of the test we also assert eligibility explicitly
(assert (eligible_rea me))

;-------------------------------------------------
;  Verification: Is the scenario compatible with the policy?
;-------------------------------------------------
(check-sat)   ; Expected result: unsat → not eligible for REA
(get-model)