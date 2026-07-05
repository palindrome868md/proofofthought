; Declare sorts
(declare-sort Person 0)

; Declare functions
(declare-fun height (Person) Int)

; Declare constants
(declare-const leila-george Person)
(declare-const min-model-height Int)

; Knowledge base
(assert (= (height leila-george) 150))
(assert (= min-model-height 170))

; Test: Does Leila George lack the height to be a model?
(assert (< (height leila-george) min-model-height))

; Check satisfiability
(check-sat)
(get-model)