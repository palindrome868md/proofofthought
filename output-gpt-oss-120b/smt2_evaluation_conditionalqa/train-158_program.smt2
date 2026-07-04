;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions ------------------------------------------------------
(declare-fun caresHours     (Person) Int)          ; hours of care per week
(declare-fun earnings       (Person) Int)          ; weekly earnings after deductions
(declare-fun caresFor       (Person Person) Bool) ; caresFor(carer, cared)
(declare-fun partnerBenefit (Person) Bool)        ; receives qualifying benefit
(declare-fun eligible       (Person) Bool)        ; can claim Carer's Allowance

;--- Constants ------------------------------------------------------
(declare-const me      Person) ; the carer (you)
(declare-const partner Person) ; the disabled partner

;--- Knowledge Base -------------------------------------------------
; Partner receives Disability Living Allowance (higher rate) → qualifies
(assert (partnerBenefit partner))

; You care for the partner about 30 hours a week
(assert (= (caresHours me) 30))

; You work part‑time, earning roughly £500 per calendar month ≈ £125 per week
(assert (= (earnings me) 125))

; You do indeed care for this partner
(assert (caresFor me partner))

; Eligibility rule: to be eligible you must satisfy all the statutory conditions
(assert (forall ((c Person) (p Person))
        (=> (eligible c)
            (and (>= (caresHours c) 35)          ; at least 35 h/week
                 (<= (earnings c) 128)           ; earnings not above £128/week
                 (partnerBenefit p)              ; cared‑for receives qualifying benefit
                 (caresFor c p)))))               ; you care for that person

;--- Question: Can I claim Carer's Allowance? ----------------------
; We test the claim by asserting that the carer is eligible.
(assert (eligible me))

;--- Solve -----------------------------------------------------------
(check-sat)   ; expected result: unsat (the claim is not possible)
(get-model)