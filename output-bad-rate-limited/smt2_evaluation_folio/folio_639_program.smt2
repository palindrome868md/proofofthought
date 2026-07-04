; Sorts
(declare-sort Person 0)
(declare-sort Port 0)

; Constants
(declare-const william-dickinson Person)
(declare-const portland-whigs Port)

; Predicates
(declare-fun sat_in_house_of_commons (Person) Bool)
(declare-fun supports (Person Port) Bool)

; Premises
; 1) William Dickinson sat in the House of Commons
(assert (sat_in_house_of_commons william-dickinson))

; 2) William Dickinson supported the Portland Whigs
(assert (supports william-dickinson portland-whigs))

; 3) People who supported the Portland Whigs did not get a seat in the Parliament
(assert (forall ((p Person)) (=> (supports p portland-whigs) (not (sat_in_house_of_commons p)))))

; Test: Does William Dickinson sit in the House of Commons?
(assert (sat_in_house_of_commons william-dickinson))

; Check satisfiability
(check-sat)