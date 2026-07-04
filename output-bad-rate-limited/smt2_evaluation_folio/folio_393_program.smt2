; Sorts
(declare-sort City 0)
(declare-sort State 0)
(declare-sort Building 0)

; Location datatype: Location = mk-location(city: City, state: State)
(declare-datatypes () ((Location (mk-location (city City) (state State)))))

; Constants
(declare-const emmet-building Building)
(declare-const blake-building Building)
(declare-const portland City)
(declare-const oregon State)

; Functions
(declare-fun located-in (Building) Location)
(declare-fun num-floors (Building) Int)
(declare-fun built-year (Building) Int)

; Knowledge base (premises)
; The Emmet Building is five stories
(assert (= (num-floors emmet-building) 5))
; The Emmet Building is located in Portland, Oregon
(assert (= (located-in emmet-building) (mk-location portland oregon)))
; The Emmet Building is the Blake McFall Building (same building)
(assert (= emmet-building blake-building))

; Test: Is the Blake McFall Building located in Portland, Oregon?
; Negation of the statement to test whether the statement is entailed by KB
(assert (not (= (located-in blake-building) (mk-location portland oregon))))

; Check satisfiability and provide a model if SAT
(check-sat)
(get-model)