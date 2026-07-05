; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const carer Person)

; Declare functions
(declare-fun age (Person) Int)
(declare-fun hours-care (Person) Int)

; State Pension age (as a constant for the scenario)
(declare-const state_pension_age Int)

; Predicates
(declare-fun eligible (Person) Bool)

; Knowledge base: scenario details
(assert (= (age carer) 25))
(assert (= (hours-care carer) 22))
(assert (= state_pension_age 67))

; Carer's Credit eligibility rule:
; eligible if hours >= 20 and age >= 16 and age < state_pension_age
(assert (=> (and (>= (hours-care carer) 20)
                 (>= (age carer) 16)
                 (< (age carer) state_pension_age))
            (eligible carer)))

; Test: Will I be eligible? Negate the conclusion to test consistency
(assert (not (eligible carer)))

; Check satisfiability (only one check-sat as required)
(check-sat)
(get-model)