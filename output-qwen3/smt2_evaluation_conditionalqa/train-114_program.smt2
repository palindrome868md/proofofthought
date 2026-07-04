; Reasoning Steps:
; 1. Analyze Eligibility Rules from Document:
;    - Condition 1: Caring hours must be >= 20 per week.
;    - Condition 2: Income/Savings do NOT affect eligibility.
;    - Condition 3: Age must be 16+ and under State Pension age (Not specified in scenario, assume consistent).
;    - Condition 4: Recipient must receive specific benefits OR have Care Certificate (Not specified, assume consistent).
;
; 2. Analyze Scenario Facts:
;    - Caring hours = 22 per week.
;    - Income = £20,000 per annum.
;
; 3. Logical Verification:
;    - Check if Scenario Facts contradict Eligibility Rules.
;    - Hours: 22 >= 20 (Consistent).
;    - Income: £20,000 is irrelevant per rules (Consistent).
;    - Since no known facts contradict eligibility, the claim "I am eligible" is Satisfiable (True).
;
; 4. SMT2 Strategy:
;    - Declare constants for hours, income, and eligibility status.
;    - Assert the rule: Eligibility implies Hours >= 20.
;    - Assert the rule: Income has no constraint on eligibility (omitted).
;    - Assert scenario facts: Hours = 22, Income = 20000.
;    - Assert the hypothesis: is_eligible = true.
;    - Check satisfiability. (sat = Yes, unsat = No).

; 1. Declare Constants
(declare-const caring_hours Int)
(declare-const annual_income Int)
(declare-const is_eligible Bool)

; 2. Assert Knowledge Base (Rules)
; Rule: To be eligible, you must care for at least 20 hours a week.
; (=> is_eligible (>= caring_hours 20))
(assert (=> is_eligible (>= caring_hours 20)))

; Rule: Income does not affect eligibility.
; (No assertion linking annual_income to is_eligible)

; 3. Assert Scenario (Facts)
(assert (= caring_hours 22))
(assert (= annual_income 20000))

; 4. Verification Question: Will I be eligible?
; Test: Assert that the user is eligible.
(assert is_eligible)

; 5. Check Satisfiability
; Expected: sat (True) because 22 >= 20 and income is irrelevant.
(check-sat)
(get-model)