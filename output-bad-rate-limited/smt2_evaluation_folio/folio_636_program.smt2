; Declare sorts
(declare-sort Person 0)
(declare-sort Issue 0)

; Declare constants
(declare-const william-dickinson Person)
(declare-const portland-whigs Issue)

; Declare predicates
(declare-fun sat-in-parliament (Person) Bool)
(declare-fun supports (Person Issue) Bool)

; Knowledge base
(assert (sat-in-parliament william-dickinson))            ; William Dickinson sat in Parliament
(assert (supports william-dickinson portland-whigs))     ; Dickinson supported the Portland Whigs
(assert (=> (supports william-dickinson portland-whigs)
            (not (sat-in-parliament william-dickinson))))  ; Portland Whigs supporters did not get a seat

; Test: "William Dickinson did not get a seat in Parliament."
(assert (not (sat-in-parliament william-dickinson)))

; Check satisfiability
(check-sat)