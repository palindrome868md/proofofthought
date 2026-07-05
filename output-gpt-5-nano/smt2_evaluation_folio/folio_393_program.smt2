; Sorts
(declare-sort Building 0)
(declare-sort Person 0)
(declare-sort City 0)

; Constants
(declare-const blake Building)
(declare-const emmet Building)
(declare-const john Person)
(declare-const portland City)

; Predicates / Functions
(declare-fun year-listed (Building) Int)
(declare-fun built-year (Building) Int)
(declare-fun stories (Building) Int)
(declare-fun location (Building) City)
(declare-fun works-at (Person Building) Bool)

; Facts (Premises)
(assert (= (built-year emmet) 1915))        ; Emmet Building built in 1915
(assert (= (stories emmet) 5))               ; Emmet Building is five-story
(assert (= emmet blake))                     ; Emmet Building is another name for Blake McFall Building
(assert (= (location emmet) portland))       ; Emmet Building is in Portland
(assert (= (year-listed blake) 1990))        ; Blake listed on NRHP in 1990
(assert (works-at john emmet))                ; John works at Emmet Building

; Test: The Blake McFall Company Building is located in Portland, Oregon.
(assert (= (location blake) portland))

; Check satisfiability
(check-sat)
(get-model)