; Reasoning Steps:
; 1. Analyze Eligibility Rules from Document:
;    - Base Requirement: Care for someone at least 20 hours per week.
;    - Break Rule: Eligibility is maintained during breaks from caring of up to 12 weeks in a row.
;    - Other Criteria: Age (16 to State Pension age) and Recipient Benefits must be met.
; 2. Analyze Scenario Facts:
;    - Normal Care Hours: 25 hours per week (Meets >= 20 requirement).
;    - Break Duration: 6 weeks holiday (Meets <= 12 weeks requirement).
;    - Other Criteria: Assumed met (Question focuses on the holiday break impact).
; 3. Logical Deduction:
;    - Since 25 >= 20 and 6 <= 12, the break does not disqualify the carer.
;    - Eligibility should remain True.
; 4. SMT2 Verification Strategy:
;    - Assert the rules as implications.
;    - Assert the scenario facts.
;    - Assert the proposition "is-eligible".
;    - Check satisfiability. (Expected: sat, meaning "Yes, eligible").

; 1. Declare Constants
(declare-const care-hours Int)
(declare-const break-weeks Int)
(declare-const age-qualifies Bool)
(declare-const recipient-qualifies Bool)
(declare-const is-eligible Bool)

; 2. Assert Knowledge Base (Rules)
; Rule: If care hours >= 20, break <= 12 weeks, and other criteria met, then eligible
(assert (=> (and 
              (>= care-hours 20) 
              (<= break-weeks 12) 
              age-qualifies 
              recipient-qualifies) 
            is-eligible))

; 3. Assert Scenario Facts
; Fact: Normally care for 25 hours/week
(assert (= care-hours 25))
; Fact: Holiday break is 6 weeks
(assert (= break-weeks 6))
; Fact: Assume age and recipient benefit criteria are met (context of the question)
(assert age-qualifies)
(assert recipient-qualifies)

; 4. Verification
; Question: Am I still eligible for the Carers Credit whilst on holiday?
; Test: Assert eligibility
(assert is-eligible)

; 5. Check Satisfiability
(check-sat)
(get-model)