; SMT-LIB 2.0 Program to verify compensation claim eligibility
; Based on Armed Forces Compensation Scheme (AFCS) and War Pension Scheme (WPS) rules

; 1. Declare Sorts
; We use built-in sorts Int and Bool

; 2. Declare Constants for Scenario and Rules
(declare-const current_year Int)
(declare-const injury_year Int)
(declare-const afcs_cutoff_year Int)
(declare-const is_late_onset Bool)
(declare-const is_serving Bool)
(declare-const can_claim Bool)

; 3. Assert Knowledge Base (Rules from Document)

; Set the AFCS cutoff date (6 April 2005)
(assert (= afcs_cutoff_year 2005))

; Rule 1: AFCS Eligibility (Injury after 5 April 2005)
; Must apply within 7 years of injury/illness OR be a late onset illness
(assert (=> (> injury_year afcs_cutoff_year)
    (=> can_claim
        (or (<= (- current_year injury_year) 7)
            is_late_onset))))

; Rule 2: WPS Eligibility (Injury before 6 April 2005)
; No time limits, but must be no longer serving
(assert (=> (<= injury_year afcs_cutoff_year)
    (=> can_claim
        (not is_serving))))

; 4. Assert Scenario Facts

; Current year context (Document implies current rates, e.g., £151.40/week)
; Assuming current year is 2024 for calculation
(assert (= current_year 2024))

; Scenario: "Injured while serving 10 years ago"
(assert (= injury_year (- current_year 10)))

; Scenario: "Severity of my illness has increased"
; This does not qualify as "late onset" (illness started later)
; It implies the condition existed and worsened.
(assert (= is_late_onset false))

; Scenario: "Now no longer able to work"
; Implies discharged/not serving (Required for WPS, allowed for AFCS)
(assert (= is_serving false))

; 5. Verification
; Question: "Can I still claim compensation?"
; We assert that claiming IS possible and check for satisfiability.
; If unsat, it means claiming is NOT possible under the rules.
(assert can_claim)

; 6. Check Satisfiability
(check-sat)
(get-model)