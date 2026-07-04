; Declare sorts
(declare-sort Person 0)

; Declare functions
(declare-fun is-actress (Person) Bool)
(declare-fun height (Person) Int)
(declare-fun min-model-height () Int)

; Declare constants
(declare-const leila-george Person)

; Knowledge base
; Leila George is an actress
(assert (is-actress leila-george))

; Leila George's height is approximately 170 cm (5'7")
(assert (= (height leila-george) 170))

; Minimum height requirement for female models is 170 cm
(assert (= (min-model-height) 170))

; Test: Does Leila George lack the height to be a model?
; "Lack the height" means her height is strictly less than minimum requirement
(assert (< (height leila-george) (min-model-height)))

; Check satisfiability
(check-sat)
(get-model)