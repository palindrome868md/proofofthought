; Sort
(declare-sort Person 0)

; Constants
(declare-const thomas_barber Person)

; Predicates representing positions
(declare-fun played_as_halfback (Person) Bool)
(declare-fun played_as_inside_left (Person) Bool)

; Knowledge base (premises)
(assert (played_as_halfback thomas_barber))
(assert (played_as_inside_left thomas_barber))

; Test: Statement to verify
(assert (played_as_inside_left thomas_barber))

; Check satisfiability and obtain a model
(check-sat)
(get-model)