;------------------------------------------------------------
;  ESA eligibility model for a freelance graphic designer
;  recovering from COVID‑19 who has started taking work again
;------------------------------------------------------------

;--- Sorts ---------------------------------------------------
(declare-sort Person 0)

;--- Functions / Predicates ----------------------------------
; Personal attributes
(declare-fun is_freelancer (Person) Bool)          ; self‑employed
(declare-fun has_covid_recovery (Person) Bool)    ; recovering from COVID‑19
; Work activity
(declare-fun work_hours_per_week (Person) Int)    ; hours worked this week
(declare-fun weekly_earnings (Person) Int)        ; earnings this week (GBP)
; Benefit eligibility
(declare-fun can_claim_esa (Person) Bool)         ; true iff ESA may be claimed

;--- Constants -----------------------------------------------
(declare-const me Person)   ; the applicant

;--- Knowledge base (facts from the document) ----------------
; The applicant is a freelancer and is recovering from COVID‑19
(assert (is_freelancer me))
(assert (has_covid_recovery me))

; The applicant is now working again – we give concrete numbers
; that satisfy the limits described in the ESA guide:
;   less than 16 hrs/week and earnings not more than £143/week
(assert (= (work_hours_per_week me) 10))
(assert (= (weekly_earnings me) 100))

;--- General ESA rule (from the guidance) --------------------
; A person may continue to claim ESA while working IF
;   (a) they work < 16 hours per week, AND
;   (b) they earn ≤ £143 per week.
; The rule also requires a disabling health condition, which we
; model by `has_covid_recovery`.
(assert
  (forall ((p Person))
    (=> (and (has_covid_recovery p)
             (is_freelancer p)
             (< (work_hours_per_week p) 16)
             (<= (weekly_earnings p) 143))
        (can_claim_esa p))))

;--- Test the specific question --------------------------------
; "Can I still claim Employment and Support Allowance?"
; We assert that the applicant can claim ESA and ask Z3 whether this
; is consistent with the knowledge base.
(assert (can_claim_esa me))

;--- Check the result -------------------------------------------
(check-sat)
(get-model)