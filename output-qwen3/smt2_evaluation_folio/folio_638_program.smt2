; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Institution 0)
(declare-sort Location 0)

; 2. Declare functions
(declare-fun attended (Person Institution) Bool)
(declare-fun is_university (Institution) Bool)
(declare-fun located_in (Institution Location) Bool)
(declare-fun sat_in_house_of_commons (Person) Bool)
(declare-fun supported_portland_whigs (Person) Bool)
(declare-fun got_seat_in_parliament (Person) Bool)

; 3. Declare constants
(declare-const william-dickinson Person)
(declare-const university-of-edinburgh Institution)
(declare-const westminster-school Institution)
(declare-const united-kingdom Location)

; 4. Assert knowledge base (premises)
; Premise 1: William Dickinson was a British politician who sat in the House of Commons
(assert (sat_in_house_of_commons william-dickinson))

; Premise 2: William Dickinson attended Westminster school for high school and then the University of Edinburgh.
(assert (attended william-dickinson westminster-school))
(assert (attended william-dickinson university-of-edinburgh))

; Premise 3: The University of Edinburgh is a university located in the United Kingdom.
(assert (is_university university-of-edinburgh))
(assert (located_in university-of-edinburgh united-kingdom))

; Premise 4: William Dickinson supported the Portland Whigs.
(assert (supported_portland_whigs william-dickinson))

; Premise 5: People who supported the Portland Whigs did not get a seat in the Parliament.
(assert (forall ((p Person))
  (=> (supported_portland_whigs p)
      (not (got_seat_in_parliament p)))))

; 5. Verify Statement: William Dickinson attended university in the United Kingdom.
; We assert the logical conjunction representing the statement using the known witness (University of Edinburgh).
(assert (and 
  (attended william-dickinson university-of-edinburgh)
  (is_university university-of-edinburgh)
  (located_in university-of-edinburgh united-kingdom)
))

; 6. Check satisfiability
(check-sat)
(get-model)