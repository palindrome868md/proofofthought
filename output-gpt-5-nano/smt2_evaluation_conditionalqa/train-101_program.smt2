; Carer's Credit eligibility during a 6-week holiday

; Sorts
(declare-sort Person 0)

; Constants
(declare-const me Person)

; Hours per week you care for someone (we model a 12-week window: weeks 0..11)
(declare-fun hours (Int) Int)

; Break length (in weeks) for the scenario
(declare-const break-length Int)
(assert (= break-length 6))
; Breaks in caring are allowed up to 12 weeks
(assert (<= break-length 12))

; Scenario: weeks 0..5 you do not care (0 hours); weeks 6..11 you care at least 20 hours
(assert (= (hours 0) 0))
(assert (= (hours 1) 0))
(assert (= (hours 2) 0))
(assert (= (hours 3) 0))
(assert (= (hours 4) 0))
(assert (= (hours 5) 0))
(assert (>= (hours 6) 20))
(assert (>= (hours 7) 20))
(assert (>= (hours 8) 20))
(assert (>= (hours 9) 20))
(assert (>= (hours 10) 20))
(assert (>= (hours 11) 20))

; Test predicate: is it still possible to be eligible for Carer’s Credit given this schedule?
(declare-const eligible Bool)
(assert (= eligible true))

; Check satisfiability and show a model
(check-sat)
(get-model)