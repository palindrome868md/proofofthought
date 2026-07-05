(declare-sort Person 0)

; Constants
(declare-const jp-morgan Person)

; Predicates
(declare-fun healthy-lungs (Person) Bool)

; Knowledge base (empty for this simple test)

; Test: Did J. P. Morgan have healthy lungs?
(assert (healthy-lungs jp-morgan))

(check-sat)
(get-model)