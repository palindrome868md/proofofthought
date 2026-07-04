; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun is-big (Person) Bool)
(declare-fun is-blue (Person) Bool)
(declare-fun is-green (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-white (Person) Bool)

; 3. Declare constants
(declare-const Bob Person)
(declare-const Gary Person)

; 4. Assert knowledge base (facts)
; Bob's facts
(assert (not (is-big Bob)))
(assert (is-blue Bob))
(assert (is-green Bob))
(assert (is-red Bob))
(assert (is-rough Bob))
(assert (is-round Bob))
(assert (not (is-white Bob)))

; Gary's facts
(assert (is-big Gary))
(assert (is-green Gary))
(assert (is-rough Gary))
(assert (is-round Gary))
(assert (is-white Gary))

; 5. Assert knowledge base (rules)
; Red, rough people are round
(assert (forall ((p Person))
  (=> (and (is-red p) (is-rough p))
      (is-round p))))

; Green people are round
(assert (forall ((p Person))
  (=> (is-green p)
      (is-round p))))

; All red, white people are round
(assert (forall ((p Person))
  (=> (and (is-red p) (is-white p))
      (is-round p))))

; If someone is blue and round then they are red
(assert (forall ((p Person))
  (=> (and (is-blue p) (is-round p))
      (is-red p))))

; Round, white people are big
(assert (forall ((p Person))
  (=> (and (is-round p) (is-white p))
      (is-big p))))

; All round people are blue
(assert (forall ((p Person))
  (=> (is-round p)
      (is-blue p))))

; 6. Verification: Bob is green.
; Assert the statement to check consistency.
; Since it is a fact in the KB, this should be satisfiable (True).
(assert (is-green Bob))

; 7. Check satisfiability
(check-sat)
(get-model)