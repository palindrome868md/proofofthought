; Sorts
(declare-sort Person 0)

; Constants (people in scenario)
(declare-const p1 Person)
(declare-const p2 Person)

; Predicates / functions
(declare-fun is-employee (Person) Bool)
(declare-fun has-26-weeks (Person) Bool)
(declare-fun avg-earnings (Person) Int)
(declare-fun can-get-ShPP (Person) Bool)

; Knowledge base: both parents meet the eligibility criteria for SPL/ShPP
(assert (is-employee p1))
(assert (has-26-weeks p1))
(assert (>= (avg-earnings p1) 120))

(assert (is-employee p2))
(assert (has-26-weeks p2))
(assert (>= (avg-earnings p2) 120))

; Rule: if a parent is an eligible employee with enough earnings and 26 weeks, they can get ShPP
(assert (=> (and (is-employee p1) (has-26-weeks p1) (>= (avg-earnings p1) 120)) (can-get-ShPP p1)))
(assert (=> (and (is-employee p2) (has-26-weeks p2) (>= (avg-earnings p2) 120)) (can-get-ShPP p2)))

; Test scenario: would we still receive any sort of benefit? (at least one ShPP)
(assert (or (can-get-ShPP p1) (can-get-ShPP p2)))

; Check satisfiability and get a model
(check-sat)
(get-model)