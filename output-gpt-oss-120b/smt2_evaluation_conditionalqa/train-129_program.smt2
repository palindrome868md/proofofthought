;--- Sorts (none needed beyond built‑ins) ---------------------------------

;--- Constants -------------------------------------------------------------
(declare-const hours_before Int)               ; hours per week before change
(declare-const hours_now    Int)               ; hours per week after change
(declare-const benefit_continuous_weeks Int)  ; weeks of continuous benefit claim
(declare-const expect_work_duration_weeks Int); weeks the higher‑hour work is expected
(declare-const has_income_based_benefit Bool) ; receiving Income Support / JSA / ESA
(declare-const entitled_to_housing Bool)       ; had Support for Mortgage Interest
(declare-const can_claim Bool)                 ; the statement we want to test

;--- Facts from the scenario ------------------------------------------------
(assert (= hours_before 10))          ; reduced to 10 h/week
(assert (= hours_now    40))          ; now 40 h/week (full‑time)
(assert (= benefit_continuous_weeks 16)) ; 4 months ≈ 16 weeks
(assert (= expect_work_duration_weeks 8)) ; expects work ≥5 weeks
(assert (= has_income_based_benefit true)) ; Income Support is income‑based
(assert (= entitled_to_housing true))      ; already had mortgage‑interest help

;--- Eligibility rule for Mortgage Interest Run‑On -------------------------
; Can claim iff ALL eligibility conditions hold
(define-fun eligibility () Bool
  (and
    has_income_based_benefit                    ; condition 1
    (>= benefit_continuous_weeks 26)            ; condition 2
    (>= expect_work_duration_weeks 5)           ; condition 3
    (> hours_now hours_before)                  ; condition 4 (more hours)
    entitled_to_housing                         ; condition 5
  )
)

;--- Link the rule to the proposition we are testing -----------------------
(assert (= can_claim eligibility))

;--- Test the claim: “I can claim Mortgage Interest Run‑On” ----------------
(assert can_claim)   ; we assert that the claim is true

;--- Solve ------------------------------------------------------------------
(check-sat)          ; expected result: unsat (the claim is false)
(get-model)