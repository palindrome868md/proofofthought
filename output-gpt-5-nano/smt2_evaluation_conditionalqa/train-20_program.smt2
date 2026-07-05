; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun is-employee (Person) Bool)

; Declare constants
(declare-const me Person)
(declare-const current-tenure Int)
(declare-const weeks-until-qual Int)
(declare-const qualifiesMe Bool)

; Knowledge base
(assert (is-employee me))

; Scenario data
; You have been employed for 2 months (~8 weeks)
(assert (= current-tenure 8))
; There are 5 weeks until the qualifying week (qualifying week is 15 weeks before due date; due in 20 weeks)
(assert (= weeks-until-qual 5))

; Definition of qualification: tenure at qualifying week must be >= 26
(assert (= qualifiesMe
             (and (is-employee me)
                  (>= (+ current-tenure weeks-until-qual) 26)
                 )
            ))

; Test: Will I qualify for paternity leave?
(assert qualifiesMe)

; Check satisfiability
(check-sat)
(get-model)