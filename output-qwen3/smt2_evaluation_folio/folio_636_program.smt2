; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Group 0)

; 2. Declare functions
(declare-fun sat_in_house_of_commons (Person) Bool)
(declare-fun supported (Person Group) Bool)
(declare-fun seat_in_parliament (Person) Bool)

; 3. Declare constants
(declare-const william_dickinson Person)
(declare-const portland_whigs Group)

; 4. Assert knowledge base (facts)
; Premise 1: William Dickinson sat in the House of Commons
(assert (sat_in_house_of_commons william_dickinson))

; Premise 4: William Dickinson supported the Portland Whigs
(assert (supported william_dickinson portland_whigs))

; Premise 5: People who supported the Portland Whigs did not get a seat in the Parliament
(assert (forall ((p Person))
  (=> (supported p portland_whigs)
      (not (seat_in_parliament p)))))

; 5. Test Statement: William Dickinson did not get a seat in Parliament.
(assert (not (seat_in_parliament william_dickinson)))

; 6. Check satisfiability
(check-sat)
(get-model)