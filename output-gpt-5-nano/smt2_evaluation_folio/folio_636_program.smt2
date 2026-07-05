; Sorts
(declare-sort Person 0)
(declare-sort Group 0)

; Constants
(declare-const william-dickinson Person)
(declare-const Portland-Whigs Group)

; Predicates / Functions
(declare-fun seat (Person) Bool)
(declare-fun supports (Person Group) Bool)

; Knowledge Base (Premises)
; 1) William Dickinson sat in Parliament
(assert (seat william-dickinson))

; 2) William Dickinson supported the Portland Whigs
(assert (supports william-dickinson Portland-Whigs))

; 3) Rule: People who supported the Portland Whigs did not get a seat
(assert
  (forall ((p Person))
    (=> (supports p Portland-Whigs)
        (not (seat p)))))

; Test: "William Dickinson did not get a seat in Parliament."
(assert (not (seat william-dickinson)))

; Decision
(check-sat)
(get-model)