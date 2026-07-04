; Sorts
(declare-sort Building 0)

; Constants
(declare-const emmet Building)
(declare-const blake Building)

; Predicates / Functions
(declare-fun is-five-story (Building) Bool)
(declare-fun built-year (Building) Int)
(declare-fun nrhp-year (Building) Int)

; Knowledge base (premises)
(assert (= emmet blake))                 ; Emmet Building is Blake McFall Building
(assert (is-five-story emmet))            ; Emmet is five-story
(assert (= (built-year emmet) 1915))     ; Emmet built in 1915
(assert (= (nrhp-year blake) 1990))       ; Blake Building NRHP year 1990

; Test: "A five-story building is built in 1915."
(assert (exists ((b Building))
  (and (is-five-story b) (= (built-year b) 1915))))

; Check satisfiability and model
(check-sat)
(get-model)