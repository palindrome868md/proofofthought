; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun in-uk (Person) Bool)
(declare-fun in-ghana (Person) Bool)
(declare-fun court-order-possible (Person Person Person) Bool)

; Constants
(declare-const father Person)
(declare-const mother Person)
(declare-const child Person)

; Knowledge base (scenario)
(assert (in-uk father))      ; the husband lives in the UK
(assert (in-ghana mother))    ; the caregiver lives in Ghana
(assert (in-ghana child))     ; the child lives in Ghana

; Question scenario: is there a court order that can be obtained to make father pay child maintenance?
(assert (court-order-possible father mother child))

; Check satisfiability (one and only one check)
(check-sat)
(get-model)