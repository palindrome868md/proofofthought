; Sorts
(declare-sort Person 0)
(declare-sort Church 0)

; Predicates
(declare-fun recognizes-saint (Church Person) Bool)

; Constants
(declare-const ugcc Church)
(declare-const alexander-nevsky Person)

; Knowledge base: The Ukrainian Greek Catholic Church does not recognize Alexander Nevsky as a saint
(assert (not (recognizes-saint ugcc alexander-nevsky)))

; Test: Does UGCC recognize Alexander Nevsky as a saint?
(assert (recognizes-saint ugcc alexander-nevsky))

; Check satisfiability to answer the question
(check-sat)